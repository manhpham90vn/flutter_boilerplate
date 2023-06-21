enum AppScreen {
  login('Login'),
  home('Home');

  const AppScreen(this.title);

  final String title;

  static const loginPath = '/login';
  static const homePath = '/home';
}