# ASCII Wireframe for Gemini

Use this file as the reusable Gemini instruction for drafting consistent plain-text UI wireframes.

## Canonical Workflow


# ASCII Wireframe

Draft implementation-neutral UI blueprints in Markdown. Show layout, hierarchy, responsive transformations, states, and handoff decisions without producing frontend code.

Do not use this skill for a working-UI request that does not also ask for a wireframe or design-planning artifact.

## Core Notation

- Element: `[Label]` plus explicit modifiers such as `{primary}`, `{active}`, `{disabled}`, or `{link}`.
- Container: a labeled box containing text or elements.
- Supporting marks: plain text, dividers, arrows, `[x]`, and `(o)`.

Never use `*` for primary or active. Use plain component names instead of decorative glyphs. The rules above cover simple screens; read only the relevant section of [references/legend.md](references/legend.md) when more notation or ASCII-safe mapping is needed.

If `wireframes/_legend.md` exists, apply it afterward. Never modify the installed legend during project work.

## Workflow

1. Inspect requirements, existing screens, product language, design conventions, and nearby wireframes.
2. Identify the user, purpose, primary action, content priority, target contexts, locale, and character-set constraint. Ask only when missing information changes structure; otherwise record an assumption.
3. For responsive UI, reason from the narrowest view first, then present views in the template or project order.
4. Draft navigation, heading/actions, main and secondary content, then overlays. Use realistic content, not lorem ipsum.
5. Complete every Handoff subsection so decisions, assumptions, and open questions remain distinct.
6. Validate saved output with `scripts/validate_wireframe.py <file>`; add `--ascii` for strict ASCII diagrams.

## Responsive Views

Use requested view labels, but design for available space rather than assumed devices. State what each narrower view preserves, stacks, moves, collapses, hides, or replaces. Draw a full view for structural change; use a one-line delta for minor reflow. Do not invent breakpoints or remove functionality. Avoid two-dimensional scrolling except where essential to content such as tables or maps.

## UI States

Include only states affecting the flow: loading, empty, error, invalid, disabled, success, permission denied, offline, or partial data. Draw only the changed region. Provide a next/recovery action when one exists; form errors preserve entered values and identify affected fields.

## Accessibility

For interactive UI, read [references/accessibility.md](references/accessibility.md) and record applicable decisions under Handoff → Accessibility. Describe required behavior without prescribing framework code.

## Multi-Screen Flows

For two or more screens, read [references/flow-template.md](references/flow-template.md). In projects, create `wireframes/_flow.md` plus one file per screen. Map primary and material alternate, cancellation, error, and recovery paths without duplicating screen layouts.

## Character Set

Default to Unicode box drawing. When strict ASCII is requested or Unicode alignment is unreliable, use `+`, `-`, `|`, `>`, and `<` for structure while keeping component semantics unchanged.

## Deliverable

Use [references/template.md](references/template.md). Save project screens as `wireframes/<screen-name>.md`, using kebab-case and the relevant app root in monorepos. Return inline only for chat-only requests.

For project notation, base `wireframes/_legend.md` on [references/project-legend-template.md](references/project-legend-template.md) and add only project conventions. Report written paths and covered views, states, and flows. Favor unambiguous structure over perfect borders.
