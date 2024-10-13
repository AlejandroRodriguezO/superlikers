import 'package:dartz/dartz.dart';

import '../../../../core/core.dart';
import '../domain.dart';

abstract interface class SummaryRepository {
  Future<Either<AppError, List<EntryEntity>>> getEntries();
}
