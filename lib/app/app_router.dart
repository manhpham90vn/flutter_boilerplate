import 'package:base_flutter/app/router_notifier.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:go_router/go_router.dart';
import 'package:loggy/loggy.dart';

import '../bloc/home_viewmodel.dart';
import '../bloc/login_viewmodel.dart';
import '../di/di.dart';
import '../ui/home_ui.dart';
import '../ui/login_ui.dart';
import 'app_router_observer.dart';

part 'app_router.g.dart';

final notifier = AppRouterNotifier();

final GoRouter route = GoRouter(
    routes: $appRoutes,
    redirect: (BuildContext context, GoRouterState state) {
      final isLoggedIn = notifier.isLoggedIn;
      if (!isLoggedIn) {
        return const LoginRoute().location;
      }
      return null;
    },
    initialLocation: const HomeRoute().location,
    debugLogDiagnostics: kDebugMode == true,
    errorBuilder: (context, state) => const LoginRoute().build(context, state),
    observers: [AppRouterObserver()],
    refreshListenable: notifier);

@TypedGoRoute<HomeRoute>(path: HomeRoute.path)
class HomeRoute extends GoRouteData {
  const HomeRoute();

  static const path = '/home';

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      Home(vm: getIt<HomeViewModel>());
}

@TypedGoRoute<LoginRoute>(path: LoginRoute.path)
class LoginRoute extends GoRouteData {
  const LoginRoute();

  static const path = '/login';

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      LoginController(vm: getIt<LoginViewModel>());
}
