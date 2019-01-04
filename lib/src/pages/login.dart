import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  createState() {
    return LoginState();
  }
}

class LoginState extends State<Login> {
  Widget build(context) {
    return new Scaffold(
      body: new Container(
        margin: EdgeInsets.all(20.0),
        child: Text('Login Screen'),
      ),
    );
  }
}
