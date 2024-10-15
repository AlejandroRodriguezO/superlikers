import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:superlikers/core/domain/entities/app_error.dart';
import 'package:superlikers/features/authentication/authentication.dart';

import '../../../../helpers/helper.mocks.dart';

void main() {
  late SignInUsecase signInUsecase;
  late MockAuthenticationRepository mockAuthenticationRepository;

  setUp(() {
    mockAuthenticationRepository = MockAuthenticationRepository();
    signInUsecase = SignInUsecase(repository: mockAuthenticationRepository);
  });
  const SignInParams params =
      SignInParams(username: '123456', password: '123456');

  const SessionModel model = SessionModel(token: 'token', message: 'message');
  test('should get user logged', () async {
    // arrange
    when(mockAuthenticationRepository.signIn(params))
        .thenAnswer((_) async => const Right<AppError, SessionEntity>(model));

    // act
    final Either<AppError, SessionEntity> result =
        await signInUsecase(params: params);

    // assert
    expect(result, const Right<AppError, SessionEntity>(model));
  });
}
