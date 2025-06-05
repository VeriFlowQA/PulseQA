import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';

void main() {
  testWidgets('Displays test report results correctly', (WidgetTester tester) async {
    // Sample test results
    final testResults = [
      {'name': 'Login Test', 'status': 'passed'},
      {'name': 'Payment Test', 'status': 'failed'},
    ];

    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: ListView(
          children: testResults.map((test) {
            return ListTile(
              title: Text(test['name']!),
              trailing: Icon(
                test['status'] == 'passed' ? Icons.check_circle : Icons.error,
                color: test['status'] == 'passed' ? Colors.green : Colors.red,
              ),
            );
          }).toList(),
        ),
      ),
    ));
//         
    // Verify both tests are rendered
    expect(find.text('Login Test'), findsOneWidget);
    expect(find.text('Payment Test'), findsOneWidget);
    expect(find.byIcon(Icons.check_circle), findsOneWidget);
    expect(find.byIcon(Icons.error), findsOneWidget);
  });
}
