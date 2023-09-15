import 'package:dartz/dartz.dart';

import '../../../../core/error/failuers.dart';
import '../../../sign_up/domain/entities/register_entity.dart';

abstract class LoginDomainRepo {
  Future<Either<Failures, RegisterEntity>?> login(
      String email, String password);
}
