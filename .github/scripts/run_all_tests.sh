#!/bin/bash
set -e

echo "📦 Fetching dependencies..."
flutter pub get

echo "🧪 Running analyzer..."
flutter analyze

echo "🧪 Running unit and widget tests..."
flutter test

echo "📱 Running integration tests..."
flutter test integration_test

echo "✅ All tests passed."
