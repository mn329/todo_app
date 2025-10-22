import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/servise/todo_servis.dart';

final serviseProvider = Provider<TodoServise>((ref) {
  return TodoServise();
});
