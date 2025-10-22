import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/model/todo_model.dart';
import 'package:todo_app/servise/todo_servise.dart';

final serviseProvider = Provider<TodoServise>((ref) {
  return TodoServise();
});

final fetchStreamProvider = StreamProvider<List<TodoModel>>(
  (ref) async* {
    final getData = FirebaseFirestore.instance
        .collection('todos')
        .snapshots()
        .map((event) => event.docs
            .map((snapshot) => TodoModel.fromSnapshot(snapshot))
            .toList());
    yield* getData;
  },
);
