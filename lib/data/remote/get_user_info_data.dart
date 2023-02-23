import '../../networking/request_data.dart';

class GetUserInfoData implements RequestData {
  GetUserInfoData();

  @override
  get body => null;

  @override
  Map<String, dynamic> get header => {};

  @override
  String get path => "user";

  @override
  Map<String, dynamic>? get queryParameters => null;
}
