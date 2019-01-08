import 'package:flutter/material.dart';

class FormItems {
  Widget emailField(bloc) {
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

  Widget passwordField(bloc) {
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
      stream: bloc.password,
    );
  }

  Widget submitButton(bloc) {
    return StreamBuilder(
      builder: (context, snapshot) {
        print(snapshot.data);
        return new RaisedButton(
          color: Colors.blue,
          child: Text('Login', style: TextStyle(color: Colors.white)),
          onPressed: snapshot.hasData
              ? () {
                  print(snapshot.data);
                }
              : null,
        );
      },
      stream: bloc.submitValid,
    );
  }
}
