# Multi-Screen Flow

Use this document only when the requested journey spans two or more screens. Keep detailed layouts in separate screen files.

## Purpose

[Who completes this journey and what outcome they reach.]

## Screen Map

```text
[Start] --[Primary action]{primary}--> [Next screen] --[Confirm]{primary}--> [Success]
   |
   +--[Cancel]{link}--> [Exit]
```

## Primary Flow

1. [Screen → action → next screen.]
2. [Continue until the user outcome is complete.]

## Alternate Paths

- [Validation, empty, permission, cancellation, offline, or retry path that materially changes the journey.]

## Shared Decisions

- [State preserved across screens, navigation convention, shared responsive behavior, or accessibility requirement.]

## Open Questions

- [Unresolved product decision, or `None.`]
