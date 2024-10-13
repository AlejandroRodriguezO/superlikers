import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

import '../../../../../core/core.dart';

class ProgressBarWidget extends StatelessWidget {
  const ProgressBarWidget({
    super.key,
    required this.percentage,
    required this.color,
  });
  final double percentage;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60.r,
      width: 60.r,
      child: SfRadialGauge(
        axes: <RadialAxis>[
          RadialAxis(
              showLabels: false,
              showTicks: false,
              startAngle: 270,
              endAngle: 270,
              radiusFactor: 0.8,
              axisLineStyle: const AxisLineStyle(
                thickness: 0.1,
                color: Color.fromARGB(30, 0, 169, 181),
                thicknessUnit: GaugeSizeUnit.factor,
                cornerStyle: CornerStyle.startCurve,
              ),
              pointers: <GaugePointer>[
                RangePointer(
                  value: percentage,
                  width: 0.1,
                  sizeUnit: GaugeSizeUnit.factor,
                  enableAnimation: true,
                  animationType: AnimationType.slowMiddle,
                  cornerStyle: CornerStyle.startCurve,
                  gradient: SweepGradient(
                    colors: <Color>[
                      color,
                      color.withOpacity(.4),
                    ],
                    stops: const <double>[
                      0.25,
                      0.75,
                    ],
                  ),
                ),
              ],
              annotations: <GaugeAnnotation>[
                GaugeAnnotation(
                  positionFactor: 0.1,
                  widget: Text(
                    '${percentage.toStringAsFixed(0)}%',
                    style: TextStyle(
                      color: AppColors.white,
                      fontWeight: FontWeight.w800,
                      fontSize: 15.sp,
                    ),
                  ),
                )
              ]),
        ],
      ),
    );
  }
}
