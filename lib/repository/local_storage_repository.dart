import 'package:base_flutter/data/local/storage.dart';
import 'package:injectable/injectable.dart';

abstract class LocalStorageRepository {
  String? getAccessToken();
  Future<bool> setAccessToken(String token);
  Future<bool> removeAccessToken();

  String? getRefreshToken();
  Future<bool> setRefreshToken(String token);
  Future<bool> removeRefreshToken();
}

@Singleton(as: LocalStorageRepository)
class LocalStorageRepositoryImp implements LocalStorageRepository {
  final Storage local;
  LocalStorageRepositoryImp({required this.local});

  @override
  String? getAccessToken() {
    return local.getString(StorageConstants.token);
  }

  @override
  Future<bool> setAccessToken(String token) async {
    return await local.setString(StorageConstants.token, token);
  }

  @override
  Future<bool> removeAccessToken() async {
    return await local.remove(StorageConstants.token);
  }

  @override
  String? getRefreshToken() {
    return local.getString(StorageConstants.refreshToken);
  }

  @override
  Future<bool> setRefreshToken(String token) async {
    return await local.setString(StorageConstants.refreshToken, token);
  }

  @override
  Future<bool> removeRefreshToken() async {
    return await local.remove(StorageConstants.refreshToken);
  }
}
