enum AppScreen {
  login,

}

extension AppScreenExt on AppScreen {
  String get path {
    switch (this) {
      case AppScreen.login:
        return "/login";
    }
  }
}