import 'package:freezed_annotation/freezed_annotation.dart';

part 'refresh_token_response.g.dart';
part 'refresh_token_response.freezed.dart';

@freezed
class RefreshTokenResponse with _$RefreshTokenResponse {
  factory RefreshTokenResponse(
      {@JsonKey(name: 'status') String? status,
      @JsonKey(name: 'token') String? token}) = _RefreshTokenResponse;

  factory RefreshTokenResponse.fromJson(Map<String, dynamic> json) =>
      _$$_RefreshTokenResponseFromJson(json);
}
