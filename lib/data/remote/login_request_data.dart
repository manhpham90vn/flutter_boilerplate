import '../../networking/request_data.dart';

class LoginRequestData implements RequestData {
  LoginRequestData({required this.email, required this.password});

  final String email;
  final String password;

  @override
  get body => {"email": email, "password": password};

  @override
  Map<String, dynamic> get header => {};

  @override
  String get path => "login";

  @override
  Map<String, dynamic>? get queryParameters => null;
}
