import 'package:ecommerce_hti/features/sign_up/data/data_sources/register_data_source.dart';
import 'package:ecommerce_hti/features/sign_up/data/repositories/register_data_repo.dart';
import 'package:ecommerce_hti/features/sign_up/domain/entities/register_data.dart';
import 'package:ecommerce_hti/features/sign_up/domain/repositories/register_domain_repo.dart';
import 'package:ecommerce_hti/features/sign_up/domain/use_cases/register_use_case.dart';
import 'package:ecommerce_hti/features/sign_up/presentation/manager/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterCubit extends Cubit<RegisterStates> {
  RegisterDataSource dataSource;

  RegisterCubit(this.dataSource) : super(RegisterInitState());

  static RegisterCubit get(context) => BlocProvider.of(context);

  var formKEy = GlobalKey<FormState>();
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var phoneController = TextEditingController();

  register() async {
    RegisterDomainRepo domainRepo = RegisterDataRepo(dataSource);
    RegisterUserCase userCase = RegisterUserCase(domainRepo);

    RegisterData data = RegisterData(
        "mai", "Mai333333@gmail.com", "123456789", "123456789", "01110588669");
    userCase.call(data).then((value) {
      value?.fold((l) {
        emit(RegisterErrorState(l));
      }, (r) {
        emit(RegisterSuccessState(r));
      });
    });
  }
}
