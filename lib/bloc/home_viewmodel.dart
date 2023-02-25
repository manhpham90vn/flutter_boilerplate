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

  HomeViewModel({required this.user, required this.home, required this.local});

  void logOut() {
    local.removeAccessToken();
    local.removeRefreshToken();
  }

  // get data concurrent
  Future<void> getDataConcurrent() async {
    final response =
        await Future.wait([user.getUserInfo(), home.getList(1, "ascending")]);
    final isSuccessGetUserInfo = response[0].tryGetSuccess();
    final iSSuccessPaging = response[1].tryGetSuccess();
    logDebug("$isSuccessGetUserInfo $iSSuccessPaging");
  }

  // get data serial
  Future<void> getDataSerial() async {
    final userResponse = user.getUserInfo();
    logDebug(userResponse);
    final pagingResponse = home.getList(1, "ascending");
    logDebug(pagingResponse);
  }
}
