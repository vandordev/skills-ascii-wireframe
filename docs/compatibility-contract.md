# Compatibility Contract

## Supported User Intents

- Draft a screen, page, or component as a plain-text wireframe
- Plan responsive desktop, tablet, mobile, or native-mobile layouts
- Document relevant loading, empty, error, disabled, and success states
- Capture interaction and accessibility notes without implementation code
- Reuse or extend a project-local wireframe legend

## Behavioral Guarantees

- `core/SKILL.md` is the canonical workflow
- All adapters receive the same legend, template, and example
- Platform adapters preserve the same notation and responsive rules
- Project-local `wireframes/_legend.md` overrides central conventions
- The installed central legend is not mutated during project work
- Non-applicable form factors and states are omitted instead of invented

## Minimum Deliverable

- Screen purpose and primary action
- Complete default view for each applicable form factor
- Only the state fragments that materially change
- Notes for non-visible behavior and material assumptions
