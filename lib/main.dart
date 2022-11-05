import 'package:first_project1/alert.dart';
import 'package:flutter/material.dart';

import 'login.dart';

void main() {
  runApp(const MyApp());
}

class RouteAreguments {
  final String title;
  final String content;

  RouteAreguments(this.title, this.content);
  }

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: '앱 상단 텍스트 변경'),
      routes: {'/alert': (context) => Alert()},
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void _showDialog() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("다이얼로그"),
            content: SingleChildScrollView(
              child: ListBody(
                children: [Text('Alert Dialog'), Text('OK를 눌러 닫습니다.')],
              ),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('OK'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('Cancel'),
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.lightGreen,
          centerTitle: true,
          leading: IconButton(
            icon: Icon(Icons.home),
            onPressed: () {
              print("home clicked");
            },
          ),
          title: Text("Flutter 로 앱 만들기"),
          actions: [
            IconButton(
                icon: Icon(Icons.login),
                onPressed: () {
                  print("로그인 페이지로 이동");
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Login(txt: "test message")),
                  );
                }),
            TextButton(
                child: Text('알림'),
                style: TextButton.styleFrom(foregroundColor: Colors.white),
                onPressed: () async {
                  var result = await Navigator.pushNamed(context, '/alert',
                  arguments: RouteAreguments("제목", "내용"));
                  print("result = ${result}");
                  print("result = " + result.toString());
                }),
          ],
        ),
        body: Center(
            child: TextButton(
          onPressed: _showDialog,
          child: Text('다이얼로그 열기'),
        )));
  }
}
