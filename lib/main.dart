import 'package:base_flutter/di/di.dart';
import 'package:base_flutter/ui/home_ui.dart';
import 'package:base_flutter/ui/login_ui.dart';
import 'package:flutter/material.dart';
import 'package:loggy/loggy.dart';
import 'package:flutter_loggy/flutter_loggy.dart';

class Routes {
  static const String login = "/login";
  static const String home = "/home";
}

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  register();

  Loggy.initLoggy(
    logPrinter: const PrettyDeveloperPrinter(),
  );
  
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: Routes.login,
    routes: {
      Routes.home: (context) => const Home(),
      Routes.login: (context) => const LoginController()
    }
  ));
}

