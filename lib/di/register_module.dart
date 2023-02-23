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
  static const connectTimeout = 30000;
  static const receiveTimeout = 30000;

  @Named("dio")
  @singleton
  Dio get dio => _dio();

  @Named("dioRefreshable")
  @singleton
  Dio get dioRefreshable => _dioRefreshable();

  @singleton
  @preResolve
  Future<SharedPreferences> get prefs => SharedPreferences.getInstance();

  Dio _dio() {
    var dio = _initDio();
    dio.options.baseUrl = "http://localhost.charlesproxy.com:3000/";
    return dio;
  }

  Dio _dioRefreshable() {
    var dio = _initDio();
    dio.options.baseUrl = "http://localhost.charlesproxy.com:3001/";
    dio.interceptors.add(RefreshTokenInterceptor());
    return dio;
  }

  Dio _initDio() {
    final dio = Dio();
    if (kDebugMode) {
      dio.httpClientAdapter = HttpProxyAdapter(ipAddr: proxy, port: port);
      dio.interceptors.add(LoggyDioInterceptor());
    }
    dio.options.connectTimeout = connectTimeout;
    dio.options.receiveTimeout = receiveTimeout;
    return dio;
  }
}
