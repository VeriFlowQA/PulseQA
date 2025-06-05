# ✅ Test Strategy

## Objective
Ensure robust, reliable, and scalable QA coverage across the entire Flutter mobile app.

## Scope
- **Unit Tests** for pure Dart logic (Bloc/Cubit)
- **Widget Tests** for UI component behavior
- **Integration Tests** for end-to-end user flows
- **Maestro Tests** for platform-level and device-level scenarios
- **Performance & UAT** in staging environments
- **Cross-platform** checks for iOS & Android consistency

## Tools & Stack
- **Framework**: Flutter + BLoC
- **Unit/Widget**: `flutter_test`, `mockito`, `bloc_test`
- **Integration**: `integration_test`, `test`, `flutter_driver`
- **Automation**: Maestro, Codemagic CI/CD, GitHub Actions
- **Crash/Log**: Firebase Crashlytics, Datadog
- **Test Cases**: Zephyr/TestRail (or Google Sheets)
- **Version Control**: Git + PR review automation (CODEOWNERS, auto_assign)

## Test Categories
| Type              | Tools                | Frequency      |
|-------------------|----------------------|----------------|
| Unit              | bloc_test, mockito   | Per commit     |
| Widget            | flutter_test         | Per PR         |
| Integration       | integration_test     | Nightly + PR   |
| Device automation | Maestro              | Nightly        |
| Manual/UAT        | Internal checklist   | Before release |
| Performance       | DevTool & CI metrics | Before release |

## Metrics
- **Code Coverage ≥ 90%**
- **Crash-free Sessions ≥ 99.9%**
- **PR Test Status: Required**
- **Test Runtime: ≤ 8 min**
