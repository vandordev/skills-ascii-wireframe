# ASCII Wireframe for Claude

Use this file as the reusable Claude instruction for drafting consistent plain-text UI wireframes.

## Canonical Workflow


# ASCII Wireframe

Draft implementation-neutral UI blueprints in Markdown using monospaced text and box-drawing characters. The wireframe should make layout, hierarchy, content, responsive changes, states, and key interactions clear without producing frontend code.

Do not use this skill when the user wants working UI code and has not asked for a wireframe or design-planning artifact.

## Notation

Use two primary primitives:

- Inline elements: `[Component]`, optionally followed by `{state}`; for example `[Save]*`, `[Email address....]`, or `[Button]{disabled}`.
- Containers: a labeled box containing text or other elements.

Plain text, dividers, arrows, and standard control marks such as `[x]` or `( )` may support those primitives. Do not invent decorative glyphs for known components.

Read [references/legend.md](references/legend.md) before drafting. If the project contains `wireframes/_legend.md`, read it afterward and treat it as the project-specific override. For an unlisted component, use its plain component name with the closest existing primitive and document the convention in the output notes. Do not modify the installed central legend while completing a project wireframe.

## Workflow

1. Inspect relevant requirements, existing screens, design-system conventions, and nearby wireframes. Reuse the product's language and navigation model.
2. Identify the screen's user, purpose, primary action, main content, and target form factors. Ask only when missing information would materially change the structure; otherwise state a concise assumption in Notes.
3. Draft top-to-bottom: global navigation, page header and actions, main content, secondary content, then overlays such as dialogs, sheets, and toasts.
4. Use realistic representative content so hierarchy and density can be judged. Do not fill the screen with generic lorem ipsum.
5. Put visible structure in the diagram and interaction behavior in Notes.
6. Check that every visible action has a clear label, the primary action is apparent, responsive changes preserve task priority, and applicable loading, empty, and error states have a recovery path.

Use [references/template.md](references/template.md) for the document structure. Read [references/example.md](references/example.md) when a full example would help resolve formatting or scope.

## Responsive Views

- Desktop: draw the complete default view unless the requested product is not desktop-capable.
- Tablet: draw it only when structure changes meaningfully. Otherwise, write a one-line delta from Desktop.
- Mobile: draw the complete view for responsive web products because navigation, grids, tables, and action placement commonly change. For native mobile or desktop-only products, draw only the applicable form factor and note the scope.

Do not create breakpoints the user does not need.

## UI States

Include Loading, Empty, Error, Disabled, Success, or other states only when they affect the requested flow. Draw only the region that changes rather than duplicating the entire screen. Error and empty states should show an appropriate recovery or next action when one exists.

## Notes

Record behavior that cannot be seen in the diagram, including navigation targets, validation, destructive confirmations, overflow behavior, and important accessibility semantics. Give icon-only controls an accessible label in a modifier, for example `[:trash:]{label:"Delete invoice"}`.

Avoid implementation choices such as frameworks, component libraries, pixel values, API shapes, or debounce timings unless the user supplied them or they are essential constraints.

## Deliverable

When working in a project, save one screen per file at `wireframes/<screen-name>.md`, or under the relevant app root in a monorepo. Use kebab-case names. If the user explicitly asks for chat-only output, return the wireframe inline instead.

After writing a file, report its path and briefly list the views and states covered. Keep the diagram readable in a normal monospaced editor; exact border alignment is secondary to unambiguous structure.
