#!/usr/bin/env python3
"""Validate the structural contract of ASCII wireframe Markdown files."""

from __future__ import annotations

import argparse
import re
import sys
from pathlib import Path


SCREEN_HEADINGS = (
    "## Purpose",
    "## Handoff",
    "### Interactions",
    "### Responsive Behavior",
    "### Accessibility",
    "### Assumptions",
    "### Open Questions",
)
FLOW_HEADINGS = (
    "## Purpose",
    "## Screen Map",
    "## Primary Flow",
    "## Alternate Paths",
    "## Shared Decisions",
    "## Open Questions",
)
VIEW_HEADINGS = ("## Desktop", "## Tablet", "## Mobile", "## Wide", "## Medium", "## Narrow")
PLACEHOLDERS = (
    "[Screen Name]",
    "[Who uses this screen",
    "[Complete default view",
    "[Complete responsive",
    "[Loading region",
    "[Empty region",
    "[Error region",
    "[Trigger ",
    "[What is preserved",
    "[Visible labels",
    "[Assumption that",
    "[Unresolved product",
)


def text_fences(text: str) -> list[str]:
    blocks: list[str] = []
    current: list[str] | None = None
    for line in text.splitlines():
        if line == "```text":
            current = []
        elif line == "```" and current is not None:
            blocks.append("\n".join(current))
            current = None
        elif current is not None:
            current.append(line)
    return blocks


def validate(path: Path, ascii_only: bool) -> list[str]:
    try:
        text = path.read_text(encoding="utf-8")
    except (OSError, UnicodeError) as error:
        return [f"cannot read UTF-8 Markdown: {error}"]

    errors: list[str] = []
    if text.count("```") % 2:
        errors.append("unbalanced fenced code block")
    if re.search(r"\]\*", text):
        errors.append("ambiguous `*` modifier; use `{primary}` or `{active}`")
    if any(marker in text for marker in PLACEHOLDERS):
        errors.append("template placeholder remains unresolved")
    if re.search(r"```(?:html|css|js|jsx|javascript|ts|tsx|typescript)\b", text, re.IGNORECASE):
        errors.append("implementation code fence found in wireframe")

    is_flow = text.startswith("# Multi-Screen Flow\n") or path.name == "_flow.md"
    required = FLOW_HEADINGS if is_flow else SCREEN_HEADINGS
    for heading in required:
        if heading not in text:
            errors.append(f"missing required heading: {heading}")

    if not is_flow and not any(heading in text for heading in VIEW_HEADINGS):
        errors.append("missing applicable view: Desktop, Tablet, Mobile, Wide, Medium, or Narrow")
    if "```text" not in text:
        errors.append("missing `text` wireframe block")

    if ascii_only:
        for block in text_fences(text):
            if any(ord(character) > 127 for character in block):
                errors.append("non-ASCII character found in a `text` diagram")
                break

    return errors


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("files", nargs="+", type=Path)
    parser.add_argument("--ascii", action="store_true", help="require ASCII-only diagram characters")
    args = parser.parse_args()

    failed = False
    for path in args.files:
        errors = validate(path, args.ascii)
        if errors:
            failed = True
            for error in errors:
                print(f"{path}: {error}", file=sys.stderr)
        else:
            print(f"OK: {path}")
    return 1 if failed else 0


if __name__ == "__main__":
    raise SystemExit(main())
