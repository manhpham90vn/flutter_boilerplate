import 'package:base_flutter/data/remote/app_api.dart';
import 'package:injectable/injectable.dart';
import 'package:multiple_result/multiple_result.dart';
import '../model/login_response.dart';
import '../model/refresh_token_response.dart';
import '../model/user_response.dart';

abstract class UserRepository {
  Future<Result<LoginResponse, dynamic>> login(String email, String password);
  Future<Result<RefreshTokenResponse, dynamic>> refreshToken(String token);
  Future<Result<UserResponse, dynamic>> getUserInfo();
}

@Singleton(as: UserRepository)
class UserRepositoryImp implements UserRepository {
  final AppApi api;

  UserRepositoryImp({required this.api});

  @override
  Future<Result<LoginResponse, dynamic>> login(String email, String password) {
    return api.login(email, password);
  }
  
  @override
  Future<Result<RefreshTokenResponse, dynamic>> refreshToken(String token) {
    return api.refreshToken(token);
  }
  
  @override
  Future<Result<UserResponse, dynamic>> getUserInfo() {
    return api.getUserInfo();
  }
}
