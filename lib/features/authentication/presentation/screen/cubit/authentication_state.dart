part of 'authentication_cubit.dart';

class AuthenticationState extends Equatable {
  const AuthenticationState({
    this.username = '',
    this.password = '',
    this.signInState = const SignInInitial(),
  });

  final String username;
  final String password;
  final SignInState signInState;

  @override
  List<Object> get props => <Object>[
        username,
        password,
        signInState,
      ];

  AuthenticationState copyWith({
    String? username,
    String? password,
    SignInState? signInState,
  }) {
    return AuthenticationState(
      username: username ?? this.username,
      password: password ?? this.password,
      signInState: signInState ?? this.signInState,
    );
  }
}

sealed class SignInState extends Equatable {
  const SignInState();

  @override
  List<Object> get props => <Object>[];
}

final class SignInInitial extends SignInState {
  const SignInInitial();
}

final class SignInLoading extends SignInState {
  const SignInLoading();
}

final class SignInLoaded extends SignInState {
  const SignInLoaded(this.message);

  final String message;
}

final class SignInFailed extends SignInState {
  const SignInFailed(this.message);

  final String message;
}
