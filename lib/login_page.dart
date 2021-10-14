import 'package:flutter/material.dart';
import 'package:nitinlogin/View_page.dart';
import 'package:nitinlogin/addexpense_page.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(length: 2,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            tabs: [
              Text("View"),
              Text("Add Expense")
            ],
          ),
        ),
        body: TabBarView(
          children: [
            view(),
            expens(),

          ],
        ),
      ),
    );
  }
}

