import 'package:dio/dio.dart';
import 'package:dio_proxy_plugin/dio_proxy_plugin.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_loggy_dio/flutter_loggy_dio.dart';

abstract class AppNetworkInterface {
  Future<Response<T>> get<T>(RequestData requestData);
  Future<Response<T>> post<T>(RequestData requestData);
}

abstract class RequestData {
  String get path;
  dynamic get body;
  Map<String, dynamic>? get queryParameters;
  Map<String, dynamic> get header;
}

class AppNetwork implements AppNetworkInterface {
  late Dio dio;

  AppNetwork() {
    dio = Dio();
    if (!kReleaseMode) {
      dio.httpClientAdapter = HttpProxyAdapter(ipAddr: "192.168.100.173", port: 8888);
    }
    dio.interceptors.add(LoggyDioInterceptor());
    dio.options.baseUrl = "http://localhost.charlesproxy.com:3000/";
    dio.options.connectTimeout = 30000;
    dio.options.receiveTimeout = 30000;
  }

  @override
  Future<Response<T>> get<T>(RequestData requestData) {
    return dio.get(requestData.path,
        queryParameters: requestData.queryParameters);
  }

  @override
  Future<Response<T>> post<T>(RequestData requestData) {
    return dio.post(requestData.path,
        data: requestData.body,
        options: Options(contentType: Headers.formUrlEncodedContentType));
  }
}
