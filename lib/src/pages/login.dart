import 'package:flutter/material.dart';
import '../mixins/validation_mixin.dart';

class Login extends StatefulWidget {
  createState() {
    return LoginState();
  }
}

class LoginState extends State<Login> with ValidationMixin {
  final formKey = GlobalKey<FormState>();
  String email = "";
  String password = "";

  Widget emailField() {
    return new TextFormField(
      keyboardType: TextInputType.emailAddress,
      validator: validateEmail,
      onSaved: (String value) {
        email = value;
      },
      decoration: InputDecoration(
        labelText: 'Email Address',
        hintText: 'any@any.com',
      ),
    );
  }

  Widget passwordField() {
    return TextFormField(
      obscureText: true,
      validator: validatePassword,
      onSaved: (String value) {
        password = value;
      },
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
      onPressed: () {
        if (formKey.currentState.validate()) {
          formKey.currentState.save();
          print('Submitting $email and $password');
        }
        return null;
      },
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
          key: formKey,
          autovalidate: true,
          child: Column(
            children: [
              emailField(),
              Container(margin: EdgeInsets.only(top: 25.0)),
              passwordField(),
              Container(margin: EdgeInsets.only(top: 35.0)),
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
