#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

test -f "$ROOT/core/SKILL.md"
test -f "$ROOT/core/metadata.yaml"
test -f "$ROOT/core/references/example.md"
test -f "$ROOT/core/references/accessibility.md"
test -f "$ROOT/core/references/flow-template.md"
test -f "$ROOT/core/references/legend.md"
test -f "$ROOT/core/references/project-legend-template.md"
test -f "$ROOT/core/references/template.md"
test -x "$ROOT/core/scripts/validate_wireframe.py"
test -f "$ROOT/evals/cases.md"

grep -q '^name: ascii-wireframe$' "$ROOT/core/metadata.yaml"
grep -q '^display_name: ASCII Wireframe$' "$ROOT/core/metadata.yaml"
grep -q '^description: Draft UI layouts as plain-text wireframes\.$' "$ROOT/core/metadata.yaml"
grep -q '^default_prompt: Use \$ascii-wireframe to draft this interface as a responsive plain-text wireframe before implementation\.$' "$ROOT/core/metadata.yaml"
grep -q '^supported_views: desktop,tablet,mobile,states$' "$ROOT/core/metadata.yaml"
grep -q 'gambar-ui' "$ROOT/core/metadata.yaml"
grep -q 'sketsa-ui' "$ROOT/core/metadata.yaml"
grep -q 'gambar layout' "$ROOT/core/SKILL.md"

grep -q '^## Workflow$' "$ROOT/core/SKILL.md"
grep -q '^## Responsive Views$' "$ROOT/core/SKILL.md"
grep -q '^## UI States$' "$ROOT/core/SKILL.md"
grep -q '^## Multi-Screen Flows$' "$ROOT/core/SKILL.md"
grep -q '^## Character Set$' "$ROOT/core/SKILL.md"
grep -q '^## Deliverable$' "$ROOT/core/SKILL.md"
grep -q '`wireframes/_legend.md`' "$ROOT/core/SKILL.md"
grep -q 'Never modify the installed legend' "$ROOT/core/SKILL.md"
grep -q '^# \[Screen Name\]$' "$ROOT/core/references/template.md"
grep -q '^# Legend$' "$ROOT/core/references/legend.md"
grep -q '^# Invoice List$' "$ROOT/core/references/example.md"
grep -q '^## Handoff$' "$ROOT/core/references/template.md"
grep -q '^# Multi-Screen Flow$' "$ROOT/core/references/flow-template.md"
grep -q '^# Project Wireframe Legend$' "$ROOT/core/references/project-legend-template.md"

if rg -n '\]\*' "$ROOT/core"; then
  echo "ambiguous star notation found in core" >&2
  exit 1
fi

if rg -n 'api-flow|API Flow|example-flow|flow-test-env' \
  "$ROOT/.github" "$ROOT/core" "$ROOT/adapters" "$ROOT/docs" "$ROOT/README.md" "$ROOT/scripts"; then
  echo "stale api-flow content found in distributed artifacts" >&2
  exit 1
fi
