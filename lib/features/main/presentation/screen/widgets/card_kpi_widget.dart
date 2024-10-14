import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/core.dart';
import '../../../main.dart';
import 'custom_slider_thumb.dart';
import 'info_card_kpi.dart';
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
    double mount = 0;
    for (final KpiEntity gPercentage in filteredKpis) {
      mount += gPercentage.percentage;
    }

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
          const InfoCardKpi(),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 20,
            ),
            child: ProgressIndicatorWidget(
              progress: mount,
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
                      color: AppColors.black,
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

class ProgressIndicatorWidget extends StatelessWidget {
  const ProgressIndicatorWidget({Key? key, required this.progress})
      : super(key: key);
  final double progress;

  @override
  Widget build(BuildContext context) {
    return SliderTheme(
      data: SliderTheme.of(context).copyWith(
        trackHeight: 20.0,
        activeTrackColor: AppColors.greenProgressColor,
        inactiveTrackColor: AppColors.scaffoldColor,
        thumbShape: CustomSliderThumb(
          thumbRadius: 18.0,
          value: progress,
        ),
        overlayShape: const RoundSliderOverlayShape(overlayRadius: 32.0),
      ),
      child: Stack(
        children: <Widget>[
          TweenAnimationBuilder<double>(
              tween: Tween<double>(begin: 0, end: progress),
              duration: const Duration(milliseconds: 500),
              builder: (BuildContext context, double value, _) {
                return Slider(
                  value: value,
                  min: 0,
                  max: 100,
                  allowedInteraction: SliderInteraction.tapOnly,
                  onChanged: (double value) {},
                );
              }),
          if (progress < 100)
            Positioned(
              right: 0,
              top: 12,
              child: Container(
                padding: const EdgeInsets.all(10.0),
                decoration: const BoxDecoration(
                  color: AppColors.greenProgressColor,
                  shape: BoxShape.circle,
                ),
                child: const Text(
                  '100%',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
