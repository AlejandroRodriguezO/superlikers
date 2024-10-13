import 'package:equatable/equatable.dart';

class KpiEntity extends Equatable {
  const KpiEntity({
    required this.name,
    required this.goal,
    required this.advance,
    required this.percentage,
    required this.type,
  });

  final String name;
  final double goal;
  final double advance;
  final double percentage;
  final String type;

  @override
  List<Object?> get props => <Object?>[
        name,
        goal,
        advance,
        percentage,
        type,
      ];

  KpiEntity copyWith({
    String? name,
    double? goal,
    double? advance,
    double? percentage,
    String? type,
  }) {
    return KpiEntity(
      name: name ?? this.name,
      goal: goal ?? this.goal,
      advance: advance ?? this.advance,
      percentage: percentage ?? this.percentage,
      type: type ?? this.type,
    );
  }
}
