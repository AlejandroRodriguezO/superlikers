import 'package:flutter_test/flutter_test.dart';
import 'package:superlikers/core/core.dart';

void main() {
  group('RoutesEnum', () {
    test('should have correct name and path for each route', () {
      expect(RoutesEnum.login.name, 'login');
      expect(RoutesEnum.login.path, '/');

      expect(RoutesEnum.bonus.name, 'bonus');
      expect(RoutesEnum.bonus.path, '/bonus');

      expect(RoutesEnum.summary.name, 'summary');
      expect(RoutesEnum.summary.path, '/summary');

      expect(RoutesEnum.selfExecution.name, 'self-execution');
      expect(RoutesEnum.selfExecution.path, '/self-execution');
    });
  });
}
