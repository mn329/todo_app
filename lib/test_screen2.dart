import 'package:flutter/material.dart';
import 'provider/count_down_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TestScreen2 extends ConsumerWidget {
  const TestScreen2({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // countDownProviderを監視
    final count = ref.watch(countDownProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text('テスト画面2'),
      ),
      body: ListView(
        children: [
          // カウント表示
          Text(count.toString()),
          // カウントダウンボタン
          ElevatedButton(
              onPressed: () {
                ref.read(countDownProvider.notifier).state--;
              },
              child: Text('countDown')),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('戻る'),
          ),
        ],
      ),
    );
  }
}
