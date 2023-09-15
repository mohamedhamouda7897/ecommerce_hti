import 'package:dartz/dartz.dart';
import 'package:ecommerce_hti/core/error/failuers.dart';
import 'package:ecommerce_hti/features/login/data/data_sources/login_data_source.dart';
import 'package:ecommerce_hti/features/login/domain/repositories/login_domain_repo.dart';
import 'package:ecommerce_hti/features/sign_up/domain/entities/register_entity.dart';

class LoginDataRepo implements LoginDomainRepo {
  LoginDataSource loginDataSource;

  LoginDataRepo(this.loginDataSource);

  @override
  Future<Either<Failures, RegisterEntity>?> login(
      String email, String password) {
    return loginDataSource.login(email, password);
  }
}
