# Invoice List

## Purpose

A small-business operator reviews invoice status and creates an invoice. The primary action is creating a new invoice.

## Desktop

```text
┌─[Page: Invoice List]──────────────────────────────────────────┐
│ ┌─[Sidebar]────────┐  ┌─[Main]─────────────────────────────┐ │
│ │ Vandor           │  │ Invoices        [New]{primary}     │ │
│ │ [Dashboard]      │  │                                  │ │
│ │ [Invoices]       │  │ Review billing and payment status │ │
│ │ {active}         │  │ ───────────────────────────────── │ │
│ │ [Clients]        │  │ [Search invoices....] [v Status] │ │
│ │ [Settings]       │  │                                  │ │
│ └──────────────────┘  │ ┌─[Table]───────────────────────┐ │ │
│                       │ │ Client  | Amount | Due  |Status│ │ │
│                       │ │────────────────────────────────│ │ │
│                       │ │ Ozone   | 2.5m   |20 Sep|[Paid]│ │ │
│                       │ │ Oriskin | 1.2m   |25 Sep|[Due] │ │ │
│                       │ └────────────────────────────────┘ │ │
│                       │ « 1 [2]{active} 3 »                │ │
│                       └────────────────────────────────────┘ │
└──────────────────────────────────────────────────────────────┘
```

## Tablet

Same as Desktop, with `[Sidebar: collapsed]`; the Due column is moved into each row's secondary line and search spans the available width.

## Mobile

```text
┌─[Page: Invoice List]────────────┐
│ ┌─[Navbar]────────────────────┐ │
│ │ [:menu:]{label:"Open menu"}│ │
│ │ Invoices                    │ │
│ │ [New]{primary}              │ │
│ └─────────────────────────────┘ │
│ Search invoices                 │
│ [____________________________]  │
│ Status                          │
│ [v All statuses..............]  │
│ ┌─[Card]──────────────────────┐ │
│ │ PT Ozone                    │ │
│ │ Rp2.500.000 · [Paid]        │ │
│ │ Due 20 Sep                  │ │
│ └─────────────────────────────┘ │
│ ┌─[Card]──────────────────────┐ │
│ │ Oriskin                     │ │
│ │ Rp1.200.000 · [Due]         │ │
│ │ Due 25 Sep                  │ │
│ └─────────────────────────────┘ │
│ « 1 [2]{active} 3 »            │
└─────────────────────────────────┘
```

## States

### Loading

```text
┌─[Results]───────────────────────┐
│ [░░░░░░░░░░░░░] [░░░░░░]      │
│ [░░░░░░░░░░░░░] [░░░░░░]      │
└─────────────────────────────────┘
```

### Empty

```text
┌─[Empty state]───────────────────┐
│ No invoices yet                 │
│ Create one to track payments.   │
│ [Create invoice]{primary}       │
└─────────────────────────────────┘
```

### Error

```text
┌─[Alert: error]──────────────────┐
│ Invoices could not be loaded.   │
│ [Try again]{primary}            │
└─────────────────────────────────┘
```

## Handoff

### Interactions

- `[New]{primary}` opens the invoice-creation screen.
- Selecting a table row or card opens that invoice's detail screen.
- Status filtering and search preserve each other when combined.

### Responsive Behavior

- Desktop table rows become Mobile cards; no invoice field required for identification or payment status is removed.
- Desktop sidebar becomes a labeled menu action on Mobile.

### Accessibility

- Search and status controls retain visible labels on every view.
- Loading, result count, empty, and error changes are announced without moving focus.
- Mobile cards follow the same reading order as Desktop table columns.

### Assumptions

- Invoice creation is a separate screen.

### Open Questions

- None.
