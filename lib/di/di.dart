import 'package:base_flutter/data/remote/app_api.dart';
import 'package:base_flutter/networking/app_network.dart';
import 'package:base_flutter/repository/local_storage_repository.dart';
import 'package:base_flutter/repository/user_repository.dart';
import 'package:get_it/get_it.dart';
import '../data/local/storage.dart';

void register() {
  final I = GetIt.I;
  I.registerSingleton<Storage>(LocalStore());
  I.registerSingleton<LocalStorageRepository>(LocalStorageRepositoryImp());
  I.registerSingleton<AppNetworkInterface>(AppNetwork());
  I.registerSingleton<AppApi>(AppApiImp());
  I.registerSingleton<UserRepository>(UserRepositoryImp());
}
