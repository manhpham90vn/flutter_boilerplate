import 'package:injectable/injectable.dart';
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

@Singleton(as: Storage)
class LocalStore implements Storage {
  final SharedPreferences prefs;

  LocalStore({required this.prefs});

  @override
  String? getString(String key) {
    return prefs.getString(key);
  }

  @override
  Future<bool> setString(String key, String value) {
    return prefs.setString(StorageConstants.token, value);
  }

  @override
  Future<bool> remove(String key) {
    return prefs.remove(key);
  }
}
