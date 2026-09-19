# Legend

Use these conventions consistently. Component names describe UI roles, not a required implementation library.

## Core Primitives

| Kind | Notation | Example |
|---|---|---|
| Inline element | `[Component or label]` | `[Save]` |
| Primary or active element | `[Component or label]*` | `[Create invoice]*` |
| State or property | `{property:value}` | `[Save]{disabled}` |
| Container | Labeled box | `┌─[Card]──┐ ... └─────────┘` |

Use plain text for headings, labels, values, and explanatory copy. Use `────────` as a divider and `→` only to describe a relationship or transition.

## Actions

| Component | Notation |
|---|---|
| Button | `[Label]`; add `*` for the primary action |
| Icon button | `[:icon-name:]{label:"Accessible name"}` |
| Toggle | `[[Label]]`; add `*` when active |
| Toggle group | `[[A]]* [[B]] [[C]]` |
| Link | `[Link label]{link}` |

## Forms

| Component | Notation |
|---|---|
| Text input | `Label` then `[____________]` |
| Placeholder | `[Placeholder text....]` |
| Required input | `[____________]{required}` |
| Invalid input | `[value]{invalid}` followed by error text |
| Textarea | `[____________]{textarea, rows:4}` |
| Select | `[v Select an option....]` |
| Searchable select | `[v? Search or select....]` |
| Checkbox | `[ ] Label` or `[x] Label` |
| Radio | `( ) Label` or `(o) Label` |
| Switch | `(o--) Label` or `(--o) Label` |
| Slider | `[----o-----]{value:40}` |
| Date input | `[:calendar:] [dd/mm/yyyy]` |
| One-time code | `[_] [_] [_] [_]` |

## Navigation

| Component | Notation |
|---|---|
| Breadcrumb | `Home > Products > Detail` |
| Tabs | `[Overview]* [Activity] [Settings]` |
| Pagination | `« 1 [2] 3 »` |
| Navbar | Labeled `[Navbar]` container |
| Sidebar | Labeled `[Sidebar]` container; use `[Sidebar: collapsed]` for icon-only |
| Bottom navigation | Labeled `[BottomNav]` container |

## Data Display

| Component | Notation |
|---|---|
| Card | Labeled `[Card]` container |
| Table | Labeled `[Table]` container with `|` column separators |
| Badge | `[Badge: Paid]{variant:success}` |
| Avatar | `(AB)` or `[:user:]` |
| Accordion | `> Item` collapsed; `v Item` expanded with indented content |
| Carousel | `< [Slide 1 of 3] >` |
| Chart | Labeled `[Chart: type, title]` container with a rough plot or concise description |
| Progress | `[====------] 40%` |
| Skeleton | `[░░░░░░░░]` |
| Grid | Labeled `[Grid: 3 columns]` container |
| Scroll area | Labeled `[ScrollArea]` container ending with `(continues ↓)` |

## Feedback and Overlays

| Component | Notation |
|---|---|
| Alert | Labeled `[Alert: info/warning/error/success]` container |
| Dialog | Labeled `[Dialog: Title]` container, shown after the page frame |
| Sheet or drawer | Labeled `[Sheet: right]` or `[Drawer: bottom]` container |
| Toast | Small `[Toast]` container; put placement and duration in Notes only when known |
| Dropdown menu | Trigger followed by indented `[Item]` rows |
| Tooltip | `[Trigger]{tooltip:"Helper text"}` |
| Popover | Trigger followed by `→` and a small `[Popover]` container |

## Composition Example

```text
┌─[Page: Invoice List]──────────────────────────────┐
│ ┌─[Sidebar]────────┐  ┌─[Main]─────────────────┐ │
│ │ [Dashboard]      │  │ Invoices      [New]*   │ │
│ │ [Invoices]*      │  │ ────────────────────── │ │
│ │ [Settings]       │  │ ┌─[Table]────────────┐ │ │
│ └──────────────────┘  │ │ Client | Status    │ │ │
│                       │ │ Acme   | [Paid]     │ │ │
│                       │ └─────────────────────┘ │ │
│                       └─────────────────────────┘ │
└───────────────────────────────────────────────────┘
```

Favor legibility over perfect border alignment. If a component is missing, use `[PlainComponentName]` with the nearest convention rather than creating a new symbol.
