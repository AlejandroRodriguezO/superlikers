import 'package:flutter_test/flutter_test.dart';
import 'package:superlikers/features/features.dart';

void main() {
  const SessionEntity params1 = SessionEntity(
    token: 'token',
    message: 'message',
  );
  const SessionEntity params2 = SessionEntity(
    token: '456',
    message: '123',
  );

  test('Validate Entity testing', () {
    expect(params1.token, 'token');
    expect(params1.message, 'message');
  });
  test('Validate if equals entity params1 and params2', () {
    expect(params1 == params2, isFalse);
  });
}
