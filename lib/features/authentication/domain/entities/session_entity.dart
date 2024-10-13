import 'package:equatable/equatable.dart';

class SessionEntity extends Equatable {

  const SessionEntity({
    required this.token,
    required this.message,
  });
  final String token;
  final String message;

  @override
  List<Object> get props => <Object>[
        token,
        message,
      ];
}
