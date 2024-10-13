import 'package:superlikers/core/core.dart';

import '../../domain/entities/entities.dart';

List<KpiEntity> kpiMapper(Map<String, dynamic> data) {
  List<KpiEntity> kpiList = <KpiEntity>[];
  final Map<String, KpiEntity> kpiMap = <String, KpiEntity>{};

  data.forEach((String key, dynamic value) {
    if (key.contains('meta_mes') || key.contains('avance_actual')) {
      final String nombreKPI = key
          .split('_meta_mes_')
          .first
          .split('_avance_actual_')
          .first
          .removeUnderscores()
          .capitalize();

      final String tipo =
          key.contains('hectolitros') ? 'Hectolitros' : 'Cartones';

      final String kpiKey = '$nombreKPI-$tipo';

      if (!kpiMap.containsKey(kpiKey)) {
        kpiMap[kpiKey] = KpiEntity(
          name: nombreKPI,
          goal: 0,
          advance: 0,
          percentage: 0,
          type: tipo,
        );
      }

      if (key.contains('meta')) {
        kpiMap[kpiKey] =
            kpiMap[kpiKey]!.copyWith(goal: double.tryParse(value) ?? 0);
      } else if (key.contains('avance')) {
        kpiMap[kpiKey] =
            kpiMap[kpiKey]!.copyWith(advance: double.tryParse(value) ?? 0);
      }

      final KpiEntity kpi = kpiMap[kpiKey]!;
      final double nuevoPorcentaje =
          (kpi.goal != 0) ? (kpi.advance / kpi.goal) * 100 : 0;
      kpiMap[kpiKey] = kpi.copyWith(percentage: nuevoPorcentaje);
    }
  });

  kpiList = kpiMap.values.toList();

  return kpiList;
}
