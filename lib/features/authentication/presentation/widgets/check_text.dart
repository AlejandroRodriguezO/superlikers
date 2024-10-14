import 'package:flutter/material.dart';

import '../../../../core/core.dart';

class CheckText extends StatelessWidget {
  const CheckText({
    super.key,
    required this.value,
    this.onChanged,
    required this.text1,
    required this.text2,
    required this.text3,
  });

  final bool value;
  final void Function(bool?)? onChanged;
  final String text1;
  final String text2;
  final String text3;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Checkbox.adaptive(
          checkColor: AppColors.scaffoldColor,
          fillColor: const MaterialStatePropertyAll<Color>(
            Color(0xFF6482c6),
          ),
          side: const BorderSide(
            color: Color(0xFF6482c6),
          ),
          value: value,
          onChanged: onChanged,
        ),
        Text.rich(
          TextSpan(
            style: const TextStyle(
              color: AppColors.white,
              fontWeight: FontWeight.w300,
            ),
            children: <InlineSpan>[
              TextSpan(
                text: '$text1 ',
                style: const TextStyle(
                  fontStyle: FontStyle.italic,
                ),
              ),
              TextSpan(
                text: '$text2 ',
              ),
              TextSpan(
                text: text3,
                style: const TextStyle(
                  fontStyle: FontStyle.italic,
                  decoration: TextDecoration.underline,
                  decorationColor: AppColors.white,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
