import 'package:ecommerce_hti/features/login/data/repositories/login_data_repo.dart';
import 'package:ecommerce_hti/features/login/domain/repositories/login_domain_repo.dart';
import 'package:ecommerce_hti/features/login/domain/use_cases/login_use_case.dart';
import 'package:ecommerce_hti/features/login/presentation/manager/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/data_sources/login_data_source.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginDataSource loginDataSource;

  LoginCubit(this.loginDataSource) : super(LoginInitState());

  static LoginCubit get(context) => BlocProvider.of(context);

  var formKEy = GlobalKey<FormState>();
  var nameController = TextEditingController();
  var passwordController = TextEditingController();

  login() {
    LoginDomainRepo loginDomainRepo = LoginDataRepo(loginDataSource);
    LoginUseCase loginUseCase = LoginUseCase(loginDomainRepo);
    loginUseCase.call("sama1111@gmail.com", "sama@123").then((value) {
      value?.fold((l) {
        emit(LoginErrorState(l));
      }, (r) {
        emit(LoginSuccessState(r));
      });
    });
  }
}
