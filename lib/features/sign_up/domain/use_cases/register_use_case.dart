import 'package:dartz/dartz.dart';
import 'package:ecommerce_hti/core/error/failuers.dart';
import 'package:ecommerce_hti/features/sign_up/domain/entities/register_data.dart';
import 'package:ecommerce_hti/features/sign_up/domain/entities/register_entity.dart';
import 'package:ecommerce_hti/features/sign_up/domain/repositories/register_domain_repo.dart';

class RegisterUserCase {
  RegisterDomainRepo registerDomainRepo;

  RegisterUserCase(this.registerDomainRepo);

  Future<Either<Failures, RegisterEntity>?> call(RegisterData registerData) =>
      registerDomainRepo.register(registerData);
}
