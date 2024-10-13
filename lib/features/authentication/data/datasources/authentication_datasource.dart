import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../core/core.dart';
import '../../domain/domain.dart';
import '../models/models.dart';

abstract interface class AuthenticationDatasource {
  Future<Either<AppError, SessionModel>> signIn(SignInParams params);
}

class AuthenticationDatasourceImpl implements AuthenticationDatasource {
  AuthenticationDatasourceImpl({required Dio dio}) : _dio = dio;

  final Dio _dio;

  @override
  Future<Either<AppError, SessionModel>> signIn(SignInParams params) async {
    final String data = json.encode(<String, dynamic>{
      'campaign': '4u',
      'participation': <String, String>{
        'codigo-de-cliente': params.username,
        'password': params.password,
      }
    });
    try {
      final Response<dynamic> response = await _dio.post(
        ApiUrls.signInPath,
        data: data,
      );
      final SessionModel result =
          SessionModel.fromJson(jsonDecode(response.data));
      return right(result);
    } on DioException catch (e) {
      return left(
        AppError(message: jsonDecode(e.response!.data)['message']),
      );
    }
  }
}
