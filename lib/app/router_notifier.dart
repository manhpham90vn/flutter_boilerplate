// import 'package:base_flutter/app/app_router.dart';
// import 'package:flutter/foundation.dart';
// import 'package:go_router/go_router.dart';
//
// class AppRouterNotifier extends RouterNotifier implements Listenable  {
//
//   VoidCallback? routerListener;
//
//   List<RouteBase> get routes => $appRoutes;
//
//   @override
//   Future<void> build() async {
//     // One could watch more providers and write logic accordingly
//
//     isAuth = await ref.watch(
//       authNotifierProvider.selectAsync(
//               (data) => data.map(signedIn: (_) => true, signedOut: (_) => false)),
//     );
//
//     ref.listenSelf((_, __) {
//       // One could write more conditional logic for when to call redirection
//       if (state.isLoading) return;
//       routerListener?.call();
//     });
//   }
//
//   @override
//   void addListener(VoidCallback listener) {
//     routerListener = listener;
//   }
//
//   @override
//   void removeListener(VoidCallback listener) {
//     routerListener = null;
//   }
//
// }