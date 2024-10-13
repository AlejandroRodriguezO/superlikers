import '../../../../core/core.dart';
import '../../domain/domain.dart';
import '../mappers/kpi_mapper.dart';

class EntryModel extends EntryEntity {
  const EntryModel({
    required super.id,
    required super.slug,
    required super.name,
    required super.data,
  });

  factory EntryModel.fromJson(Json json) {
    return EntryModel(
      id: json['id'],
      slug: json['slug'],
      name: json['name'],
      data: kpiMapper(json['data']),
    );
  }
}
