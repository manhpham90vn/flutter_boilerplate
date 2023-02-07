import 'package:base_flutter/networking/app_network.dart';

class LoginRequestData implements RequestData {
  LoginRequestData({ required this.email, required this.password });

  final String email;
  final String password;

  @override
  String get baseURL => "http://localhost.charlesproxy.com:3000/";

  @override
  get body => { "email": email, "password": password };

  @override
  Map<String, dynamic> get header => {};

  @override
  String get method => "post";

  @override
  String get path => "login";

  @override
  Map<String, dynamic>? get queryParameters => {};

}