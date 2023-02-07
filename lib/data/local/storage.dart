import 'package:shared_preferences/shared_preferences.dart';

class StorageConstants {
  static const token = "token";
  static const refreshToken = "refresh_token";
}

abstract class Storage {
  Future<bool> setString(String key, String value);
  Future<String?> getString(String key);
  Future<bool> remove(String key);
}

class LocalStore implements Storage {

  final _prefs = SharedPreferences.getInstance();

  @override
  Future<String?> getString(String key) async {
    final prefs = await _prefs;
    return prefs.getString(key);
  }

  @override
  Future<bool> setString(String key, String value) async {
    final prefs = await _prefs;
    return prefs.setString(StorageConstants.token, value);
  }

  @override
  Future<bool> remove(String key) async {
    final prefs = await _prefs;
    return prefs.remove(key);
  }

}