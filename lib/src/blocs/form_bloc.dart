import 'dart:async';
import '../mixins/validation_mixin.dart';

// if issues extend baseclass object
class Bloc with ValidationMixin {
  final _email = StreamController<String>();
  final _password = StreamController<String>();

  // Add data to Stream
  Stream<String> get email => _email.stream.transform(validateEmail);
  Stream<String> get password => _password.stream.transform(validatePassword);

  // Change data
  Function(String) get changeEmail => _email.sink.add;
  Function(String) get changePassword => _email.sink.add;

  dispose() {
    _email.close();
    _password.close();
  }
}

final bloc = Bloc();
