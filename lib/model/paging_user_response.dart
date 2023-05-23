import 'package:freezed_annotation/freezed_annotation.dart';

part 'paging_user_response.g.dart';
part 'paging_user_response.freezed.dart';

@freezed
class PagingUserResponse with _$PagingUserResponse {
  factory PagingUserResponse(
      {@JsonKey(name: 'name') String? name,
      @JsonKey(name: 'age') int? age}) = _PagingUserResponse;

  factory PagingUserResponse.fromJson(Map<String, dynamic> json) =>
      _$$_PagingUserResponseFromJson(json);
}
