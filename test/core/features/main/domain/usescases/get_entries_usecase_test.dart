import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:superlikers/core/domain/entities/app_error.dart';
import 'package:superlikers/features/features.dart';

import '../../../../../helpers/helper.mocks.dart';

void main() {
  late GetEntriesUsecase getEntriesUsecase;
  late MockSummaryRepository mockSummaryRepository;

  setUp(() {
    mockSummaryRepository = MockSummaryRepository();
    getEntriesUsecase = GetEntriesUsecase(repository: mockSummaryRepository);
  });

  const EntryModel model = EntryModel(
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
  );

  test('should get activities', () async {
    // arrange
    when(mockSummaryRepository.getEntries()).thenAnswer((_) async =>
        const Right<AppError, List<EntryModel>>(<EntryModel>[model]));

    // act
    final Either<AppError, List<EntryEntity>> result =
        await getEntriesUsecase();

    // assert
    expect(result, const Right<AppError, List<EntryModel>>(<EntryModel>[model]));
  });
}
