# ASCII Wireframe

`ascii-wireframe` helps coding agents draft consistent UI blueprints as readable Markdown before implementation. It captures layout, responsive transformations, meaningful UI states, accessibility requirements, and implementation handoff decisions without tying the design to a frontend framework.

## What It Produces

- One Markdown file per screen
- Full views for applicable form factors
- Compact loading, empty, error, and other relevant states
- Explicit `{primary}`, `{active}`, and other semantic modifiers
- Structured handoff notes for interactions, responsive behavior, accessibility, assumptions, and open questions
- Optional `_flow.md` maps for multi-screen journeys
- Unicode box drawing with a strict ASCII fallback
- A shared notation that remains readable across Codex, Claude, Copilot, Gemini, OpenCode, and Cursor

## Quick Usage

Ask your agent to sketch a screen, page, component, or multi-screen flow as an ASCII wireframe. In a project, screen output defaults to `wireframes/<screen-name>.md` and multi-screen maps to `wireframes/_flow.md`.

Example:

```text
Use ascii-wireframe to sketch an invoice list for desktop and mobile, including loading, empty, and error states.
```

Validate a generated screen with:

```bash
python scripts/validate_wireframe.py wireframes/invoice-list.md
```

Add `--ascii` when strict ASCII diagrams were requested.

## Installation

Use the guide for your agent:

- [Codex](docs/install-codex.md)
- [Claude](docs/install-claude.md)
- [Copilot](docs/install-copilot.md)
- [Gemini](docs/install-gemini.md)
- [OpenCode](docs/install-opencode.md)
- [Cursor](docs/install-cursor.md)

## Development

Edit canonical content under `core/`, then run:

```bash
bash scripts/sync.sh
bash scripts/test.sh
```

Generated platform adapters live under `adapters/`; do not edit them directly.

## Repository Layout

- `core/`: canonical skill, runtime validator, and references
- `adapters/`: generated platform-specific packages
- `evals/`: fresh-context behavioral evaluation scenarios
- `scripts/`: sync, validation, parity, and test entrypoints
- `tests/`: repository contract checks
- `docs/`: installation and compatibility documentation

## Sponsors

<div align="center">
  <table>
    <tr>
      <td align="center" valign="top" width="240">
        <a href="https://ozonedigitech.com">
          <img src="./assets/sponsors/ozone.png" alt="Ozone logo" width="120" />
        </a>
        <br />
        <strong>Ozone</strong>
        <br />
        <span>A software, app, integration, and automation studio.</span>
      </td>
    </tr>
  </table>
</div>

To sponsor this project, contact Alfarizi at [rizal.alfariiiziii@gmail.com](mailto:rizal.alfariiiziii@gmail.com).

## License

See [LICENSE](LICENSE).
