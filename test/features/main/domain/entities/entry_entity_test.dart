import 'package:flutter_test/flutter_test.dart';
import 'package:superlikers/features/main/domain/entities/entities.dart';

void main() {
  const EntryEntity params1 = EntryEntity(
    id: 'id',
    slug: 'slug',
    name: 'name',
    data: <KpiEntity>[
      KpiEntity(
        name: 'name',
        goal: 10,
        advance: 5,
        percentage: 10,
        type: 'type',
      )
    ],
  );
  const EntryEntity params2 = EntryEntity(
    id: 'id',
    slug: 'slug',
    name: 'name',
    data: <KpiEntity>[
      KpiEntity(
        name: 'name',
        goal: 11,
        advance: 5,
        percentage: 10,
        type: 'type',
      )
    ],
  );

  test('Validate Entity testing', () {
    expect(params1.id, 'id');
    expect(params1.slug, 'slug');
    expect(params1.name, 'name');
  });
  test('Validate if equals entity params1 and params2', () {
    expect(params1 == params2, isFalse);
  });
}
