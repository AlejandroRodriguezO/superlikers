import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:superlikers/core/core.dart';
import 'package:superlikers/features/features.dart';

void main() {

  setUp(() async {
    await initializeDependencies();
  });

  test('Injection container test', () {
    locator.get<Dio>();
    locator.get<LocalStorage>();
    locator.get<AuthenticationDatasource>();
    locator.get<AuthenticationRepository>();
    locator.get<SignInUsecase>();
    locator.get<AuthenticationCubit>();
    locator.get<SummaryDatasource>();
    locator.get<SummaryRepository>();
    locator.get<GetEntriesUsecase>();
    locator.get<SummaryCubit>();
  });
}
