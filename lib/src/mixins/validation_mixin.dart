import 'dart:async';

class ValidationMixin {
  final validateEmail =
      StreamTransformer<String, String>.fromHandlers(handleData: (email, sink) {
    if (email.contains('@')) {
      print(email);
      sink.add(email);
    } else {
      sink.addError("Enter a valid email address");
    }
    ;
  });

  final validatePassword = StreamTransformer<String, String>.fromHandlers(
      handleData: (password, sink) {
    if (password.length > 6) {
      print(password);
      sink.add(password);
    } else {
      sink.addError("Password must be greater than 6");
    }
  });
}
