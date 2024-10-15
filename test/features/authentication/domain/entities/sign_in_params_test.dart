import 'package:flutter_test/flutter_test.dart';
import 'package:superlikers/features/authentication/authentication.dart';

void main() {
  const SignInParams params1 = SignInParams(
    username: '123456',
    password: '123456789',
  );
  const SignInParams params2 = SignInParams(
    username: '456',
    password: '123',
  );

  test('Validate Entity testing', () {
    expect(params1.username, '123456');
    expect(params1.password, '123456789');
  });
  test('Validate if equals entity params1 and params2', () {
    expect(params1 == params2, isFalse);
  });
}