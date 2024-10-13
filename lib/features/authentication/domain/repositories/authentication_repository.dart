import 'package:dartz/dartz.dart';

import '../../../../core/core.dart';
import '../domain.dart';

abstract interface class AuthenticationRepository {
  Future<Either<AppError, SessionEntity>> signIn(SignInParams params);
}