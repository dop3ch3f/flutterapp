import 'package:flutter/material.dart';
import '../blocs/form_bloc.dart';

class FormItems {
  Widget emailField() {
    return StreamBuilder(
      builder: (context, snapshot) {
        return new TextField(
          onChanged: bloc.changeEmail,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            labelText: 'Email Address',
            hintText: 'any@any.com',
            errorText: snapshot.error,
          ),
        );
      },
      stream: bloc.email,
    );
  }

  Widget passwordField() {
    return StreamBuilder(
      builder: (context, snapshot) {
        return new TextField(
          onChanged: bloc.changePassword,
          obscureText: true,
          decoration: InputDecoration(
            labelText: 'Password',
            hintText: 'Password',
            errorText: snapshot.error,
          ),
        );
      },
      stream: bloc.email,
    );
  }

  Widget submitButton() {
    return RaisedButton(
      color: Colors.blue,
      child: Text('Login', style: TextStyle(color: Colors.white)),
      onPressed: () {},
    );
  }
}
