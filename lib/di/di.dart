import 'package:dio/dio.dart';
import 'package:dio_proxy_plugin/dio_proxy.dart';
import 'package:flutter_loggy_dio/flutter_loggy_dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../data/local/storage.dart';
import '../data/remote/app_api.dart';
import '../networking/app_network.dart';
import '../repository/local_storage_repository.dart';
import '../repository/user_repository.dart';

final getIt = GetIt.instance;

Future<void> configureDependencies() async {
  await _initSharedPref();
  _initDio();

  getIt.registerSingleton<Storage>(LocalStore());
  getIt.registerSingleton<LocalStorageRepository>(LocalStorageRepositoryImp());
  getIt.registerSingleton<AppNetworkInterface>(AppNetwork());
  getIt.registerSingleton<AppApi>(AppApiImp());
  getIt.registerSingleton<UserRepository>(UserRepositoryImp());
}

Future<void> _initSharedPref() async {
  final prefs = await SharedPreferences.getInstance();
  getIt.registerSingleton<SharedPreferences>(prefs);
}

void _initDio() {
  getIt.registerSingleton<Dio>(Dio()
    ..httpClientAdapter =
        HttpProxyAdapter(ipAddr: "192.168.100.173", port: 8888)
    ..interceptors.add(LoggyDioInterceptor())
    ..options.baseUrl = "http://localhost.charlesproxy.com:3000/"
    ..options.connectTimeout = 30000
    ..options.receiveTimeout = 30000);
}
