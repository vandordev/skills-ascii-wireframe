# Checkout

## Purpose

A customer reviews the order and submits payment. The primary action is Place order.

## Mobile

```text
+--[Page: Checkout]-------------+
| Order summary                 |
| [Place order]{primary}        |
+-------------------------------+
```

## States

### Error

```text
+--[Alert: error]---------------+
| Payment failed. [Try again]   |
+-------------------------------+
```

## Handoff

### Interactions

- `[Place order]{primary}` submits the order once.

### Responsive Behavior

- Mobile is the only requested target.

### Accessibility

- Status changes are announced without moving focus.

### Assumptions

- Payment details were collected earlier.

### Open Questions

- None.
