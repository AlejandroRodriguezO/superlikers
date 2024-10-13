import 'package:dartz/dartz.dart';

import '../../../../core/core.dart';
import '../../domain/domain.dart';
import '../datasources/datasources.dart';

class AuthenticationRepositoryImpl implements AuthenticationRepository {
  AuthenticationRepositoryImpl({required AuthenticationDatasource datasource})
      : _datasource = datasource;

  final AuthenticationDatasource _datasource;

  @override
  Future<Either<AppError, SessionEntity>> signIn(SignInParams params) =>
      _datasource.signIn(params);
}
