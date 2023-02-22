import 'package:base_flutter/bloc/base_viewmodel.dart';
import 'package:base_flutter/model/login_response.dart';
import 'package:base_flutter/repository/user_repository.dart';
import 'package:injectable/injectable.dart';
import 'package:loggy/loggy.dart';
import 'package:rxdart/rxdart.dart';
import '../repository/local_storage_repository.dart';

@Injectable()
class LoginViewModel extends BaseViewModel {

  final loginStreamController = BehaviorSubject<String>();
  final passwordStreamController = BehaviorSubject<String>();
  final successController = BehaviorSubject<LoginResponse>();

  final UserRepository user;
  final LocalStorageRepository local;
  LoginViewModel({required this.user, required this.local});

  validate(String email, String pass) {
    if (email.isEmpty || !email.contains("@")) {
      loginStreamController.addError("Email is invalid");
      return;
    }
    loginStreamController.add("ok");
    if (pass.isEmpty) {
      passwordStreamController.addError("Password is invalid");
      return;
    }
    passwordStreamController.add("ok");
    _login(email, pass);
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
    loginStreamController.close();
    passwordStreamController.close();
    successController.close();
  }
}
