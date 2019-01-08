import 'package:flutter/material.dart';
import './pages/pics.dart';
import './pages/login.dart';
import './pages/animation_page.dart';
import './blocs/form_provider.dart';

class App extends StatelessWidget {
  // main widget build method
  Widget build(context) {
    return FormProvider(
      child: MaterialApp(
        home: new Login(),
        routes: {
          '/pics': (BuildContext context) => new Pics(),
          '/login': (BuildContext context) => new Login(),
          '/animation_page': (BuildContext context) => new AnimationPage(),
        },
      ),
    );
  }
}
