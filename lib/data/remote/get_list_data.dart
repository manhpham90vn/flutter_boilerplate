import '../../networking/request_data.dart';

class GetListData implements RequestData {
  GetListData({required this.page, required this.sort});

  final int page;
  final String sort;

  @override
  get body => null;

  @override
  Map<String, dynamic> get header => {};

  @override
  String get path => "paging";

  @override
  Map<String, dynamic>? get queryParameters => {"page": page, "sort": sort};
}
