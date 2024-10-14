import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:superlikers/core/core.dart';

void main() {
  group('AppColors', () {
    test('should have correct color values', () {
      expect(AppColors.cardKpiColor, const Color(0xFF0a2440));
      expect(AppColors.scaffoldColor, const Color(0xFF0e2954));
      expect(AppColors.dropdownColor, const Color(0xFF183460));
      expect(AppColors.blueLigthColor, const Color(0xFF385cac));
      expect(AppColors.greenColor, const Color(0xFF65baaf));
      expect(AppColors.greenProgressColor, const Color(0xFF73bc1e));
      expect(AppColors.white, Colors.white);
      expect(AppColors.black, Colors.black);
    });
  });
}
