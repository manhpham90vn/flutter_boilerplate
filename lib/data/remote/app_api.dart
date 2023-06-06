import 'dart:async';
import 'package:base_flutter/data/remote/get_list_data.dart';
import 'package:base_flutter/data/remote/get_user_info_data.dart';
import 'package:base_flutter/data/remote/login_request_data.dart';
import 'package:base_flutter/data/remote/refresh_token_data.dart';
import 'package:base_flutter/model/error_response.dart';
import 'package:base_flutter/model/paging_response.dart';
import 'package:base_flutter/model/refresh_token_response.dart';
import 'package:base_flutter/model/user_response.dart';
import 'package:base_flutter/networking/app_network.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:loggy/loggy.dart';
import 'package:multiple_result/multiple_result.dart';
import '../../model/login_response.dart';

abstract class AppApi {
  Future<Result<LoginResponse, dynamic>> login(String email, String password);
  Future<Result<RefreshTokenResponse, dynamic>> refreshToken(String token);
  Future<Result<PagingResponse, dynamic>> getList(int page, String sort);
  Future<Result<UserResponse, dynamic>> getUserInfo();
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
    } on DioException catch (e) {
      if (e.type == DioExceptionType.badResponse && e.response?.statusCode == 403) {
          try {
            final obj = ErrorResponse.fromJson(e.response?.data);
            return Error(obj);
          } catch (e) {
            return Error(e);
          }
      } else {
        return Error(e);
      }
    } catch (e) {
      return Error(e);
    }
  }

  @override
  Future<Result<PagingResponse, dynamic>> getList(int page, String sort) async {
    try {
      final response = await client.getRefreshable(GetListData(page: page, sort: sort));
      final obj = PagingResponse.fromJson(response.data);
      return Success(obj);
    } catch (e) {
      return Error(e);
    }
  }

  @override
  Future<Result<UserResponse, dynamic>> getUserInfo() async {
    try {
      final response = await client.getRefreshable(GetUserInfoData());
      final obj = UserResponse.fromJson(response.data);
      return Success(obj);
    } catch (e) {
      return Error(e);
    }
  }

  @override
  Future<Result<RefreshTokenResponse, dynamic>> refreshToken(String token) async {
    try {
      final response = await client.get(RefreshTokenData(token: token));
      final obj = RefreshTokenResponse.fromJson(response.data);
      return Success(obj);
    } catch (e) {
      return Error(e);
    }
  }
}
