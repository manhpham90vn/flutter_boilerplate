import 'package:base_flutter/bloc/base_viewmodel.dart';
import 'package:base_flutter/model/paging_response.dart';
import 'package:base_flutter/model/user_response.dart';
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
    response[0].when((success) {
      final response = success as UserResponse;
      logDebug("user email ${response.email}");
      logDebug("usser name ${response.name}");
    }, (error) {
      logError(error);
    });
    response[1].when((success) {
      final response = success as PagingResponse;
      logDebug("paging ${response.items}");
    }, (error) {});
  }
}
