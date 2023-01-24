import 'package:base_flutter/data/local/store.dart';
import 'package:base_flutter/model/error_response.dart';
import 'package:dio/dio.dart';
import 'package:base_flutter/model/login_response.dart';

class APIResult {
  bool isSuccess;
  String? message;

  APIResult({ required this.isSuccess, this.message });
}

class Service {
  static Future<APIResult> login(String email, String password) async {
    try {
      var dio = Dio();
      dio.options.baseUrl = "http://localhost.charlesproxy.com:3000/";
      dio.options.connectTimeout = 30000;
      dio.options.receiveTimeout = 30000;

      var response = await dio.post("login", data: { 'email': email, 'password': password }, options: Options(contentType: Headers.formUrlEncodedContentType));
      if (response.statusCode == 200) {
        final obj = LoginResponse.fromJson(response.data as Map<String, dynamic>);
        LocalStore.instance.setToken(obj.token ?? "");
        return APIResult(isSuccess: true);
      }
      return APIResult(isSuccess: false, message: "Unknown error");
    } on DioError catch (e) {
      final obj = ErrorResponse.fromJson(e.response?.data as Map<String, dynamic>);
      return APIResult(isSuccess: false, message: obj.message ?? "Unknown error");
    } catch (e) {
      return APIResult(isSuccess: false, message: "Unknown error");
    }
  }
}