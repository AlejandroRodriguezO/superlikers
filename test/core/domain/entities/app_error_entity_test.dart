import 'package:flutter_test/flutter_test.dart';
import 'package:superlikers/core/core.dart';

void main() {
  group('AppError', () {
    test('should have the correct default values', () {
      const AppError error = AppError();

      expect(error.message, '');
    });

    test('should be equal when messages are the same', () {
      const AppError error1 = AppError(message: 'An error occurred');
      const AppError error2 = AppError(message: 'An error occurred');

      expect(error1, error2);
    });

    test('should not be equal when messages are different', () {
      const AppError error1 = AppError(message: 'An error occurred');
      const AppError error2 = AppError(message: 'Another error occurred');

      expect(error1, isNot(error2));
    });

  
  });
}
