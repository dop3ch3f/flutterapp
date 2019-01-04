import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  createState() {
    return LoginState();
  }
}

class LoginState extends State<Login> {
  Widget emailField() {
    return new TextFormField(
      keyboardType: TextInputType.emailAddress,
      decoration: new InputDecoration(
        labelText: 'Email Address',
        hintText: 'any@any.com',
      ),
    );
  }

  Widget passwordField() {
    return TextFormField(
      obscureText: true,
      decoration: InputDecoration(
        labelText: 'Password',
        hintText: 'Password',
      ),
    );
  }

  Widget submitButton() {
    return RaisedButton(
      color: Colors.blue,
      child: Text('Sign in'),
      onPressed: () {},
    );
  }

  Future routeToHome(BuildContext context) {
    // go to login route
    return Navigator.of(context).pushNamed('/home');
  }

  Widget build(context) {
    return new Scaffold(
      body: Container(
        margin: EdgeInsets.all(20.0),
        child: Form(
          child: Column(
            children: [
              emailField(),
              Container(margin: EdgeInsets.only(top: 25.0)),
              passwordField(),
              Container(margin: EdgeInsets.only(top: 25.0)),
              submitButton(),
            ],
          ),
        ),
      ),
      appBar: AppBar(title: Text('Login')),
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
