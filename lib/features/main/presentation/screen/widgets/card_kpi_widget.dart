import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/core.dart';
import '../../../main.dart';
import 'progress_bar_name_widget.dart';

class CardKpiWidget extends StatefulWidget {
  const CardKpiWidget({super.key, required this.data});

  final List<KpiEntity> data;

  @override
  State<CardKpiWidget> createState() => _CardKpiWidgetState();
}

class _CardKpiWidgetState extends State<CardKpiWidget> {
  String selectedType = 'Cartones';
  List<KpiEntity> filteredKpis = <KpiEntity>[];

  @override
  void initState() {
    super.initState();
    filteredKpis = filtrarKPIsPorTipo(selectedType);
  }

  List<KpiEntity> filtrarKPIsPorTipo(String tipo) {
    return widget.data.where((KpiEntity kpi) => kpi.type == tipo).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20.0),
      padding: const EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        color: Colors.white10,
        border: Border.all(
          width: 2,
          color: AppColors.blueLigthColor,
        ),
        borderRadius: BorderRadius.circular(20.0.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Metas por volumen',
            style: TextStyle(
              color: Colors.amber,
              fontSize: 14.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          Text(
            'Estas son las principales metas por volumen que debes cumplir al mes.',
            style: TextStyle(
              color: AppColors.white,
              fontSize: 12.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          Text(
            'A medida que avanzas en cada una, vas sumando a porcentaje de cumplimiento total para obtener tu bonificación.',
            style: TextStyle(
              color: AppColors.white,
              fontSize: 12.sp,
              fontWeight: FontWeight.w200,
              fontStyle: FontStyle.italic,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Text(
                'Filtrar por:',
                style: TextStyle(
                  fontSize: 12.sp,
                  fontStyle: FontStyle.italic,
                  color: AppColors.white,
                  fontWeight: FontWeight.w200,
                ),
              ),
              SizedBox(
                width: 10.w,
              ),
              Material(
                elevation: 3,
                borderRadius: BorderRadius.circular(8.0.r),
                child: SizedBox(
                  height: 30,
                  child: DropdownButton<String>(
                    value: selectedType,
                    items:
                        <String>['Cartones', 'Hectolitros'].map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    style: TextStyle(
                      fontSize: 10.sp,
                      color: Colors.black,
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    underline: const SizedBox.shrink(),
                    borderRadius: BorderRadius.circular(5.0.r),
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedType = newValue!;
                        filteredKpis = filtrarKPIsPorTipo(selectedType);
                      });
                    },
                  ),
                ),
              ),
            ],
          ),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(15.0),
            margin: const EdgeInsets.only(
              top: 5,
              bottom: 10,
            ),
            decoration: BoxDecoration(
              color: AppColors.cardKpiColor,
              borderRadius: BorderRadius.circular(12.0.r),
            ),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: filteredKpis
                    .where((KpiEntity item) => item.percentage > 0)
                    .map(
                      (KpiEntity e) => ProgressBarNameWidget(
                        name: e.name,
                        percentage: e.percentage,
                      ),
                    )
                    .toList(),
              ),
            ),
          )
        ],
      ),
    );
  }
}
