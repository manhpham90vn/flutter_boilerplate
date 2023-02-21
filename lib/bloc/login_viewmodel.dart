import 'dart:async';
import 'package:base_flutter/bloc/base_viewmodel.dart';
import 'package:base_flutter/repository/user_repository.dart';
import 'package:injectable/injectable.dart';
import 'package:loggy/loggy.dart';
import '../repository/local_storage_repository.dart';

@Injectable()
class LoginViewModel extends BaseViewModel {
  final _loginStreamController = StreamController();

  Stream get loginStream => _loginStreamController.stream;

  final _passwordStreamController = StreamController();
  Stream get passwordStream => _passwordStreamController.stream;

  final _successController = StreamController();
  Stream get successStream => _successController.stream;

  final UserRepository user;
  final LocalStorageRepository local;
  LoginViewModel({required this.user, required this.local});

  validate(String email, String pass) {
    if (email.isEmpty || !email.contains("@")) {
      _loginStreamController.sink.addError("Email is invalid");
      return;
    }
    _loginStreamController.sink.add("ok");
    if (pass.isEmpty) {
      _passwordStreamController.sink.addError("Password is invalid");
      return;
    }
    _passwordStreamController.sink.add("ok");
    _login(email, pass);
  }

  _login(String email, String pass) async {
    isLoadingController.sink.add(true);
    await user.login(email, pass).then((value) {
      logInfo(value);
      local.setAccessToken(value.token ?? "");
      _successController.sink.add(value);
      isLoadingController.sink.add(false);
    }).catchError((error) {
      logError(error);
      _successController.sink.addError(error);
      isLoadingController.sink.add(false);
    });
  }

  void dispose() {
    _loginStreamController.close();
    _passwordStreamController.close();
    _successController.close();
  }
}
