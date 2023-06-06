import 'dart:io';

import 'package:base_flutter/networking/bearer_interceptor.dart';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../networking/refresh_token_interceptor.dart';

const _proxy = "192.168.100.112";
const _port = 8888;
const _connectTimeout = 30;
const _receiveTimeout = 30;

@module
abstract class RegisterModule {
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
    return dio;
  }

  Dio _dioRefreshable() {
    var dio = _initDio();
    dio.interceptors.add(RefreshTokenInterceptor());
    dio.interceptors.add(BearerInterceptor());
    return dio;
  }

  Dio _initDio() {
    final dio = Dio();
    dio.options.baseUrl = "http://localhost.charlesproxy.com:3000/";
    dio.options.connectTimeout = const Duration(seconds: _connectTimeout);
    dio.options.receiveTimeout = const Duration(seconds: _receiveTimeout);
    if (kDebugMode) {
        dio.httpClientAdapter = IOHttpClientAdapter(createHttpClient: () {
        final client = HttpClient();
        client.findProxy = (uri) {
          return 'PROXY $_proxy:$_port';
        };
        return client;
        }); 
    }
    return dio;
  }
}