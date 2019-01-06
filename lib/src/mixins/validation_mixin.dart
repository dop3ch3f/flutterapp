import 'dart:async';

class ValidationMixin {
  final validateEmail =
      StreamTransformer<String, String>.fromHandlers(handleData: (email, sink) {
    if (email.contains('@')) {
      return sink.add(email);
    }
    return sink.addError("Enter a valid email");
  });

  final validatePassword = StreamTransformer<String, String>.fromHandlers(
      handleData: (password, sink) {
    if (password.length > 6) {
      return sink.add(password);
    }
    return sink.addError("Password must be greater than 6");
  });
}
