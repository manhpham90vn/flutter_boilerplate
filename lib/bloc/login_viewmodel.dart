import 'package:base_flutter/bloc/base_viewmodel.dart';
import 'package:base_flutter/model/login_response.dart';
import 'package:base_flutter/repository/user_repository.dart';
import 'package:injectable/injectable.dart';
import 'package:loggy/loggy.dart';
import 'package:rxdart/rxdart.dart';
import '../repository/local_storage_repository.dart';

@Injectable()
class LoginViewModel extends BaseViewModel {
  // input
  void onChangedLogin(String value) => loginInputController.add(value);
  void onChangedPass(String value) => passInputController.add(value);
  final loginInputController = BehaviorSubject<String>();
  final passInputController = BehaviorSubject<String>();

  // output
  final loginOutputController = BehaviorSubject<String>();
  final passOutputController = BehaviorSubject<String>();
  final successController = BehaviorSubject<LoginResponse>();

  // di
  final UserRepository user;
  final LocalStorageRepository local;
  LoginViewModel({required this.user, required this.local});

  validate() {
    if (loginInputController.valueOrNull == null) {
      loginOutputController.addError("Email is empty");
      return;
    }
    if (!loginInputController.value.contains("@")) {
      loginOutputController.addError("Email is invalid");
      return;
    }
    loginOutputController.add("ok");
    if (passInputController.valueOrNull == null) {
      passOutputController.addError("Password is empty");
      return;
    }
    passOutputController.add("ok");
    _login(loginInputController.value, passInputController.value);
  }

  _login(String email, String pass) async {
    isLoadingController.add(true);
    await user.login(email, pass).then((value) {
      logInfo(value);
      local.setAccessToken(value.token ?? "");
      successController.add(value);
      isLoadingController.add(false);
    }).catchError((error) {
      logError(error);
      successController.addError(error);
      isLoadingController.add(false);
    });
  }

  void dispose() {
    loginInputController.close();
    passInputController.close();
    loginOutputController.close();
    passOutputController.close();
    successController.close();
  }
}
