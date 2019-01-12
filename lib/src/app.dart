import 'package:flutter/material.dart';
import './pages/pics.dart';
import './pages/login.dart';
import './pages/animation_page.dart';
import './blocs/form_provider.dart';
import './blocs/stories_provider.dart';
import './pages/news_list.dart';

class App extends StatelessWidget {
  // main widget build method
  Widget build(context) {
    return MaterialApp(
      home: FormProvider(child: Login()),
      routes: {
        '/pics': (BuildContext context) => new Pics(),
        '/login': (BuildContext context) => FormProvider(child: Login()),
        '/animation_page': (BuildContext context) => new AnimationPage(),
        '/newslist': (BuildContext context) =>
            StoriesProvider(child: NewsList()),
      },
    );
  }
}
