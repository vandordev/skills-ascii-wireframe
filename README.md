# ASCII Wireframe

`ascii-wireframe` helps coding agents draft consistent UI blueprints as readable Markdown before implementation. It captures layout, responsive changes, meaningful UI states, and interaction notes without tying the design to a frontend framework.

## What It Produces

- One Markdown file per screen
- Full views for applicable form factors
- Compact loading, empty, error, and other relevant states
- Notes for navigation, validation, destructive actions, overflow, and accessibility details
- A shared notation that remains readable across Codex, Claude, Copilot, Gemini, OpenCode, and Cursor

## Quick Usage

Ask your agent to sketch a screen, page, or component as an ASCII wireframe. In a project, the default output is `wireframes/<screen-name>.md`.

Example:

```text
Use ascii-wireframe to sketch an invoice list for desktop and mobile, including loading, empty, and error states.
```

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

- `core/`: canonical skill, metadata, legend, template, and example
- `adapters/`: generated platform-specific packages
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
