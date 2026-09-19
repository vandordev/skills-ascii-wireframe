#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
VALIDATOR="$ROOT/core/scripts/validate_wireframe.py"
TMP_DIR="$(mktemp -d)"
trap 'rm -rf "$TMP_DIR"' EXIT

"$VALIDATOR" "$ROOT/tests/fixtures/valid-screen.md"
"$VALIDATOR" --ascii "$ROOT/tests/fixtures/valid-screen.md"
"$VALIDATOR" "$ROOT/tests/fixtures/valid-flow.md"

if "$VALIDATOR" "$ROOT/tests/fixtures/invalid-ambiguous-modifier.md" >"$TMP_DIR/ambiguous.log" 2>&1; then
  echo "expected ambiguous modifier fixture to fail"
  exit 1
fi
grep -q 'ambiguous `\*` modifier' "$TMP_DIR/ambiguous.log"

if "$VALIDATOR" "$ROOT/tests/fixtures/invalid-placeholder.md" >"$TMP_DIR/placeholder.log" 2>&1; then
  echo "expected unresolved placeholder fixture to fail"
  exit 1
fi
grep -q 'template placeholder' "$TMP_DIR/placeholder.log"

if "$VALIDATOR" --ascii "$ROOT/tests/fixtures/invalid-unicode.md" >"$TMP_DIR/unicode.log" 2>&1; then
  echo "expected Unicode fixture to fail in strict ASCII mode"
  exit 1
fi
grep -q 'non-ASCII character' "$TMP_DIR/unicode.log"
