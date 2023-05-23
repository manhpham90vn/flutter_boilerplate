import 'package:base_flutter/data/local/storage.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BearerInterceptor extends Interceptor {
  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    // todo: how to use di here with no di cycle
    final pref = await SharedPreferences.getInstance();
    final token = pref.getString(StorageConstants.token);
    if (token != null) {
      options.headers["Authorization"] = "Bearer $token";
    }
    super.onRequest(options, handler);
  }
}
