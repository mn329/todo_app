import 'package:flutter_riverpod/flutter_riverpod.dart';

final countDownProvider = StateProvider.autoDispose<int>((ref) {
  return 50;
});
