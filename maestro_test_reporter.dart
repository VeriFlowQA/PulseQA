import 'dart:io';
import 'package:xml/xml.dart';

void main(List<String> arguments) async {
  if (arguments.length != 1) {
    print('Usage: dart maestro_test_reporter.dart <log_file>');
    exit(1);
  }

  final logFile = File(arguments[0]);
  if (!await logFile.exists()) {
    print('Error: Log file does not exist.');
    exit(2);
  }

  final lines = await logFile.readAsLines();

  final tests = <Map<String, String>>[];
  String? currentTestName;
  bool testFailed = false;

  for (final line in lines) {
    if (line.trim().startsWith('- name:')) {
      currentTestName = line.split(':').last.trim();
      testFailed = false;
    } else if (line.contains('FAILED') || line.contains('Error:')) {
      testFailed = true;
    } else if (line.contains('Test run completed') && currentTestName != null) {
      tests.add({
        'name': currentTestName,
        'status': testFailed ? 'failed' : 'passed',
      });
    }
  }

  final builder = XmlBuilder();
  builder.processing('xml', 'version="1.0"');
  builder.element('testsuites', nest: () {
    builder.element('testsuite', attributes: {
      'name': 'MaestroTestSuite',
      'tests': '${tests.length}',
      'failures': '${tests.where((t) => t['status'] == 'failed').length}',
    }, nest: () {
      for (final test in tests) {
        builder.element('testcase', attributes: {
          'name': test['name']!,
        }, nest: () {
          if (test['status'] == 'failed') {
            builder.element('failure', nest: 'Test failed.');
          }
        });
      }
    });
  });

  final xmlDoc = builder.buildDocument();
  final outputDir = Directory('build/allure-results');
  if (!outputDir.existsSync()) {
    outputDir.createSync(recursive: true);
  }
  final outputFile = File('${outputDir.path}/maestro-results.xml');
  await outputFile.writeAsString(xmlDoc.toXmlString(pretty: true));
  print('✅ JUnit report generated at ${outputFile.path}');
}
