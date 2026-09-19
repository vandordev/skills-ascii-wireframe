#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
TMP_DIR="$(mktemp -d)"
trap 'rm -rf "$TMP_DIR"' EXIT

cp -R "$ROOT" "$TMP_DIR/repo"
"$TMP_DIR/repo/scripts/sync.sh" >/dev/null

cmp -s "$ROOT/adapters/codex/SKILL.md" "$TMP_DIR/repo/adapters/codex/SKILL.md" || { echo "hash mismatch: $ROOT/adapters/codex/SKILL.md" >&2; exit 1; }
cmp -s "$ROOT/adapters/codex/agents/openai.yaml" "$TMP_DIR/repo/adapters/codex/agents/openai.yaml" || { echo "hash mismatch: $ROOT/adapters/codex/agents/openai.yaml" >&2; exit 1; }
cmp -s "$ROOT/adapters/claude/CLAUDE.md" "$TMP_DIR/repo/adapters/claude/CLAUDE.md" || { echo "hash mismatch: $ROOT/adapters/claude/CLAUDE.md" >&2; exit 1; }
cmp -s "$ROOT/adapters/copilot/copilot-instructions.md" "$TMP_DIR/repo/adapters/copilot/copilot-instructions.md" || { echo "hash mismatch: $ROOT/adapters/copilot/copilot-instructions.md" >&2; exit 1; }
cmp -s "$ROOT/adapters/gemini/GEMINI.md" "$TMP_DIR/repo/adapters/gemini/GEMINI.md" || { echo "hash mismatch: $ROOT/adapters/gemini/GEMINI.md" >&2; exit 1; }
cmp -s "$ROOT/adapters/opencode/AGENTS.md" "$TMP_DIR/repo/adapters/opencode/AGENTS.md" || { echo "hash mismatch: $ROOT/adapters/opencode/AGENTS.md" >&2; exit 1; }
cmp -s "$ROOT/adapters/cursor/AGENTS.md" "$TMP_DIR/repo/adapters/cursor/AGENTS.md" || { echo "hash mismatch: $ROOT/adapters/cursor/AGENTS.md" >&2; exit 1; }

for adapter in codex claude copilot gemini opencode cursor; do
  for reference in example.md legend.md template.md; do
    cmp -s "$ROOT/core/references/$reference" "$ROOT/adapters/$adapter/references/$reference" || { echo "reference mismatch: $adapter $reference" >&2; exit 1; }
  done
done

grep -q '^# Compatibility Contract$' "$ROOT/docs/compatibility-contract.md" || { echo "missing compatibility contract heading" >&2; exit 1; }
grep -q '^# Install For Codex$' "$ROOT/docs/install-codex.md" || { echo "missing codex install doc heading" >&2; exit 1; }
grep -q '^# Install For Claude$' "$ROOT/docs/install-claude.md" || { echo "missing claude install doc heading" >&2; exit 1; }
grep -q '^# Install For Copilot$' "$ROOT/docs/install-copilot.md" || { echo "missing copilot install doc heading" >&2; exit 1; }
grep -q '^# Install For Gemini$' "$ROOT/docs/install-gemini.md" || { echo "missing gemini install doc heading" >&2; exit 1; }
grep -q '^# Install For OpenCode$' "$ROOT/docs/install-opencode.md" || { echo "missing opencode install doc heading" >&2; exit 1; }
grep -q '^# Install For Cursor$' "$ROOT/docs/install-cursor.md" || { echo "missing cursor install doc heading" >&2; exit 1; }

echo "parity ok"
