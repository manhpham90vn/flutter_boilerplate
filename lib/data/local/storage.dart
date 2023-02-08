import 'package:base_flutter/di/di.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StorageConstants {
  static const token = "token";
  static const refreshToken = "refresh_token";
}

abstract class Storage {
  Future<bool> setString(String key, String value);
  String? getString(String key);
  Future<bool> remove(String key);
}

class LocalStore implements Storage {

  final _prefs = getIt<SharedPreferences>();

  @override
  String? getString(String key) {
    return _prefs.getString(key);
  }

  @override
  Future<bool> setString(String key, String value) {
    return _prefs.setString(StorageConstants.token, value);
  }

  @override
  Future<bool> remove(String key) {
    return _prefs.remove(key);
  }
}
