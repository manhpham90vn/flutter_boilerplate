import 'package:base_flutter/app/app_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

import '../bloc/home_viewmodel.dart';
import '../bloc/login_viewmodel.dart';
import '../di/di.dart';
import '../repository/local_storage_repository.dart';
import '../ui/home_ui.dart';
import '../ui/login_ui.dart';

part 'app_route.g.dart';

final GoRouter route = GoRouter(
  routes: $appRoutes,
  redirect: (BuildContext context, GoRouterState state) {
    final accessToken = getIt<LocalStorageRepository>().getAccessToken();
    if (accessToken == null) {
      return const LoginRoute().location;
    }
    return const HomeRoute().location;
  }
);


@TypedGoRoute<HomeRoute>(path: AppScreen.homePath)
class HomeRoute extends GoRouteData {
  const HomeRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => Home(vm: getIt<HomeViewModel>());
}

@TypedGoRoute<LoginRoute>(path: AppScreen.loginPath)
class LoginRoute extends GoRouteData {
  const LoginRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => LoginController(vm: getIt<LoginViewModel>());
}