part of 'summary_cubit.dart';

class SummaryState extends Equatable {
  const SummaryState({
    this.entriesState = const EntriesInitial(),
  });

  final EntriesState entriesState;

  @override
  List<Object> get props => <Object>[entriesState];

  SummaryState copyWith({
    EntriesState? entriesState,
  }) {
    return SummaryState(
      entriesState: entriesState ?? this.entriesState,
    );
  }
}

sealed class EntriesState extends Equatable {
  const EntriesState();

  @override
  List<Object> get props => <Object>[];
}

final class EntriesInitial extends EntriesState {
  const EntriesInitial();
}

final class EntriesLoading extends EntriesState {
  const EntriesLoading();
}

final class EntriesLoaded extends EntriesState {
  const EntriesLoaded(this.entries);

  final List<EntryEntity> entries;
}

final class EntriesFailed extends EntriesState {
  const EntriesFailed(this.message);
  final String message;
}
