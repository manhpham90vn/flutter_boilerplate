import 'package:base_flutter/bloc/login_viewmodel.dart';
import 'package:base_flutter/di/di.dart';
import 'package:base_flutter/ui/login_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  TestWidgetsFlutterBinding.ensureInitialized();
  SharedPreferences.setMockInitialValues({});
  await configureDependencies();

  final loginViewModel = getIt<LoginViewModel>();

  testWidgets('Login test', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: LoginController(vm: loginViewModel),
    ));

    expect(find.byType(TextButton), findsOneWidget);

    await tester.tap(find.byType(TextButton));
    await tester.pump();

    expect(find.text("Email is empty"), findsOneWidget);
  });
}
