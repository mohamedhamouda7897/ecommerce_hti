import 'package:ecommerce_hti/core/error/failuers.dart';
import 'package:ecommerce_hti/features/sign_up/domain/entities/register_entity.dart';

abstract class RegisterStates {}

class RegisterInitState extends RegisterStates {}

class RegisterLoadingState extends RegisterStates {}

class RegisterSuccessState extends RegisterStates {
  RegisterEntity model;

  RegisterSuccessState(this.model);
}

class RegisterErrorState extends RegisterStates {
  Failures failures;

  RegisterErrorState(this.failures);
}
