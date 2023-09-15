import 'package:dartz/dartz.dart';
import 'package:ecommerce_hti/features/sign_up/domain/entities/register_data.dart';

import '../../../../core/error/failuers.dart';
import '../entities/register_entity.dart';

abstract class RegisterDomainRepo {
  Future<Either<Failures, RegisterEntity>?> register(RegisterData registerData);
}
