import 'dart:io';
import 'package:test/test.dart';
import 'package:xml/xml.dart';

void main() {
  group('Maestro Test Reporter', () {
    final logFilePath = 'testdata/sample_maestro_log.txt';
    final outputXmlPath = 'build/allure-results/maestro-results.xml';

    setUp(() {
      // Create a dummy Maestro log
      final logContent = '''
- name: Login Test
✅ Step 1 completed
✅ Step 2 completed
Test run completed

- name: Payment Test
❌ Error: Payment failed
Test run completed
''';
      File(logFilePath)
        ..createSync(recursive: true)
        ..writeAsStringSync(logContent);
    });

    test('should generate a valid JUnit XML with correct test cases', () async {
      final result = await Process.run('dart', [
        'maestro_test_reporter.dart',
        logFilePath,
      ]);

      expect(result.exitCode, equals(0), reason: 'Script should run successfully');
      expect(File(outputXmlPath).existsSync(), isTrue, reason: 'Output XML should exist');

      final xml = XmlDocument.parse(File(outputXmlPath).readAsStringSync());
      final testCases = xml.findAllElements('testcase');
      final failures = xml.findAllElements('failure');

      expect(testCases.length, equals(2));
      expect(failures.length, equals(1));
    });

    tearDown(() {
      File(logFilePath).deleteSync();
      File(outputXmlPath).deleteSync();
    });
  });
}
