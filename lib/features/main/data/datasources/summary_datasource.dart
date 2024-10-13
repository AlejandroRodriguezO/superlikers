import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../core/core.dart';
import '../models/models.dart';

abstract interface class SummaryDatasource {
  Future<Either<AppError, List<EntryModel>>> getEntries();
}

class SummaryDatasourceImpl implements SummaryDatasource {
  SummaryDatasourceImpl({required Dio dio}) : _dio = dio;

  final Dio _dio;

  @override
  Future<Either<AppError, List<EntryModel>>> getEntries() async {
    final String data = json.encode(
      <String, dynamic>{
        'api_key': ApiUrls.apiKey,
        'campaign': '4u',
        'date_filter': <String, String>{
          'sdate': '2024-08-01',
          'edate': '2024-08-31',
        },
        '_type': 'External',
        'atype': 'avance_metas'
      },
    );
    try {
      final Response<dynamic> response = await _dio.post(
        ApiUrls.entriesPath,
        data: data,
      );
      final List<EntryModel> result =
          (jsonDecode(response.data)['data']['entries'] as List<dynamic>)
              .where((dynamic element) =>
                  element['data'].isNotEmpty &&
                  element['data'].length > 3 &&
                  hasAtLeastFourPairs(element['data']))
              .map((dynamic json) => EntryModel.fromJson(json))
              .toList();
      return right(result);
    } on DioException catch (e) {
      return left(
        AppError(message: jsonDecode(e.response!.data)['message']),
      );
    } catch (e) {
      return left(
        AppError(message: e.toString()),
      );
    }
  }

  bool hasAtLeastFourPairs(Map<String, dynamic> data) {
    int pairCount = 0;

    data.forEach((String key, dynamic value) {
      if (key.contains('meta')) {
        final String avanceKey = key.replaceAll('meta', 'avance');
        if (data.containsKey(avanceKey)) {
          pairCount++;
        }
      }
    });

    return pairCount >= 4;
  }
}
