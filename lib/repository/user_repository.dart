import 'package:base_flutter/data/remote/app_api.dart';
import 'package:injectable/injectable.dart';
import 'package:multiple_result/multiple_result.dart';
import '../model/login_response.dart';

abstract class UserRepository {
  Future<Result<LoginResponse, dynamic>> login(String email, String password);
}

@Singleton(as: UserRepository)
class UserRepositoryImp implements UserRepository {
  final AppApi api;

  UserRepositoryImp({required this.api});

  @override
  Future<Result<LoginResponse, dynamic>> login(String email, String password) {
    return api.login(email, password);
  }
}
