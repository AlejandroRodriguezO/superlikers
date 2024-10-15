import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:superlikers/core/constants/keys.dart';
import 'package:superlikers/core/core.dart';
import 'package:superlikers/features/features.dart';

import '../../../../../../helpers/helper.mocks.dart';

void main() {
  late AuthenticationCubit authenticationCubit;
  late MockLocalStorage localStorage;
  late MockSignInUsecase mockSignInUsecase;

  setUp(() {
    localStorage = MockLocalStorage();
    mockSignInUsecase = MockSignInUsecase();
    authenticationCubit = AuthenticationCubit(
      signInUsecase: mockSignInUsecase,
      localStorage: localStorage,
    );
  });

  tearDown(() => authenticationCubit.close());

  const SignInParams params = SignInParams(
    username: 'username',
    password: 'password',
  );

  const SessionEntity entity = SessionEntity(
    token: 'token',
    message: 'message',
  );

  test('initial state should be empty', () {
    expect(authenticationCubit.state, const AuthenticationState());
  });

  blocTest<AuthenticationCubit, AuthenticationState>(
    'should emit new username',
    build: () => authenticationCubit,
    act: (AuthenticationCubit cubit) => cubit.onChangedUsername('username'),
    expect: () => <AuthenticationState>[
      const AuthenticationState(username: 'username'),
    ],
  );

  blocTest<AuthenticationCubit, AuthenticationState>(
    'should emit new password',
    build: () => authenticationCubit,
    act: (AuthenticationCubit cubit) => cubit.onChangedPassword('password'),
    expect: () => <AuthenticationState>[
      const AuthenticationState(password: 'password'),
    ],
  );

  blocTest<AuthenticationCubit, AuthenticationState>(
    'should emit acept terms',
    build: () => authenticationCubit,
    act: (AuthenticationCubit cubit) => cubit.onChangedTerms(true),
    expect: () => <AuthenticationState>[
      const AuthenticationState(isTerms: true),
    ],
  );

  blocTest<AuthenticationCubit, AuthenticationState>(
    'should emit acept privacy',
    build: () => authenticationCubit,
    act: (AuthenticationCubit cubit) => cubit.onChangedPrivacy(true),
    expect: () => <AuthenticationState>[
      const AuthenticationState(isPrivacy: true),
    ],
  );

  blocTest<AuthenticationCubit, AuthenticationState>(
    'should emit state loaded',
    build: () {
      when(localStorage.getString(kToken)).thenAnswer((_) => 'token');
      when(mockSignInUsecase.call(params: params)).thenAnswer(
        (_) async => const Right<AppError, SessionEntity>(entity),
      );

      return authenticationCubit;
    },
    act: (AuthenticationCubit cubit) => cubit
      ..onChangedUsername('username')
      ..onChangedPassword('password')
      ..signIn(),
    wait: const Duration(milliseconds: 500),
    expect: () => <AuthenticationState>[
      const AuthenticationState(
          username: 'username', signInState: SignInInitial()),
      const AuthenticationState(
          username: 'username',
          password: 'password',
          signInState: SignInInitial()),
      const AuthenticationState(
          username: 'username',
          password: 'password',
          signInState: SignInLoading()),
      AuthenticationState(
          username: 'username',
          password: 'password',
          signInState: SignInLoaded(entity.message)),
    ],
  );

  blocTest<AuthenticationCubit, AuthenticationState>(
    'should emit state failed',
    build: () {
      when(mockSignInUsecase.call(params: params)).thenAnswer(
        (_) async => const Left<AppError, SessionEntity>(
          AppError(message: 'error'),
        ),
      );

      return authenticationCubit;
    },
    act: (AuthenticationCubit cubit) => cubit
      ..onChangedUsername('username')
      ..onChangedPassword('password')
      ..signIn(),
    wait: const Duration(milliseconds: 500),
    expect: () => <AuthenticationState>[
      const AuthenticationState(
          username: 'username', signInState: SignInInitial()),
      const AuthenticationState(
          username: 'username',
          password: 'password',
          signInState: SignInInitial()),
      const AuthenticationState(
          username: 'username',
          password: 'password',
          signInState: SignInLoading()),
      const AuthenticationState(
          username: 'username',
          password: 'password',
          signInState: SignInFailed('Error')),
    ],
  );

  blocTest<AuthenticationCubit, AuthenticationState>(
    'should emit signOut',
    build: () => authenticationCubit,
    act: (AuthenticationCubit cubit) => cubit.signOut(),
    expect: () => <AuthenticationState>[],
  );
}
