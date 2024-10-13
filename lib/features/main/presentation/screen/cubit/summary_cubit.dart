import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:superlikers/core/domain/entities/app_error.dart';

import '../../../domain/domain.dart';

part 'summary_state.dart';

class SummaryCubit extends Cubit<SummaryState> {
  SummaryCubit({required GetEntriesUsecase getEntriesUsecase})
      : _getEntriesUsecase = getEntriesUsecase,
        super(const SummaryState());

  final GetEntriesUsecase _getEntriesUsecase;

  Future<void> getEntries() async {
    emit(
      state.copyWith(
        entriesState: const EntriesLoading(),
      ),
    );

    final Either<AppError, List<EntryEntity>> result =
        await _getEntriesUsecase();

    result.fold(
      (AppError error) => emit(
        state.copyWith(
          entriesState: EntriesFailed(error.message),
        ),
      ),
      (List<EntryEntity> resp) => emit(
        state.copyWith(
          entriesState: EntriesLoaded(resp),
        ),
      ),
    );
  }
}
