import 'package:base_flutter/data/remote/app_api.dart';
import 'package:injectable/injectable.dart';
import '../model/login_response.dart';

abstract class UserRepository {
  Future<LoginResponse> login(String email, String password);
}

@Singleton(as: UserRepository)
class UserRepositoryImp implements UserRepository {

  final AppApi api;

  UserRepositoryImp({required this.api});

  @override
  Future<LoginResponse> login(String email, String password) {
    return api.login(email, password);
  }
}
