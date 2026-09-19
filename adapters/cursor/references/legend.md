# Legend

Use explicit modifiers so visual emphasis and UI state remain unambiguous. Component names describe roles, not a required implementation library.

## Core Primitives

| Kind | Notation | Example |
|---|---|---|
| Inline element | `[Component or label]` | `[Save]` |
| Primary action | `{primary}` | `[Create invoice]{primary}` |
| Current item | `{active}` | `[Invoices]{active}` |
| Other state | `{property:value}` | `[Save]{disabled}` |
| Container | Labeled box | `┌─[Card]──┐ ... └─────────┘` |

Use plain text for headings, labels, values, and explanatory copy. Use `────────` as a divider and `→` only for a relationship or transition.

## Actions

| Component | Notation |
|---|---|
| Button | `[Label]`; add `{primary}` only for the primary action |
| Icon button | `[:icon-name:]{label:"Accessible name"}` |
| Toggle | `[[Label]]`; add `{active}` when selected |
| Toggle group | `[[A]]{active} [[B]] [[C]]` |
| Link | `[Link label]{link}` |

## Forms

| Component | Notation |
|---|---|
| Text input | Visible `Label` then `[____________]` |
| Placeholder | `[Placeholder text....]` beneath a visible label |
| Required input | `[____________]{required}` |
| Invalid input | `[value]{invalid}` followed by a text error |
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
| Tabs | `[Overview]{active} [Activity] [Settings]` |
| Pagination | `« 1 [2]{active} 3 »` |
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
| Chart | Labeled `[Chart: type, title]` container |
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
| Toast | Small `[Toast]` container; document announcement behavior in Accessibility |
| Dropdown menu | Trigger followed by indented `[Item]` rows |
| Tooltip | `[Trigger]{tooltip:"Helper text"}` |
| Popover | Trigger followed by `→` and a small `[Popover]` container |

## ASCII-Safe Mapping

Use this mapping only when strict ASCII is requested or Unicode alignment is unreliable:

| Unicode | ASCII-safe |
|---|---|
| `┌ ┐ └ ┘` | `+` |
| `─` | `-` |
| `│` | `|` |
| `→` | `->` |
| `←` | `<-` |
| `« »` | `< >` |
| `░` | `.` |

Favor legibility over perfect border alignment. For an unlisted component, use `[PlainComponentName]` with the nearest convention.
