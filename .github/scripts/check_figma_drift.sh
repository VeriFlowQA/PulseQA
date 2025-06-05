#!/bin/bash
set -e

echo "🔍 Checking for Figma drift..."

FIGMA_DIFF=$(git diff --name-only HEAD~1 HEAD | grep -E 'lib/ui/|assets/figma/')

if [[ -n "$FIGMA_DIFF" ]]; then
  echo "⚠️ Potential UI drift detected between Figma and implementation:"
  echo "$FIGMA_DIFF"
  exit 1
else
  echo "✅ No Figma drift detected."
fi
