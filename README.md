# ASCII Wireframe

**Turn vague UI ideas into implementation-ready blueprints before anyone writes frontend code.**

`ascii-wireframe` is an agent skill for designing screens, responsive layouts, UI states, and multi-screen journeys in readable Markdown. It gives product, design, and engineering a shared artifact that works in any text editor—without committing to a framework or polishing pixels too early.

Works with Codex, Claude, Copilot, Gemini, OpenCode, and Cursor.

## See It in Action

Ask your agent:

```text
Use ascii-wireframe to sketch an invoice list for desktop and mobile.
Include loading, empty, and error states.
```

It produces a reviewable blueprint like this:

```text
┌─[Page: Invoice List]────────────────────────────────────┐
│ ┌─[Sidebar]────────┐  ┌─[Main]───────────────────────┐ │
│ │ [Dashboard]      │  │ Invoices       [New]{primary}│ │
│ │ [Invoices]{active}  │                               │ │
│ │ [Clients]        │  │ Search invoices              │ │
│ └──────────────────┘  │ [__________________________]  │ │
│                       │ ┌─[Table]───────────────────┐ │ │
│                       │ │ Client  | Amount | Status│ │ │
│                       │ │ Ozone   | 2.5m   | [Paid]│ │ │
│                       │ │ Oriskin | 1.2m   | [Due] │ │ │
│                       │ └───────────────────────────┘ │ │
│                       └───────────────────────────────┘ │
└─────────────────────────────────────────────────────────┘
```

```text
┌─[Mobile: Invoice List]─────────┐
│ [:menu:]{label:"Open menu"}   │
│ Invoices          [New]{primary}│
│ Search invoices                │
│ [____________________________] │
│ ┌─[Card]─────────────────────┐ │
│ │ PT Ozone                   │ │
│ │ Rp2.500.000 · [Paid]       │ │
│ └────────────────────────────┘ │
│ ┌─[Card]─────────────────────┐ │
│ │ Oriskin                    │ │
│ │ Rp1.200.000 · [Due]        │ │
│ └────────────────────────────┘ │
└────────────────────────────────┘
```

The generated document also records interactions, responsive transformations, accessibility requirements, assumptions, open questions, and relevant UI states. See the [complete example](core/references/example.md).

## Why Use It

- **Align before implementation.** Review information hierarchy, actions, and navigation while changes are still cheap.
- **Design responsive behavior intentionally.** Define what stacks, moves, collapses, hides, or changes representation at narrower widths.
- **Cover the states happy-path mockups miss.** Include loading, empty, error, invalid, offline, permission, and partial-data states only when relevant.
- **Hand off decisions, not guesses.** Separate confirmed interactions from assumptions and unresolved product questions.
- **Catch accessibility issues earlier.** Preserve visible labels, logical reading order, recoverable errors, status announcements, and touch-target requirements.
- **Stay implementation-neutral.** The notation describes UI roles without requiring React, Vue, Tailwind, shadcn/ui, or any other stack.

## What It Can Produce

| Artifact | Default location | Purpose |
|---|---|---|
| Screen wireframe | `wireframes/<screen-name>.md` | Layout, views, states, and implementation handoff |
| Multi-screen map | `wireframes/_flow.md` | Primary, alternate, cancellation, and recovery paths |
| Project legend | `wireframes/_legend.md` | Product-specific notation without changing the shared legend |

Unicode box drawing is the default. A strict ASCII mode is available for terminals that cannot align Unicode reliably.

## How It Works

1. **Describe the interface** — name the user, task, target views, and important states.
2. **Review the blueprint** — agree on hierarchy, responsive behavior, interactions, and edge cases in Markdown.
3. **Implement with clarity** — give the approved wireframe to a developer or coding agent as the UI contract.

## Good Fits

- SaaS dashboards and internal tools
- Forms, settings, onboarding, and checkout flows
- Tables that need a deliberate mobile representation
- Admin panels with loading, empty, permission, and error states
- Multi-step journeys that need a shared screen map
- Early product discussions where visual polish would distract from structure

## Quick Start

After installing the skill, try:

```text
Sketch a responsive customer dashboard as an ASCII wireframe.
Show desktop and mobile, then include loading and empty states.
Save it to wireframes/customer-dashboard.md.
```

Validate a generated wireframe from this repository with:

```bash
python core/scripts/validate_wireframe.py wireframes/customer-dashboard.md
```

Add `--ascii` when strict ASCII diagrams were requested.

## Installation

Choose your agent:

- [Install for Codex](docs/install-codex.md)
- [Install for Claude](docs/install-claude.md)
- [Install for Copilot](docs/install-copilot.md)
- [Install for Gemini](docs/install-gemini.md)
- [Install for OpenCode](docs/install-opencode.md)
- [Install for Cursor](docs/install-cursor.md)

Each adapter ships with the same canonical workflow, references, templates, example, and validator.

## Built-In Quality Checks

The validator catches:

- unresolved template placeholders
- ambiguous legacy `*` modifiers
- missing views or handoff sections
- unbalanced Markdown fences
- implementation code embedded in a wireframe
- non-ASCII diagram characters when `--ascii` is enabled

The repository also includes [behavioral evaluation cases](evals/cases.md) for responsive dashboards, validation-heavy forms, native mobile screens, desktop-only tools, project legends, multi-screen flows, strict ASCII, and negative activation.

## Development

Edit canonical content under `core/`, then regenerate and verify every adapter:

```bash
bash scripts/sync.sh
bash scripts/test.sh
```

Repository structure:

- `core/` — canonical skill, runtime validator, and references
- `adapters/` — generated packages for each supported agent
- `evals/` — behavioral evaluation scenarios
- `scripts/` — sync, validation, parity, and test entrypoints
- `tests/` — repository and validator checks
- `docs/` — installation and compatibility documentation

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
