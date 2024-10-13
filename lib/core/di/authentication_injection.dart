import '../../features/authentication/authentication.dart';
import 'di.dart';

Future<void> authenticationDependencies() async {
  locator
    ..registerLazySingleton<AuthenticationDatasource>(
      () => AuthenticationDatasourceImpl(
        dio: locator(),
      ),
    )
    ..registerLazySingleton<AuthenticationRepository>(
      () => AuthenticationRepositoryImpl(
        datasource: locator(),
      ),
    )
    ..registerLazySingleton<SignInUsecase>(
      () => SignInUsecase(
        repository: locator(),
      ),
    )
    ..registerFactory<AuthenticationCubit>(
      () => AuthenticationCubit(
        signInUsecase: locator(),
        localStorage: locator(),
      ),
    );
}
