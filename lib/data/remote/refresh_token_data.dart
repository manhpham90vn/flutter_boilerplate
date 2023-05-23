import '../../networking/request_data.dart';

class RefreshTokenData implements RequestData {
  RefreshTokenData({required this.token});

  final String token;

  @override
  get body => {"token": token};

  @override
  Map<String, dynamic> get header => {};

  @override
  String get path => "refreshToken";

  @override
  Map<String, dynamic>? get queryParameters => null;
}
