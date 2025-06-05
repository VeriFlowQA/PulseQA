#!/bin/bash

set -e

echo "🔍 Running Flutter analyzer..."
flutter analyze

echo ""
echo "🎯 Checking Dart formatting..."
dart format --set-exit-if-changed .

echo ""
echo "✅ All checks passed!"
