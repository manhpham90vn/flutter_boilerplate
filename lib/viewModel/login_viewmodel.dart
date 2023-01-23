import 'dart:async';

class LoginViewModel {

  final _loginStreamController = StreamController();
  Stream get loginStream => _loginStreamController.stream;

  final _passwordStreamController = StreamController();
  Stream get passwordStream => _passwordStreamController.stream;

  final _formStreamController = StreamController();
  Stream get formStream => _formStreamController.stream;

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
    _formStreamController.sink.add("ok");
  }

  void dispose() {
    _loginStreamController.close();
    _passwordStreamController.close();
    _formStreamController.close();
  }

}