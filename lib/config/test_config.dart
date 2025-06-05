import 'package:flutter/foundation.dart';

/// Centralized place to handle environment setup, mock data flags, or QA toggles.
class TestConfig {
  static bool isStaging = false;
  static bool enableMockData = false;
  static bool isCI = false;

  static Future<void> init() async {
    // Example: Use environment variables or platform channels to override configs
    const environment = String.fromEnvironment('ENV', defaultValue: 'prod');

    switch (environment) {
      case 'staging':
        isStaging = true;
        enableMockData = true;
        break;
      case 'ci':
        isCI = true;
        break;
      default:
        isStaging = false;
    }

    debugPrint('[TestConfig] ENV: $environment');
  }
}
