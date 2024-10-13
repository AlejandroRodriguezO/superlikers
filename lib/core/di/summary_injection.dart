import '../../features/main/main.dart';
import 'di.dart';

Future<void> summaryDependencies() async {
  locator
    ..registerLazySingleton<SummaryDatasource>(
      () => SummaryDatasourceImpl(
        dio: locator(),
      ),
    )
    ..registerLazySingleton<SummaryRepository>(
      () => SummaryRepositoryImpl(
        datasource: locator(),
      ),
    )
    ..registerLazySingleton<GetEntriesUsecase>(
      () => GetEntriesUsecase(
        repository: locator(),
      ),
    )
    ..registerFactory<SummaryCubit>(
      () => SummaryCubit(
        getEntriesUsecase: locator(),
      ),
    );
}
