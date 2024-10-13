import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/core.dart';

class BannerSummary extends StatelessWidget {
  const BannerSummary({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Container(
        height: 104.h,
        padding: const EdgeInsets.all(5.0),
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(15.r),
          border: Border.all(
            width: 2,
            color: AppColors.blueLigthColor,
          ),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(13.r),
          child: Image.asset(
            'assets/banner.png',
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
