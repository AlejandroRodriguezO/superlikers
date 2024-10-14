import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:superlikers/core/core.dart';
import 'package:superlikers/features/authentication/authentication.dart';

import '../../../../../helpers/helper.mocks.dart';

void main() {
  late MockAuthenticationDatasource mockAuthenticationDatasource;
  late AuthenticationRepository authenticationRepository;

  setUp(() {
    mockAuthenticationDatasource = MockAuthenticationDatasource();
    authenticationRepository =
        AuthenticationRepositoryImpl(datasource: mockAuthenticationDatasource);
  });

  const SignInParams params =
      SignInParams(username: '123456', password: '123456');

  const SessionModel model =
      SessionModel(token: 'token', message: 'message');

  test(
    ' Authenticaion repository',
    () async {
      // arrange
      when(mockAuthenticationDatasource.signIn(params))
          .thenAnswer((_) async => right(model));

      // act
      final Either<AppError, SessionEntity> result =
          await authenticationRepository.signIn(params);

      // assert
      expect(result, isA<Right<AppError, SessionModel>>());
    },
  );
}
