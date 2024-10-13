import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/core.dart';

class CustomInput extends StatelessWidget {
  const CustomInput({
    super.key,
    required this.label,
    this.onChanged,
    this.validator,
  });

  final String label;
  final void Function(String)? onChanged;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Text(
          label,
          style: TextStyle(
            color: AppColors.white,
            fontSize: 13.sp,
            fontWeight: FontWeight.w300,
          ),
        ),
        SizedBox(
          height: 4.h,
        ),
        TextFormField(
          decoration: InputDecoration(
            hintText: label,
            hintStyle: TextStyle(
              color: Colors.blue.shade200,
              fontSize: 12.sp,
              fontWeight: FontWeight.w300,
            ),
            labelStyle: TextStyle(
              color: Colors.blue.shade200,
              fontSize: 13.sp,
            ),
            filled: true,
            fillColor: const Color(0xFF0F1E3D),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                color: Colors.transparent,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                color: Colors.blue.shade200,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                color: AppColors.blueLigthColor,
              ),
            ),
            contentPadding:
                const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
          ),
          style: TextStyle(
            color: Colors.blue.shade200,
          ),
          cursorColor: Colors.blue.shade200,
          onChanged: onChanged,
          validator: validator,
        ),
      ],
    );
  }
}
