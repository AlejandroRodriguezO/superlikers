import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:superlikers/core/core.dart';
import 'package:superlikers/features/features.dart';

import '../../../../helpers/helper.mocks.dart';

void main() {
  late MockSummaryDatasource mockSummaryDatasource;
  late SummaryRepository summaryRepository;

  setUp(() {
    mockSummaryDatasource = MockSummaryDatasource();
    summaryRepository =
        SummaryRepositoryImpl(datasource: mockSummaryDatasource);
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

  test(
    ' Summary repository',
    () async {
      // arrange
      when(mockSummaryDatasource.getEntries())
          .thenAnswer((_) async => right(<EntryModel>[model]));

      // act
      final Either<AppError, List<EntryEntity>> result =
          await summaryRepository.getEntries();

      // assert
      expect(result, isA<Right<AppError, List<EntryEntity>>>());
    },
  );
}
