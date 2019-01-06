import 'package:flutter/material.dart';
import './form_bloc.dart';

class FormProvider extends InheritedWidget {
  final bloc = Bloc();

  FormProvider({Key key, Widget child}) : super(key: key, child: child);

  bool updateShouldNotify(InheritedWidget oldWidget) => true;

  static Bloc of(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(FormProvider) as FormProvider)
        .bloc;
  }
}
