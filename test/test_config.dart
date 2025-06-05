import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';

/// Global setup for all test suites.
/// This includes initializing test bindings, setting default configurations,
/// and printing useful logs when needed.
Future<void> globalTestSetup() async {
  TestWidgetsFlutterBinding.ensureInitialized();

  // Example: Initialize shared preferences, Firebase, etc. if needed
  // SharedPreferences.setMockInitialValues({});
  // await Firebase.initializeApp();

  print('🔧 Global test setup completed.');
}

/// Utility wrapper to standardize all tests.
void runConfiguredTests(String description, void Function() body) {
  group(description, () {
    setUp(() async {
      await globalTestSetup();
    });

    tearDown(() {
      // Cleanup actions here
    });

    body();
  });
}
