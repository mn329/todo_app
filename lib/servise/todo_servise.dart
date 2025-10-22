import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todo_app/model/todo_model.dart';

class TodoServise {
  // コレクション名を確認してください (例: 'todos')
  final todocollection = FirebaseFirestore.instance.collection('todos');

  // async と await を使った正しい実装
  Future<void> addNewTask(TodoModel model) async {
    try {
      print("Firestoreへのデータ追加を試みます...");
      await todocollection.add(model.toMap());
      print("✅ Firestoreへのデータ追加に成功しました！");
    } catch (e) {
      // エラーが発生した場合、ここが実行される！
      print("🚨 データ追加中にエラーが発生しました: $e");
    }
  }

  // checked修正
  void updateTask(String? docId, bool? valueUpdate) {
    todocollection.doc(docId).update({'isDone': valueUpdate});
  }

  // 削除
  void deleteTask(String? docId) {
    todocollection.doc(docId).delete();
  }
}
