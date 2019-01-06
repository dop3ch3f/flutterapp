import 'package:flutter/material.dart';
import '../mixins/validation_mixin.dart';

class FormItems with ValidationMixin {
  String email = "";
  String password = "";

  Widget emailField() {
    return new TextField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        labelText: 'Email Address',
        hintText: 'any@any.com',
        errorText: '',
      ),
    );
  }

  Widget passwordField() {
    return TextField(
      obscureText: true,
      decoration: InputDecoration(
        labelText: 'Password',
        hintText: 'Password',
        errorText: '',
      ),
    );
  }

  void validateAll(formKey) {
    if (formKey.currentState.validate()) {
      formKey.currentState.save();
      print('Submitting $this.email and $this.password');
    }
    return null;
  }

  Widget submitButton(formKey) {
    return RaisedButton(
      color: Colors.blue,
      child: Text('Login'),
      onPressed: () {
        return validateAll(formKey);
      },
    );
  }
}
