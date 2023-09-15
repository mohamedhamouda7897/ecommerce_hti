import 'package:ecommerce_hti/core/error/failuers.dart';
import 'package:ecommerce_hti/features/sign_up/domain/entities/register_entity.dart';

abstract class LoginStates {}

class LoginInitState extends LoginStates {}

class LoginLoadingState extends LoginStates {}

class LoginSuccessState extends LoginStates {
  RegisterEntity model;

  LoginSuccessState(this.model);
}

class LoginErrorState extends LoginStates {
  Failures failures;

  LoginErrorState(this.failures);
}
