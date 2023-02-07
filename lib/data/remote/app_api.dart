import 'dart:async';
import 'package:base_flutter/data/remote/login_request_data.dart';
import 'package:base_flutter/model/error_response.dart';
import 'package:base_flutter/networking/app_network.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import '../../model/login_response.dart';

abstract class AppApi {
  Future<LoginResponse> login(String email, String password);
}

class AppApiImp implements AppApi {

  final client = GetIt.I<AppNetworkInterface>();

  @override
  Future<LoginResponse> login(String email, String password) async {
    try {
      final response = await client.post(LoginRequestData(email: email, password: password));
      final obj = LoginResponse.fromJson(response.data);
      return obj;
    } on DioError catch (e) {
      final obj = ErrorResponse.fromJson(e.response?.data);
      return Future.error(obj);
    } on TypeError catch (e) {
      return Future.error(e);
    }
  }
}