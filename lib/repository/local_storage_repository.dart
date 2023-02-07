import 'package:base_flutter/data/local/storage.dart';
import 'package:get_it/get_it.dart';

abstract class LocalStorageRepository {
  Future<String?> getAccessToken();
  Future<bool> setAccessToken(String token);
  Future<bool> removeAccessToken();

  Future<String?> getRefreshToken();
  Future<bool> setRefreshToken(String token);
  Future<bool> removeRefreshToken();
}

class LocalStorageRepositoryImp implements LocalStorageRepository {

  final local = GetIt.I<Storage>();

  @override
  Future<String?> getAccessToken() async {
    return await local.getString(StorageConstants.token);
  }

  @override
  Future<String?> getRefreshToken() async {
    return await local.getString(StorageConstants.refreshToken);
  }

  @override
  Future<bool> removeAccessToken() async {
    return await local.remove(StorageConstants.token);
  }

  @override
  Future<bool> removeRefreshToken() async {
    return await local.remove(StorageConstants.refreshToken);
  }

  @override
  Future<bool> setAccessToken(String token) async {
    return await local.setString(StorageConstants.refreshToken, token);
  }

  @override
  Future<bool> setRefreshToken(String token) async {
    return await local.setString(StorageConstants.token, token);
  }

}