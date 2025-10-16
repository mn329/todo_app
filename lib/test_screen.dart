import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final countProvider = StateProvider((ref) {
  return 0;
});

class TestScreen extends ConsumerWidget {
  const TestScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // countProvideを監視
    final count = ref.watch(countProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text('テスト画面'),
      ),
      body: ListView(
        children: [
          ElevatedButton(
            onPressed: () {
              ref.read(countProvider.notifier).state = count - 2;
            },
            child: Text('countUp'),
          ),
          Text(count.toString()),
        ],
      ),
    );
  }
}
