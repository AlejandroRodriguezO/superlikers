import 'package:flutter_test/flutter_test.dart';
import 'package:superlikers/core/core.dart';

void main() {
  group('StringRemoveUnderscoreExtension', () {
    test('should remove underscores and replace with spaces', () {
      const String input = 'volumen_meta_mes_hectolitros';
      const String expectedOutput = 'volumen meta mes hectolitros';

      expect(input.removeUnderscores(), expectedOutput);
    });

    test('should return the same string if no underscores are present', () {
      const String input = 'volumen meta mes hectolitrost';

      expect(input.removeUnderscores(), input);
    });
  });

  group('StringCasingExtension', () {
    test('should capitalize the first letter of the string', () {
      const String input = 'volumen';
      const String expectedOutput = 'Volumen';

      expect(input.capitalize(), expectedOutput);
    });

    test('should return the same string if already capitalized', () {
      const String input = 'Volumen';

      expect(input.capitalize(), input);
    });

    test('should handle empty string without crashing', () {
      const String input = '';

      expect(() => input.capitalize(), throwsRangeError);
    });
  });
}
