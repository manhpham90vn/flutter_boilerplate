import 'package:base_flutter/networking/app_network.dart';
import 'package:dio/dio.dart';

class LoginRequestData implements RequestData {
  LoginRequestData({ required this.email, required this.password });

  final String email;
  final String password;

  @override
  get body => { "email": email, "password": password };

  @override
  Map<String, dynamic> get header => { Headers.acceptHeader : Headers.jsonContentType };

  @override
  String get path => "login";

  @override
  Map<String, dynamic>? get queryParameters => null;

}