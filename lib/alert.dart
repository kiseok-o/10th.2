import 'package:first_project1/main.dart';
import 'package:flutter/material.dart';
import 'globals.dart' as globals;

class Alert extends StatefulWidget {
  const Alert({Key? key}) : super(key: key);

  @override
  State<Alert> createState() => _AlertState();
}

class _AlertState extends State<Alert> {
  RouteAreguments routeAreguments = RouteAreguments("", "");

  @override
  Widget build(BuildContext context) {
    routeAreguments = ModalRoute.of(context)!.settings.arguments as RouteAreguments;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Container(
        child: Center(child: Text(globals.error_code)),
      ),
    );
  }
}
