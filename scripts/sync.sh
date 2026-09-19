#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
CORE_DIR="$ROOT/core"
ADAPTERS_DIR="$ROOT/adapters"

read_meta() {
  local key="$1"
  awk -F': ' -v key="$key" '$1 == key { print substr($0, length($1) + 3); exit }' "$CORE_DIR/metadata.yaml"
}

copy_references() {
  local adapter_dir="$1"
  mkdir -p "$adapter_dir/references"
  cp "$CORE_DIR"/references/* "$adapter_dir/references/"
}

copy_skill_scripts() {
  local adapter_dir="$1"
  mkdir -p "$adapter_dir/scripts"
  cp "$CORE_DIR"/scripts/* "$adapter_dir/scripts/"
  chmod +x "$adapter_dir"/scripts/*
}

render_core_body() {
  awk 'NR == 1 && $0 == "---" { in_frontmatter = 1; next } in_frontmatter && $0 == "---" { in_frontmatter = 0; next } !in_frontmatter { print }' "$CORE_DIR/SKILL.md"
}

render_markdown_adapter() {
  local output_file="$1"
  local title="$2"
  local intro="$3"

  mkdir -p "$(dirname "$output_file")"
  {
    printf '# %s\n\n' "$title"
    printf '%s\n\n' "$intro"
    printf '## Canonical Workflow\n\n'
    render_core_body
  } > "$output_file"
}

NAME="$(read_meta name)"
DISPLAY_NAME="$(read_meta display_name)"
DESCRIPTION="$(read_meta description)"
DEFAULT_PROMPT="$(read_meta default_prompt)"

rm -rf "$ADAPTERS_DIR"

mkdir -p "$ADAPTERS_DIR/codex/agents"
cat "$CORE_DIR/SKILL.md" > "$ADAPTERS_DIR/codex/SKILL.md"

cat > "$ADAPTERS_DIR/codex/agents/openai.yaml" <<EOF
interface:
  display_name: "$DISPLAY_NAME"
  short_description: "$DESCRIPTION"
  default_prompt: "$DEFAULT_PROMPT"

policy:
  allow_implicit_invocation: true
EOF

copy_references "$ADAPTERS_DIR/codex"
copy_skill_scripts "$ADAPTERS_DIR/codex"

render_markdown_adapter \
  "$ADAPTERS_DIR/claude/CLAUDE.md" \
  "ASCII Wireframe for Claude" \
  "Use this file as the reusable Claude instruction for drafting consistent plain-text UI wireframes."
copy_references "$ADAPTERS_DIR/claude"
copy_skill_scripts "$ADAPTERS_DIR/claude"

render_markdown_adapter \
  "$ADAPTERS_DIR/copilot/copilot-instructions.md" \
  "ASCII Wireframe for Copilot" \
  "Use this file as the repository-level Copilot instruction for drafting consistent plain-text UI wireframes."
copy_references "$ADAPTERS_DIR/copilot"
copy_skill_scripts "$ADAPTERS_DIR/copilot"

render_markdown_adapter \
  "$ADAPTERS_DIR/gemini/GEMINI.md" \
  "ASCII Wireframe for Gemini" \
  "Use this file as the reusable Gemini instruction for drafting consistent plain-text UI wireframes."
copy_references "$ADAPTERS_DIR/gemini"
copy_skill_scripts "$ADAPTERS_DIR/gemini"

render_markdown_adapter \
  "$ADAPTERS_DIR/opencode/AGENTS.md" \
  "ASCII Wireframe for OpenCode" \
  "Use this AGENTS.md file as the OpenCode project instruction for drafting consistent plain-text UI wireframes."
copy_references "$ADAPTERS_DIR/opencode"
copy_skill_scripts "$ADAPTERS_DIR/opencode"

render_markdown_adapter \
  "$ADAPTERS_DIR/cursor/AGENTS.md" \
  "ASCII Wireframe for Cursor" \
  "Use this AGENTS.md file as the Cursor project instruction for drafting consistent plain-text UI wireframes."
copy_references "$ADAPTERS_DIR/cursor"
copy_skill_scripts "$ADAPTERS_DIR/cursor"

printf 'Synced %s adapters for %s\n' "6" "$NAME"
