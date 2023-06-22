import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:go_router/go_router.dart';
import 'package:loggy/loggy.dart';

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
    logInfo('redirect to ${state.location}');
    final accessToken = getIt<LocalStorageRepository>().getAccessToken();
    if (accessToken == null) {
      return const LoginRoute().location;
    }
    return const HomeRoute().location;
  },
  debugLogDiagnostics: kDebugMode == true
);


@TypedGoRoute<HomeRoute>(path: HomeRoute.path)
class HomeRoute extends GoRouteData {
  const HomeRoute();

  static const path = '/home';

  @override
  Widget build(BuildContext context, GoRouterState state) => Home(vm: getIt<HomeViewModel>());
}

@TypedGoRoute<LoginRoute>(path: LoginRoute.path)
class LoginRoute extends GoRouteData {
  const LoginRoute();

  static const path = '/login';

  @override
  Widget build(BuildContext context, GoRouterState state) => LoginController(vm: getIt<LoginViewModel>());
}