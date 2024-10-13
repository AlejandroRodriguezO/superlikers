import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/core.dart';
import 'progress_bar_widget.dart';

class ProgressBarNameWidget extends StatelessWidget {
  const ProgressBarNameWidget({
    super.key,
    required this.name,
    required this.percentage,
  });
  final String name;
  final double percentage;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ProgressBarWidget(
          percentage: percentage,
          color: Colors.accents[Random().nextInt(Colors.accents.length)],
        ),
        Text(
          name,
          style: TextStyle(
            color: AppColors.white,
            fontSize: 12.sp,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}
