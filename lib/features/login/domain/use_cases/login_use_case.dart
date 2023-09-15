import 'package:dartz/dartz.dart';
import 'package:ecommerce_hti/core/error/failuers.dart';
import 'package:ecommerce_hti/features/login/domain/repositories/login_domain_repo.dart';
import 'package:ecommerce_hti/features/sign_up/domain/entities/register_entity.dart';

class LoginUseCase {
  LoginDomainRepo loginDomainRepo;

  LoginUseCase(this.loginDomainRepo);

  Future<Either<Failures, RegisterEntity>?> call(
          String email, String password) =>
      loginDomainRepo.login(email, password);
}
