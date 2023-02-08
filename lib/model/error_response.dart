import 'package:freezed_annotation/freezed_annotation.dart';

part 'error_response.g.dart';
part 'error_response.freezed.dart';

@freezed
class ErrorResponse with _$ErrorResponse {
  factory ErrorResponse(
      {@JsonKey(name: 'status') String? status,
      @JsonKey(name: 'message') String? message}) = _ErrorResponse;

  factory ErrorResponse.fromJson(Map<String, dynamic> json) =>
      _$$_ErrorResponseFromJson(json);
}
