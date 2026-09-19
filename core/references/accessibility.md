# Accessibility Handoff

Apply only the items relevant to the requested interface. Record outcomes in Handoff → Accessibility rather than implementation-specific code.

## Structure and Reading Order

- Give the page one clear primary heading and descriptive section headings.
- Identify navigation, main content, search, and complementary regions when their roles are not obvious.
- Keep reading and keyboard focus order logical when columns stack or controls move between views.

## Controls and Forms

- Give every input a persistent visible label. A placeholder is an example or hint, not the only label.
- Use descriptive action labels. Give icon-only actions an explicit accessible name.
- Group related checkboxes or radio options under a visible group label.
- For touch contexts, leave adequate target size and spacing; call out dense or edge-positioned actions that need special care.

## Errors and Feedback

- Identify errors in text, explain how to recover, and preserve entered values after a failed submission.
- For long forms, show both an error summary and inline field errors.
- Note whether loading, results, success, progress, or failure messages must be announced without moving focus.
- Confirm destructive or difficult-to-reverse actions before completion.

## Responsive Access

- Preserve information and functionality at narrow widths.
- Avoid horizontal scrolling for ordinary content. Document why a table, map, or other two-dimensional region must scroll when it is essential.
- If controls collapse into menus or drawers, preserve their labels, order, and discoverability.

Do not claim WCAG conformance from a wireframe alone. The wireframe records requirements that implementation and testing must verify.

## Standards Basis

- [WCAG 2.2: Reflow](https://www.w3.org/TR/WCAG22/#reflow)
- [WAI: Labels or Instructions](https://www.w3.org/WAI/WCAG22/Understanding/labels-or-instructions)
- [WAI: Focus Order](https://www.w3.org/WAI/WCAG22/Understanding/focus-order.html)
- [WAI: Status Messages](https://www.w3.org/WAI/WCAG22/Understanding/status-messages)
- [WAI: Target Size (Minimum)](https://www.w3.org/WAI/WCAG22/Understanding/target-size-minimum)
