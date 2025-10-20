import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/test_screen.dart';
import 'package:todo_app/test_screen2.dart';
import 'common/show_model.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ToDo App',
      theme: ThemeData(),
      // 存在しないHomePageではなく、MyHomePageを呼び出す
      home: const MyHomePage(),
    );
  }
}

// StatefulWidgetである必要がなければStatelessWidgetに変更
class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // Scaffoldはbodyを1つしか持てないため、1つに統合する
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0, // AppBarの影を消す
        title: ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.amber,
            radius: 25,
            child: Image.asset('assets/profile.png'),
          ),
          title: Text(
            'Hello, I\'m',
            style: TextStyle(fontSize: 12, color: Colors.grey.shade400),
          ),
          subtitle: const Text(
            'minato',
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(CupertinoIcons.calendar),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(CupertinoIcons.bell),
                ),
                IconButton(
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => TestScreen()));
                  },
                  icon: const Icon(CupertinoIcons.add),
                ),
                IconButton(
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => TestScreen2()));
                  },
                  icon: const Icon(CupertinoIcons.search),
                )
              ],
            ),
          )
        ],
      ),
      // bodyを1つにまとめる
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: 30, vertical: 20), // 上下にも余白を追加
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Today\'s Tasks',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                      Text(
                        'Wednesday, 11 May', // 'wednesday'を大文字に
                        style: TextStyle(color: Colors.grey.shade500),
                      ),
                    ],
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFD5DEFF), // カラーを少し調整
                      foregroundColor: Colors.blue.shade800,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onPressed: () => showModalBottomSheet(
                      isScrollControlled: true,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(16),
                        ),
                      ),
                      context: context,
                      builder: (context) => const AddNewTaskModel(),
                    ),
                    child: const Text('+ New Task'),
                  )
                ],
              ),
              const SizedBox(height: 20), // Rowの後のスペース
              // ここにタスクリストなどを追加していく
            ],
          ),
        ),
      ),
    );
  }
}
