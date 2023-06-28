import 'package:base_flutter/app/app_router.dart';
import 'package:base_flutter/di/di.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:loggy/loggy.dart';
import 'package:flutter_loggy/flutter_loggy.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await configureDependencies();

  if (kDebugMode) {
    // Log
    Loggy.initLoggy(
      logPrinter: const PrettyDeveloperPrinter(),
    );
  }

  runApp(MaterialApp.router(debugShowCheckedModeBanner: false, routerConfig: route,));
}