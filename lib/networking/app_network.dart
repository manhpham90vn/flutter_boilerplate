import 'package:base_flutter/networking/request_data.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

abstract class AppNetworkInterface {
  Future<Response<T>> get<T>(RequestData requestData);
  Future<Response<T>> post<T>(RequestData requestData);
  Future<Response<T>> getRefreshable<T>(RequestData requestData);
  Future<Response<T>> postRefreshable<T>(RequestData requestData);
}

@Singleton(as: AppNetworkInterface)
class AppNetwork implements AppNetworkInterface {

  final Dio dio;
  final Dio dioRefreshable;

  AppNetwork({@Named("dio") required this.dio, @Named("dioRefreshable") required this.dioRefreshable});

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
  
  @override
  Future<Response<T>> getRefreshable<T>(RequestData requestData) {
    return dioRefreshable.get(requestData.path,
        queryParameters: requestData.queryParameters);
  }
  
  @override
  Future<Response<T>> postRefreshable<T>(RequestData requestData) {
    return dioRefreshable.post(requestData.path,
        data: requestData.body,
        options: Options(contentType: Headers.formUrlEncodedContentType));
  }
}
