import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:superlikers/core/core.dart';

void main() {
  late LocalStorage storage;

  setUp(() async {
    SharedPreferences.setMockInitialValues(<String, Object>{});
    await LocalStorage.init();
    storage = LocalStorage();
  });

  test('should store and retrieve an integer', () async {
    storage.setInt('counter', 10);
    expect(storage.getInt('counter'), 10);
  });

  test('should store and retrieve a string', () async {
    storage.setString('username', 'test_user');
    expect(storage.getString('username'), 'test_user');
  });

  test('should return empty string if key not found', () {
    expect(storage.getString('non_existing_key'), '');
  });

  test('should store and retrieve a boolean', () async {
    storage.setBool('isLoggedIn', value: true);
    expect(storage.getBool('isLoggedIn'), true);
  });

  test('should store and retrieve an object', () async {
    final Map<String, dynamic> user = <String, dynamic>{
      'name': 'John',
      'age': 30
    };
    storage.setObject('user', user);

    expect(storage.getObject('user'), user);
  });

  test('should return an empty object if object not found', () {
    expect(storage.getObject('non_existing_object'), <String, dynamic>{});
  });

  test('should remove a key', () async {
    storage.setString('testKey', 'testValue');
    storage.remove('testKey');

    expect(storage.getString('testKey'), '');
  });

  test('should clear all stored values', () async {
    storage.setString('testKey1', 'value1');
    storage.setInt('testKey2', 2);

    storage.clear();

    expect(storage.getString('testKey1'), '');
    expect(storage.getInt('testKey2'), 0);
  });
}
