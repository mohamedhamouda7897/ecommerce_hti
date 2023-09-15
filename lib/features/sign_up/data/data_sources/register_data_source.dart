import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ecommerce_hti/core/api/end_points.dart';
import 'package:ecommerce_hti/core/utils/constants.dart';
import 'package:ecommerce_hti/features/sign_up/data/models/RegisterModel.dart';

import '../../../../core/error/failuers.dart';
import '../../domain/entities/register_data.dart';

abstract class RegisterDataSource {
  Future<Either<Failures, RegisterModel>?> register(RegisterData registerData);
}

class RemoteDataSource implements RegisterDataSource {
  @override
  Future<Either<Failures, RegisterModel>?> register(registerData) async {
    final dio = Dio();
    try {
      var value =
          await dio.post("${Constants.BASEURL}${EndPoints.register}", data: {
        "name": registerData.name,
        "email": registerData.email,
        "password": registerData.password,
        "rePassword": registerData.password,
        "phone": registerData.phone
      });

      if (value.statusCode == 201 || value.statusCode == 200) {
        RegisterModel registerModel = RegisterModel.fromJson(value.data);
        return Right(registerModel);
      }
    } catch (e) {
      return Left(RemoteFailures(e.toString()));
    }
  }
}

class LocalDataSource implements RegisterDataSource {
  @override
  Future<Either<Failures, RegisterModel>?> register(RegisterData registerData) {
    // TODO: implement register
    throw UnimplementedError();
  }
}
