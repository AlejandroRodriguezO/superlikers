import 'package:equatable/equatable.dart';

import 'entities.dart';

class EntryEntity extends Equatable {
  const EntryEntity({
    required this.id,
    required this.slug,
    required this.name,
    required this.data,
  });

  final String id;
  final String slug;
  final String name;
  final List<KpiEntity> data;

  @override
  List<Object?> get props => <Object?>[
        id,
        slug,
        name,
        data,
      ];
}
