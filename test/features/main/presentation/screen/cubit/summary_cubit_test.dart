import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:superlikers/core/core.dart';
import 'package:superlikers/features/features.dart';

import '../../../../../helpers/helper.mocks.dart';

void main() {
  late SummaryCubit summaryCubit;
  late MockGetEntriesUsecase mockGetEntriesUsecase;

  setUp(() {
    mockGetEntriesUsecase = MockGetEntriesUsecase();
    summaryCubit = SummaryCubit(
      getEntriesUsecase: mockGetEntriesUsecase,
    );
  });

  tearDown(() => summaryCubit.close());

  const List<EntryEntity> entity = <EntryEntity>[
    EntryEntity(
      id: 'id',
      slug: 'slug',
      name: 'name',
      data: <KpiEntity>[
        KpiEntity(
          name: 'name',
          goal: 12,
          advance: 5,
          percentage: 2,
          type: 'Hectolitro',
        ),
      ],
    )
  ];

  test('initial state should be empty', () {
    expect(summaryCubit.state, const SummaryState());
  });

  blocTest<SummaryCubit, SummaryState>(
    'should emit loaded',
    build: () {
      when(mockGetEntriesUsecase()).thenAnswer(
        (_) async => const Right<AppError, List<EntryEntity>>(entity),
      );
      return summaryCubit;
    },
    act: (SummaryCubit cubit) => cubit.getEntries(),
    expect: () => <SummaryState>[
      const SummaryState(entriesState: EntriesLoading()),
      const SummaryState(entriesState: EntriesLoaded(entity)),
    ],
  );

  blocTest<SummaryCubit, SummaryState>(
    'should emit failed',
    build: () {
      when(mockGetEntriesUsecase()).thenAnswer(
        (_) async => const Left<AppError, List<EntryEntity>>(AppError(message: 'Error')),
      );
      return summaryCubit;
    },
    act: (SummaryCubit cubit) => cubit.getEntries(),
    expect: () => <SummaryState>[
      const SummaryState(entriesState: EntriesLoading()),
      const SummaryState(entriesState: EntriesFailed('Error')),
    ],
  );
}
