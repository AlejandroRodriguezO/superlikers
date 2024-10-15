import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:superlikers/core/core.dart';
import 'package:superlikers/features/features.dart';

import '../../../../helpers/dummy_data/json_reader.dart';
import '../../../../helpers/helper.mocks.dart';

void main() {
  late MockDio mockDio;
  late SummaryDatasource summaryDatasource;

  setUp(() {
    mockDio = MockDio();
    summaryDatasource = SummaryDatasourceImpl(
      dio: mockDio,
    );
  });

  group('get Summary testing', () {
    test('should entries return 200', () async {
      // Arrange

      when(mockDio.post(any, data: anyNamed('data'))).thenAnswer(
        (_) async => Response<dynamic>(
          data: readJson('helpers/dummy_data/summary_response.json'),
          requestOptions: RequestOptions(),
          statusCode: 200,
        ),
      );

      final Either<AppError, List<EntryModel>> result =
          await summaryDatasource.getEntries();

      //assert
      expect(result, isA<Right<AppError, List<EntryModel>>>());
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

      final Either<AppError, List<EntryModel>> result =
          await summaryDatasource.getEntries();

      //assert
      expect(result, isA<Left<AppError, List<EntryModel>>>());
    });

    test('should throw Exception', () async {
      // Arrange
      when(mockDio.post(any, data: anyNamed('data')))
          .thenThrow(const FormatException('format exception'));

      final Either<AppError, List<EntryModel>> result =
          await summaryDatasource.getEntries();

      //assert
      expect(result, isA<Left<AppError, List<EntryModel>>>());
    });
  });
}
