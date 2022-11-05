import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  var txt = "";
  Login({Key? key, required this.txt}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop("알림창에서 넘오온 메시지");
          },
        ),
      ),
      body: Container(
        child: Center(child: Text('로그인 페이지')),
      ),
    );
  }
}
