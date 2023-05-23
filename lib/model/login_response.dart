import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_response.g.dart';
part 'login_response.freezed.dart';

@freezed
class LoginResponse with _$LoginResponse {
  factory LoginResponse(
      {@JsonKey(name: 'status') String? status,
      @JsonKey(name: 'token') String? token,
      @JsonKey(name: 'refreshToken') String? refreshToken}) = _LoginResponse;

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);
}
