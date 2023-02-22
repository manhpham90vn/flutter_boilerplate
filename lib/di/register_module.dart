import 'package:dio/dio.dart';
import 'package:dio_proxy_plugin/dio_proxy.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_loggy_dio/flutter_loggy_dio.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../networking/refresh_token_interceptor.dart';

@module
abstract class RegisterModule {

  static const proxy = "192.168.100.193";
  static const port = 8888;

  @singleton
  @Named("dio")  
  Dio get dio => _dio();

  @singleton
  @Named("dioRefreshable")  
  Dio get dioRefreshable => _dioRefreshable();

  @singleton
  @preResolve
  Future<SharedPreferences> get prefs => SharedPreferences.getInstance();

  Dio _dio() {
    final dio = Dio();
    if (kDebugMode) {
      dio.httpClientAdapter = HttpProxyAdapter(ipAddr: proxy, port: port);
      dio.interceptors.add(LoggyDioInterceptor());
    }
    dio.options.baseUrl = "http://localhost.charlesproxy.com:3000/";
    dio.options.connectTimeout = 30000;
    dio.options.receiveTimeout = 30000;
    return dio;
  }

  Dio _dioRefreshable() {
    final dio = Dio();
    if (kDebugMode) {
      dio.httpClientAdapter = HttpProxyAdapter(ipAddr: proxy, port: port);
      dio.interceptors.add(LoggyDioInterceptor());
    }
    dio.interceptors.add(RefreshTokenInterceptor());
    dio.options.baseUrl = "http://localhost.charlesproxy.com:3000/";
    dio.options.connectTimeout = 30000;
    dio.options.receiveTimeout = 30000;
    return dio;
  }
}
