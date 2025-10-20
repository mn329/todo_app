import 'package:flutter_riverpod/flutter_riverpod.dart';

final dateProvier = StateProvider<String>((ref) {
  return 'yyyy/mm/dd';
});
final timeProvier = StateProvider<String>((ref) {
  return 'hh:mm';
});
