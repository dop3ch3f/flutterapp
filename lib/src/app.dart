import 'package:flutter/material.dart';
import './pages/pics.dart';
import './pages/login.dart';
import './blocs/form_provider.dart';

class App extends StatelessWidget {
  // main widget build method
  Widget build(context) {
    return FormProvider(
      child: MaterialApp(
        home: new Login(),
        routes: {
          '/home': (BuildContext context) => new Pics(),
          '/login': (BuildContext context) => new Login(),
        },
      ),
    );
  }
}
