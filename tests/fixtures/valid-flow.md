# Multi-Screen Flow

## Purpose

A customer creates and confirms an order.

## Screen Map

```text
[Cart] --[Checkout]{link}--> [Checkout] --[Place order]{primary}--> [Confirmation]
```

## Primary Flow

1. Cart → Checkout
2. Checkout → Confirmation

## Alternate Paths

- Payment failure keeps the customer on Checkout with a retry action.

## Shared Decisions

- Preserve entered information after recoverable errors.

## Open Questions

- None.
