import 'dart:async';

class ValidationMixin {
  final validateEmail =
      StreamTransformer<String, String>.fromHandlers(handleData: (email, sink) {
    if (email.contains('@')) {
      sink.add(email);
    } else {
      sink.addError("Enter a valid email address");
    }
    ;
  });

  final validatePassword = StreamTransformer<String, String>.fromHandlers(
      handleData: (password, sink) {
    if (password.length > 2) {
      sink.add(password);
    } else {
      sink.addError("Password must be greater than 2");
    }
  });
}
