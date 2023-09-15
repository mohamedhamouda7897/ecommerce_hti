import 'package:dartz/dartz.dart';
import 'package:ecommerce_hti/core/error/failuers.dart';
import 'package:ecommerce_hti/features/sign_up/data/data_sources/register_data_source.dart';
import 'package:ecommerce_hti/features/sign_up/domain/entities/register_data.dart';
import 'package:ecommerce_hti/features/sign_up/domain/entities/register_entity.dart';
import 'package:ecommerce_hti/features/sign_up/domain/repositories/register_domain_repo.dart';

class RegisterDataRepo implements RegisterDomainRepo {
  RegisterDataSource registerDataSource;

  RegisterDataRepo(this.registerDataSource);

  @override
  Future<Either<Failures, RegisterEntity>?> register(
      RegisterData registerData) {
    return registerDataSource.register(registerData);
  }
}
