import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  static SharedPreferences? localStorage;

  static Future<dynamic> init() async {
    localStorage = await SharedPreferences.getInstance();
  }

  Object? get(String key) {
    return localStorage!.get(key);
  }

  void clear() {
    localStorage!.clear();
  }

  void remove(String key) {
    localStorage!.remove(key);
  }

  dynamic getObject(String key) {
    return localStorage!.getString(key) != null
        ? json.decode(localStorage!.getString(key).toString())
        : <String, dynamic>{};
  }

  void setObject(String key, Object value) {
    localStorage!.setString(key, json.encode(value));
  }

  int getInt(String key) {
    return localStorage!.getInt(key) ?? 0;
  }

  void setInt(String key, int value) {
    localStorage!.setInt(key, value);
  }

  bool getBool(String key) {
    return localStorage!.getBool(key) ?? false;
  }

  void setBool(String key, {bool? value}) {
    localStorage!.setBool(key, value!);
  }

  String getString(String key) {
    return localStorage!.getString(key) ?? '';
  }

  void setString(String key, String value) {
    localStorage!.setString(key, value);
  }
}