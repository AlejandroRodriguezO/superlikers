import 'package:flutter/material.dart';

import '../../../../../core/core.dart';

class CustomSliderThumb extends SliderComponentShape {
  CustomSliderThumb({
    required this.thumbRadius,
    required this.value,
  });
  final double thumbRadius;
  final double value;

  @override
  Size getPreferredSize(bool isEnabled, bool isDiscrete) {
    return Size.fromRadius(thumbRadius);
  }

  @override
  void paint(
    PaintingContext context,
    Offset center, {
    required Animation<double> activationAnimation,
    required Animation<double> enableAnimation,
    required bool isDiscrete,
    required TextPainter labelPainter,
    required RenderBox parentBox,
    required SliderThemeData sliderTheme,
    required TextDirection textDirection,
    required double value,
    required double textScaleFactor,
    required Size sizeWithOverflow,
  }) {
    final Canvas canvas = context.canvas;

    final Paint thumbPaint = Paint()
      ..color = AppColors.greenProgressColor
      ..style = PaintingStyle.fill;

    canvas.drawCircle(center, thumbRadius, thumbPaint);

    final TextSpan span = TextSpan(
      style: TextStyle(
        fontSize: thumbRadius * 0.6,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      text: '${this.value.toStringAsFixed(0)}%',
    );

    final TextPainter tp = TextPainter(
      text: span,
      textAlign: TextAlign.center,
      textDirection: TextDirection.ltr,
    );

    tp.layout();
    final Offset textCenter = Offset(
      center.dx - (tp.width / 2),
      center.dy - (tp.height / 2),
    );
    tp.paint(canvas, textCenter);
  }
}
