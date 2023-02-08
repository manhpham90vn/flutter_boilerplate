import 'package:base_flutter/repository/local_storage_repository.dart';
import 'package:get_it/get_it.dart';

class HomeViewModel {
  final local = GetIt.I<LocalStorageRepository>();

  logOut() {
    local.removeAccessToken();
  }
}
