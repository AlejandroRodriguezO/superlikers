import 'package:dartz/dartz.dart';

import '../../../../core/core.dart';
import '../domain.dart';

class SignInUsecase
    implements UseCase<Either<AppError, SessionEntity>, SignInParams> {
  SignInUsecase({required AuthenticationRepository repository})
      : _repository = repository;

  final AuthenticationRepository _repository;

  @override
  Future<Either<AppError, SessionEntity>> call({SignInParams? params}) =>
      _repository.signIn(params!);
}
