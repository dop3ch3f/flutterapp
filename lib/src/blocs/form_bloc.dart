import 'dart:async';
import '../mixins/validation_mixin.dart';
import 'package:rxdart/rxdart.dart';

// if issues extend baseclass object
class Bloc with ValidationMixin {
  final _email = BehaviorSubject<
      String>(); //RxDart's implementation of StreamController. Broadcast stream by default
  final _password = BehaviorSubject<String>();
  // final _email = StreamController<String>.broadcast();
  // final _password = StreamController<String>.broadcast();

  // Add data to Stream
  Stream<String> get email => _email.stream.transform(validateEmail);
  Stream<String> get password => _password.stream.transform(validatePassword);
  //Merging email and password streams
  Stream<bool> get submitValid =>
      Observable.combineLatest2(email, password, (e, p) => true);

  // Change data
  Function(String) get changeEmail => _email.sink.add;
  Function(String) get changePassword => _password.sink.add;

  dispose() {
    _email.close();
    _password.close();
  }
}

// final bloc = Bloc();
