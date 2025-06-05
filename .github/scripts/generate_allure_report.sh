#!/bin/bash
set -e

echo "📊 Generating Allure Report..."

# Make sure Allure CLI is installed
if ! command -v allure &> /dev/null; then
  echo "❌ Allure CLI not found. Please install it first."
  exit 1
fi

mkdir -p build/allure-results
mkdir -p build/allure-report

# Assume you’ve set up test output to allure format
allure generate build/allure-results --clean -o build/allure-report

echo "✅ Allure Report generated at build/allure-report/index.html"
