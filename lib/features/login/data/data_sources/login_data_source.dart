import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../core/api/end_points.dart';
import '../../../../core/error/failuers.dart';
import '../../../../core/utils/constants.dart';
import '../../../sign_up/data/models/RegisterModel.dart';
import '../../../sign_up/domain/entities/register_entity.dart';

abstract class LoginDataSource {
  Future<Either<Failures, RegisterEntity>?> login(
      String email, String password);
}

class LoginRemoteDataSource implements LoginDataSource {
  @override
  Future<Either<Failures, RegisterEntity>?> login(
      String email, String password) async {
    final dio = Dio();
    try {
      var value = await dio.post("${Constants.BASEURL}${EndPoints.login}",
          data: {"email": email, "password": password});

      if (value.statusCode == 201 || value.statusCode == 200) {
        RegisterModel registerModel = RegisterModel.fromJson(value.data);
        return Right(registerModel);
      }
    } catch (e) {
      return Left(RemoteFailures(e.toString()));
    }
  }
}

class LoginLocalDataSource implements LoginDataSource {
  @override
  Future<Either<Failures, RegisterEntity>?> login(
      String email, String password) {
    // TODO: implement login
    throw UnimplementedError();
  }
}
