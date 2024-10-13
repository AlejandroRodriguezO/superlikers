import 'package:dartz/dartz.dart';

import '../../../../core/core.dart';
import '../../domain/domain.dart';
import '../datasources/datasources.dart';
import '../models/models.dart';

class SummaryRepositoryImpl implements SummaryRepository {
  SummaryRepositoryImpl({required SummaryDatasource datasource})
      : _datasource = datasource;

  final SummaryDatasource _datasource;

  @override
  Future<Either<AppError, List<EntryModel>>> getEntries() =>
      _datasource.getEntries();
}
