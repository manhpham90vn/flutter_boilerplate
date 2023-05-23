import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_response.g.dart';
part 'user_response.freezed.dart';

@freezed
class UserResponse with _$UserResponse {
  factory UserResponse(
      {@JsonKey(name: 'email') String? email,
      @JsonKey(name: 'name') String? name}) = _UserResponse;

  factory UserResponse.fromJson(Map<String, dynamic> json) =>
      _$$_UserResponseFromJson(json);
}
