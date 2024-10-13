import '../../../../core/core.dart';
import '../../domain/domain.dart';

class SessionModel extends SessionEntity {
  const SessionModel({
    required super.token,
    required super.message,
  });

  factory SessionModel.fromJson(Json json) {
    return SessionModel(
      token: json['token'],
      message: json['message'],
    );
  }
}
