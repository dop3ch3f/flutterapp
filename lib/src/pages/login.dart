import 'package:flutter/material.dart';
import '../widgets/form_items.dart';

class Login extends StatefulWidget {
  createState() {
    return LoginState();
  }
}

class LoginState extends State<Login> {
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
            FormItems().submitButton(),
          ],
        ),
      ),
      appBar: AppBar(title: Text('Signin to your Account')),
      bottomNavigationBar: BottomAppBar(
          child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          RaisedButton(
            color: Colors.blue,
            onPressed: () {
              routeToHome(context);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(Icons.arrow_back),
                Text("Back", style: TextStyle(color: Colors.white))
              ],
            ),
          ),
        ],
      )),
    );
  }
}
