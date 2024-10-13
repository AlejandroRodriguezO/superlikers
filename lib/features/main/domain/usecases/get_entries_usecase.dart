import 'package:dartz/dartz.dart';

import '../../../../core/core.dart';
import '../entities/entry_entity.dart';
import '../repositories/repositories.dart';

class GetEntriesUsecase
    implements UseCase<Either<AppError, List<EntryEntity>>, void> {
  GetEntriesUsecase({required SummaryRepository repository})
      : _repository = repository;

  final SummaryRepository _repository;

  @override
  Future<Either<AppError, List<EntryEntity>>> call({void params}) =>
      _repository.getEntries();
}
