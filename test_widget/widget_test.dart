// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:base_flutter/di/di.dart';
import 'package:base_flutter/ui/login_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() async {
  TestWidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();

  testWidgets('Login test', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: LoginController(),
    ));

    expect(find.byType(TextButton), findsOneWidget);

    await tester.tap(find.byType(TextButton));
    await tester.pump();

    expect(find.text("Email is empty"), findsOneWidget);
  });
}
