import 'package:flutter_test/flutter_test.dart';
import 'package:superlikers/core/core.dart';

void main() {
  group('ApiUrls', () {
    test('should have correct baseUrl and apiKey', () {
      expect(ApiUrls.baseUrl, Env.baseUrl);
      expect(ApiUrls.apiKey, Env.apiKey);
    });

    test('should have correct paths for signIn and entries', () {
      expect(ApiUrls.signInPath, '/v1/microsite/sessions');
      expect(ApiUrls.entriesPath, '/v1/entries/index');
    });
  });
}
