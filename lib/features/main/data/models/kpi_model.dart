import '../../domain/domain.dart';

class KpiModel extends KpiEntity {
  const KpiModel({
    required super.name,
    required super.goal,
    required super.advance,
    required super.percentage,
    required super.type,
  });
}
