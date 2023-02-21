import 'package:dio/dio.dart';
import 'package:dio_proxy_plugin/dio_proxy.dart';
import 'package:flutter_loggy_dio/flutter_loggy_dio.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@module
abstract class RegisterModule {
  @singleton
  Dio get dio => Dio()
    ..httpClientAdapter =
        HttpProxyAdapter(ipAddr: "192.168.100.193", port: 8888)
    ..interceptors.add(LoggyDioInterceptor())
    ..options.baseUrl = "http://localhost.charlesproxy.com:3000/"
    ..options.connectTimeout = 30000
    ..options.receiveTimeout = 30000;

  @singleton
  @preResolve
  Future<SharedPreferences> get prefs => SharedPreferences.getInstance();
}
