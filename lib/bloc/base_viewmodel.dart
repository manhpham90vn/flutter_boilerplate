import 'package:rxdart/rxdart.dart';

abstract class BaseViewModel {
  final isLoadingController = BehaviorSubject<bool>();
}