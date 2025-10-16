import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/test_screen.dart';

import 'common/show_model.dart';

void main() {
  runApp(
    ProviderScope(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(),
        home: const HomePage(),
      ),
    ),
  );
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        backgroundColor: Colors.white,
        // 文字とかを黒にする
        foregroundColor: Colors.black,
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
          subtitle: Text(
            'minato',
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    CupertinoIcons.calendar,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    CupertinoIcons.bell,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => TestScreen()));
                  },
                  icon: Icon(
                    CupertinoIcons.add,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Today\'s Tasks',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    Text('wednesday, 11 May',
                        style: TextStyle(
                            fontSize: 12, color: Colors.grey.shade400)),
                  ],
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFFE5E8FA),
                        foregroundColor: Colors.blue.shade800,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8))),
                    // ボタンを押したときにモーダルボトムシート(下から飛び出る)を表示
                    onPressed: () => showModalBottomSheet(
                        // trueは高さを画面の半分以上の高さに合わせる。falseは最大でも画面の半分の高さにする
                        isScrollControlled: true,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16)),
                        context: context,
                        builder: (context) => AddNewTaskModel()),
                    child: Text(
                      '+ New Task',
                      style: TextStyle(color: Colors.grey),
                    ))
              ])
            ],
          ),
        ),
      ),
    );
  }
}
