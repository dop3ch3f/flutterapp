import 'package:flutter/material.dart';
//pages
import './pages/pics.dart';
import './pages/login.dart';
import './pages/animation_page.dart';
import './pages/news_list.dart';
import './pages/newslist_details.dart';
//providers
import './blocs/form_provider.dart';
import './blocs/stories_provider.dart';
import './blocs/comments_provider.dart';

class App extends StatelessWidget {
  // main widget build method
  Widget build(context) {
    return CommentsProvider(
      child: StoriesProvider(
        child: FormProvider(
          child: MaterialApp(
            // home: FormProvider(child: Login()),
            // routes: {
            //   '/pics': (BuildContext context) => new Pics(),
            //   '/login': (BuildContext context) => FormProvider(child: Login()),
            //   '/animation_page': (BuildContext context) => new AnimationPage(),
            //   '/newslist': (BuildContext context) =>
            //       StoriesProvider(child: NewsList()),
            // },
            title: 'News',
            onGenerateRoute: routes,
          ),
        ),
      ),
    );
  }

  Route routes(RouteSettings settings) {
    if (settings.name == '/pics') {
      return MaterialPageRoute(builder: (context) {
        return Pics();
      });
    } else if (settings.name == '/login') {
      return MaterialPageRoute(builder: (context) {
        return Login();
      });
    } else if (settings.name == '/animation_page') {
      return MaterialPageRoute(builder: (context) {
        return AnimationPage();
      });
    } else if (settings.name == '/newslist') {
      return MaterialPageRoute(builder: (context) {
        return NewsList();
      });
    } else if (RegExp(
      r"^/newslist/",
      caseSensitive: true,
      multiLine: false,
    ).hasMatch(settings.name)) {
      final List<String> array = settings.name.split("/");
      final int itemId = int.tryParse(array[2]);
      return MaterialPageRoute(builder: (context) {
        return NewsDetail(
          itemId: itemId,
        );
      });
    } else {
      return MaterialPageRoute(builder: (context) {
        return Login();
      });
    }
  }
}
