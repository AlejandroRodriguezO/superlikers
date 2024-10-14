import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:superlikers/core/constants/keys.dart';

import '../../../../../core/core.dart';
import '../../../domain/domain.dart';

part 'authentication_state.dart';

class AuthenticationCubit extends Cubit<AuthenticationState> {
  AuthenticationCubit(
      {required SignInUsecase signInUsecase,
      required LocalStorage localStorage})
      : _signInUsecase = signInUsecase,
        _localStorage = localStorage,
        super(const AuthenticationState());

  final SignInUsecase _signInUsecase;
  final LocalStorage _localStorage;

  void onChangedUsername(String value) => emit(state.copyWith(username: value));
  void onChangedPassword(String value) => emit(state.copyWith(password: value));
  void onChangedTerms(bool value) => emit(state.copyWith(isTerms: value));
  void onChangedPrivacy(bool value) => emit(state.copyWith(isPrivacy: value));

  Future<void> signIn() async {
    emit(
      state.copyWith(
        signInState: const SignInLoading(),
      ),
    );
    final Either<AppError, SessionEntity> result = await _signInUsecase(
      params: SignInParams(
        username: state.username,
        password: state.password,
      ),
    );

    result.fold(
      (AppError error) => emit(
        state.copyWith(
          signInState: SignInFailed(error.message),
        ),
      ),
      (SessionEntity resp) {
        _localStorage.setString(kToken, resp.token);
        emit(
          state.copyWith(
            signInState: SignInLoaded(resp.message),
          ),
        );
      },
    );
  }

  Future<void> signOut() async {
    _localStorage.clear();
  }
}
