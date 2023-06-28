import 'package:flutter/foundation.dart';

import '../di/di.dart';
import '../repository/local_storage_repository.dart';

class AppRouterNotifier extends ChangeNotifier {
  AppRouterNotifier() {
    final accessToken = getIt<LocalStorageRepository>().getAccessToken();
    if (accessToken != null) {
      isLoggedIn = true;
    }
  }

  bool _isLoggedIn = false;
  bool get isLoggedIn => _isLoggedIn;

  set isLoggedIn(bool value) {
    _isLoggedIn = value;
    notifyListeners();
  }
}
