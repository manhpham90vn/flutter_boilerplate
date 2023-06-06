import 'package:base_flutter/bloc/home_viewmodel.dart';
import 'package:base_flutter/bloc/login_viewmodel.dart';
import 'package:base_flutter/di/di.dart';
import 'package:base_flutter/repository/local_storage_repository.dart';
import 'package:base_flutter/ui/home_ui.dart';
import 'package:base_flutter/ui/login_ui.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:loggy/loggy.dart';
import 'package:flutter_loggy/flutter_loggy.dart';

class Routes {
  static const String login = "/login";
  static const String home = "/home";
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await configureDependencies();

  if (kDebugMode) {
    // Log
    Loggy.initLoggy(
      logPrinter: const PrettyDeveloperPrinter(),
    );
  }

  final accessToken = getIt<LocalStorageRepository>().getAccessToken();
  final homeViewModel = getIt<HomeViewModel>();
  final loginViewModel = getIt<LoginViewModel>();

  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: accessToken != null ? Routes.home : Routes.login,
      routes: {
        Routes.home: (context) => Home(
              vm: homeViewModel,
            ),
        Routes.login: (context) => LoginController(
              vm: loginViewModel,
            )
      }));
}
