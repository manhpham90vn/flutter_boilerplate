import 'package:base_flutter/bloc/base_viewmodel.dart';
import 'package:base_flutter/repository/home_repository.dart';
import 'package:base_flutter/repository/local_storage_repository.dart';
import 'package:injectable/injectable.dart';
import 'package:loggy/loggy.dart';

import '../repository/user_repository.dart';

@Injectable()
class HomeViewModel extends BaseViewModel {
  final LocalStorageRepository local;
  final UserRepository user;
  final HomeRepository home;

  HomeViewModel(this.user, this.home, {required this.local});

  void logOut() {
    local.removeAccessToken();
    local.removeRefreshToken();
  }

  Future<void> getData() async {
    final response =
        await Future.wait([user.getUserInfo(), home.getList(1, "ascending")]);
    logInfo(response);
  }
}
