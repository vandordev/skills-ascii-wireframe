#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

required_files=(
  "$ROOT/core/SKILL.md"
  "$ROOT/core/metadata.yaml"
  "$ROOT/core/references/accessibility.md"
  "$ROOT/core/references/example.md"
  "$ROOT/core/references/flow-template.md"
  "$ROOT/core/references/legend.md"
  "$ROOT/core/references/project-legend-template.md"
  "$ROOT/core/references/template.md"
  "$ROOT/core/scripts/validate_wireframe.py"
  "$ROOT/evals/cases.md"
  "$ROOT/adapters/codex/SKILL.md"
  "$ROOT/adapters/codex/agents/openai.yaml"
  "$ROOT/adapters/codex/scripts/validate_wireframe.py"
  "$ROOT/adapters/claude/CLAUDE.md"
  "$ROOT/adapters/copilot/copilot-instructions.md"
  "$ROOT/adapters/gemini/GEMINI.md"
  "$ROOT/adapters/opencode/AGENTS.md"
  "$ROOT/adapters/cursor/AGENTS.md"
)

required_meta_keys=(
  "name"
  "display_name"
  "description"
  "default_prompt"
  "supported_views"
  "trigger_phrases"
  "targets"
)

for file in "${required_files[@]}"; do
  test -f "$file" || {
    echo "missing required file: $file" >&2
    exit 1
  }
done

for adapter in codex claude copilot gemini opencode cursor; do
  test -x "$ROOT/adapters/$adapter/scripts/validate_wireframe.py" || {
    echo "wireframe validator is not executable for adapter: $adapter" >&2
    exit 1
  }
done

for key in "${required_meta_keys[@]}"; do
  grep -q "^$key: " "$ROOT/core/metadata.yaml" || {
    echo "missing metadata key: $key" >&2
    exit 1
  }
done

grep -q 'allow_implicit_invocation: true' "$ROOT/adapters/codex/agents/openai.yaml" || {
  echo "codex openai.yaml missing allow_implicit_invocation" >&2
  exit 1
}

scan_files=()

while IFS= read -r file; do
  scan_files+=("$file")
done < <(find "$ROOT/adapters" -type f \( -name '*.md' -o -name '*.yaml' \))

for doc_file in \
  "$ROOT/docs/compatibility-contract.md" \
  "$ROOT/docs/install-codex.md" \
  "$ROOT/docs/install-claude.md" \
  "$ROOT/docs/install-copilot.md" \
  "$ROOT/docs/install-gemini.md" \
  "$ROOT/docs/install-opencode.md" \
  "$ROOT/docs/install-cursor.md"; do
  if test -f "$doc_file"; then
    scan_files+=("$doc_file")
  fi
done

for file in "${scan_files[@]}"; do
  if grep -nE 'BROKEN_MARKER|UNRESOLVED_PLACEHOLDER|\{\{UNRESOLVED\}\}' "$file"; then
    echo "unresolved marker in: $file" >&2
    exit 1
  fi
done

echo "validation ok"
