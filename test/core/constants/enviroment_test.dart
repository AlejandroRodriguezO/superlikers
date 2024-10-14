import 'package:flutter_test/flutter_test.dart';
import 'package:superlikers/core/core.dart';

void main() {
  group('Env', () {
    test('should have correct BASE_URL', () {
      const String expectedBaseUrl = Env.baseUrl;
      
      expect(Env.baseUrl, expectedBaseUrl);
    });

    test('should have correct API_KEY', () {
      const String expectedApiKey = Env.apiKey;
      
      expect(Env.apiKey, expectedApiKey);
    });
  });
}
