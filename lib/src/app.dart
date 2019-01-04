import 'package:flutter/material.dart';
import './pages/pics.dart';
import './pages/login.dart';

class App extends StatelessWidget {
  // main widget build method
  Widget build(context) {
    return MaterialApp(
      home: new Pics(),
      routes: {
        '/home': (BuildContext context) => new Pics(),
        '/login': (BuildContext context) => new Login(),
      },
    );
  }
}
