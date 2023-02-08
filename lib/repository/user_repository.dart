import 'package:base_flutter/data/remote/app_api.dart';
import 'package:get_it/get_it.dart';
import '../model/login_response.dart';

abstract class UserRepository {
  Future<LoginResponse> login(String email, String password);
}

class UserRepositoryImp implements UserRepository {
  final api = GetIt.I<AppApi>();

  @override
  Future<LoginResponse> login(String email, String password) {
    return api.login(email, password);
  }
}
