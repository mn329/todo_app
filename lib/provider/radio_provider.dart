import 'package:flutter_riverpod/flutter_riverpod.dart';

final radioProvider = StateProvider.autoDispose<int>((ref) {
  return 0;
});
