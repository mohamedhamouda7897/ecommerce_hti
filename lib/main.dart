import 'package:bloc/bloc.dart';
import 'package:ecommerce_hti/my_app.dart';
import 'package:flutter/material.dart';

import 'core/utils/observer.dart';

void main() {
  Bloc.observer = MyBlocObserver();

  runApp(const MyApp());
}
