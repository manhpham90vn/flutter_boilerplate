abstract class RequestData {
  String get path;
  dynamic get body;
  Map<String, dynamic>? get queryParameters;
  Map<String, dynamic> get header;
}
