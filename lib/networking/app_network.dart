import 'package:base_flutter/networking/request_data.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

abstract class AppNetworkInterface {
  Future<Response<T>> get<T>(RequestData requestData);
  Future<Response<T>> post<T>(RequestData requestData);
}

@Singleton(as: AppNetworkInterface)
class AppNetwork implements AppNetworkInterface {

  final Dio dio;
  AppNetwork({required this.dio});

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
