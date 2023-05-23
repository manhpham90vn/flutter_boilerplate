import 'package:base_flutter/model/paging_user_response.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'paging_response.g.dart';
part 'paging_response.freezed.dart';

@freezed
class PagingResponse with _$PagingResponse {
  factory PagingResponse(
      {@JsonKey(name: 'array') List<PagingUserResponse>? items}) = _PagingResponse;

  factory PagingResponse.fromJson(Map<String, dynamic> json) =>
      _$$_PagingResponseFromJson(json);
}
