import 'package:base_flutter/data/remote/app_api.dart';
import 'package:base_flutter/di/di.dart';
import '../model/login_response.dart';

abstract class UserRepository {
  Future<LoginResponse> login(String email, String password);
}

class UserRepositoryImp implements UserRepository {
  final api = getIt<AppApi>();

  @override
  Future<LoginResponse> login(String email, String password) {
    return api.login(email, password);
  }
}
