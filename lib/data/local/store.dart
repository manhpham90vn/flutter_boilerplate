import 'package:shared_preferences/shared_preferences.dart';

class StorageConstants {
  static const token = "token";
  static const refreshToken = "refresh_token";
}

class LocalStore {

  final _prefs = SharedPreferences.getInstance();

  // singleton
  LocalStore._privateConstructor();
  static final LocalStore instance = LocalStore._privateConstructor();

  void setToken(String token) async {
    final prefs = await _prefs;
    await prefs.setString(StorageConstants.token, token);
  }

  Future<String> getToken() async {
    final prefs = await _prefs;
    return prefs.getString(StorageConstants.token) ?? "";
  }

}