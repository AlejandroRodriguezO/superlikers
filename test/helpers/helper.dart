import 'package:dio/dio.dart';
import 'package:mockito/annotations.dart';
import 'package:superlikers/core/core.dart';
import 'package:superlikers/features/features.dart';

@GenerateMocks(
  <Type>[
    LocalStorage,
    AuthenticationDatasource,
    AuthenticationRepository,
    SignInUsecase,
    SummaryDatasource,
    SummaryRepository,
    GetEntriesUsecase,
  ],
  customMocks: <MockSpec<Dio>>[MockSpec<Dio>(as: #MockDio)],
)
void main() {}
