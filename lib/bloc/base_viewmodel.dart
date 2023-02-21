import 'dart:async';

abstract class BaseViewModel {
  final isLoadingController = StreamController<bool>();
  Stream<bool> get loadingStream => isLoadingController.stream;
}