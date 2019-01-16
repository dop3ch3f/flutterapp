import 'package:flutter/material.dart';
import '../widgets/form_items.dart';
import '../blocs/form_provider.dart';

class Login extends StatelessWidget with FormItems {
  routeToHome(BuildContext context) {
    // go to login route
    return Navigator.of(context).pushNamed('/pics');
  }

  Widget build(context) {
    final bloc = FormProvider.of(context);
    return new Scaffold(
      body: Container(
        margin: EdgeInsets.all(20.0),
        child: Column(
          children: [
            emailField(bloc),
            Container(margin: EdgeInsets.only(top: 25.0)),
            passwordField(bloc),
            Container(margin: EdgeInsets.only(top: 35.0)),
            submitButton(bloc, routeToHome),
          ],
        ),
      ),
      appBar: AppBar(title: Text('Welcome')),
    );
  }
}
