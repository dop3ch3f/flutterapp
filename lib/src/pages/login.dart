import 'package:flutter/material.dart';
import '../widgets/form_items.dart';

class Login extends StatefulWidget {
  createState() {
    return LoginState();
  }
}

class LoginState extends State<Login> {
  final formKey = GlobalKey<FormState>();

  routeToHome(BuildContext context) {
    // go to login route
    // return Navigator.of(context).pushNamed('/home');
    return Navigator.of(context).pop(true);
  }

  Widget build(context) {
    return new Scaffold(
      body: Container(
        margin: EdgeInsets.all(20.0),
        child: Column(
          children: [
            FormItems().emailField(),
            Container(margin: EdgeInsets.only(top: 25.0)),
            FormItems().passwordField(),
            Container(margin: EdgeInsets.only(top: 35.0)),
            FormItems().submitButton(formKey),
          ],
        ),
      ),
      appBar: AppBar(title: Text('Signin to your Account')),
      bottomNavigationBar: BottomAppBar(
        child: RaisedButton(
            onPressed: () {
              routeToHome(context);
            },
            child: Text("Home")),
      ),
    );
  }
}
