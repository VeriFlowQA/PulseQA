import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:flutter/material.dart';
import 'package:your_app/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('Login smoke test', (WidgetTester tester) async {
    app.main();
    await tester.pumpAndSettle();

    expect(find.text('Log In'), findsOneWidget);
    await tester.tap(find.text('Log In'));
    await tester.pumpAndSettle();

    expect(find.text('Email'), findsOneWidget);
  });
}
