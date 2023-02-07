import 'package:dio/dio.dart';
import 'package:flutter_loggy_dio/flutter_loggy_dio.dart';

abstract class AppNetworkInterface {
  Future<Response<T>> request<T>(RequestData requestData);
}

abstract class RequestData {
  String get baseURL;
  String get path;
  String get method;
  dynamic get body;
  Map<String, dynamic>? get queryParameters;
  Map<String, dynamic> get header;
}

class AppNetwork implements AppNetworkInterface {
  late Dio dio;

  AppNetwork() {
    dio = Dio();
    dio.interceptors.add(LoggyDioInterceptor());
    dio.options.connectTimeout = 30000;
    dio.options.receiveTimeout = 30000;
  }

  @override
  Future<Response<T>> request<T>(RequestData requestData) {
    return dio.fetch(RequestOptions(
        baseUrl: requestData.baseURL,
        path: requestData.path,
        method: requestData.method,
        queryParameters: requestData.queryParameters,
        headers: requestData.header,
        data: requestData.body,
        contentType: Headers.formUrlEncodedContentType));
  }
}
