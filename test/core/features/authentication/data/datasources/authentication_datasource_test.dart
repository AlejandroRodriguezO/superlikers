import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:superlikers/core/core.dart';
import 'package:superlikers/features/features.dart';

import '../../../../../helpers/helper.mocks.dart';

void main() {
  late MockDio mockDio;
  late AuthenticationDatasource authenticationDatasource;

  setUp(() {
    mockDio = MockDio();
    authenticationDatasource = AuthenticationDatasourceImpl(
      dio: mockDio,
    );
  });

  const SignInParams params =
      SignInParams(username: '123456', password: '123456');

      

  group('get Authentication testing', () {
    test('should signIn return 200', () async {
      // Arrange

      when(mockDio.post(any, data: anyNamed('data'))).thenAnswer(
        (_) async => Response<dynamic>(
          data: jsonEncode(
            <String, String>{
              'ok': 'true',
              'token':
                  'eyJhbGciOiJIUzI1NiJ9.eyJzZXNzaW9uIjoiNjM5MWE4Y2MyZjE2NmVmNjI0ZWY5YjcwZTg5Njk0NWJlY2U2ZDNlNDRhYzkwODU1NjFhNDdiOTY0ZDc2N2JlMiIsInN1YiI6IkRhc2hib2FyZCIsImlhdCI6MTcyODg2MTA1MiwiZXhwIjoxNzMwMTU3MDUyfQ.QKf1NB0agc3GJlWMwTOJ4MJeHyjglsc2Kz8x_-FaZVk',
              'message': 'Se inicio sesion correctamente'
            },
          ),
          requestOptions: RequestOptions(),
          statusCode: 200,
        ),
      );

      final Either<AppError, SessionModel> result =
          await authenticationDatasource.signIn(params);

      //assert
      expect(result, isA<Right<AppError, SessionModel>>());
    });

    test('should signIn return 404', () async {
      // Arrange
      when(mockDio.post(any, data: anyNamed('data'))).thenAnswer(
        (_) async => Response<dynamic>(
          data: jsonEncode(
            <String, dynamic>{
              'ok': 'false',
              'message': 'Usuario no encontrado',
              'code_error': 144
            },
          ),
          requestOptions: RequestOptions(),
          statusCode: 404,
        ),
      );

      final Either<AppError, SessionModel> result =
          await authenticationDatasource.signIn(params);

      //assert
      expect(result, isA<Left<AppError, SessionModel>>());
    });
    test('should throw Dio Exception', () async {
      // Arrange
      when(mockDio.post(any, data: anyNamed('data'))).thenThrow(
        DioException(
          response: Response<dynamic>(
            data: jsonEncode(
              <String, dynamic>{
                'ok': 'false',
                'message': 'Usuario no encontrado',
                'code_error': 144
              },
            ),
            requestOptions: RequestOptions(),
          ),
          requestOptions: RequestOptions(),
        ),
      );

      final Either<AppError, SessionModel> result =
          await authenticationDatasource.signIn(params);

      //assert
      expect(result, isA<Left<AppError, SessionModel>>());
    });
  });
}
