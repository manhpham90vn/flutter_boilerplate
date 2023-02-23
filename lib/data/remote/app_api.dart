import 'dart:async';
import 'package:base_flutter/data/remote/login_request_data.dart';
import 'package:base_flutter/model/error_response.dart';
import 'package:base_flutter/networking/app_network.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:multiple_result/multiple_result.dart';
import '../../model/login_response.dart';

abstract class AppApi {
  Future<Result<LoginResponse, dynamic>> login(String email, String password);
}

@Singleton(as: AppApi)
class AppApiImp implements AppApi {
  final AppNetworkInterface client;

  AppApiImp({required this.client});

  @override
  Future<Result<LoginResponse, dynamic>> login(String email, String password) async {
    try {
      final response = await client.post(LoginRequestData(email: email, password: password));
      final obj = LoginResponse.fromJson(response.data);
      return Success(obj);
    } on DioError catch (e) {
      try {
        final obj = ErrorResponse.fromJson(e.response?.data);
        return Error(obj);
      } catch (e) {
        return Error(e);
      }
    } catch (e) {
      return Error(e);
    }
  }
}
