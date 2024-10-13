import 'package:equatable/equatable.dart';

class SignInParams extends Equatable {

  const SignInParams({
    required this.username,
    required this.password,
  });
  
  final String username;
  final String password;

  @override
  List<Object> get props => <Object>[
        username,
        password,
      ];
}
