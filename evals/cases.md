# Behavioral Evaluation Cases

Run each prompt in a fresh context. Compare baseline behavior without the skill against behavior with the skill. Score observable invariants rather than exact wording or border alignment.

## 1. Responsive Dashboard

Prompt: `Buat ASCII wireframe dashboard inventory untuk desktop, tablet, dan mobile. Ada low-stock warning dan quick restock.`

Pass conditions:

- Skill activates from Indonesian phrasing.
- Primary and active elements use explicit modifiers.
- Responsive Behavior says what stacks, moves, collapses, hides, or changes representation.
- Warning and recovery/action behavior are represented without frontend code.

## 2. Form Validation

Prompt: `Sketch a responsive account-registration form, including invalid submission and success states.`

Pass conditions:

- Inputs retain visible labels.
- Invalid state preserves entered values, identifies fields in text, and includes recovery guidance.
- Accessibility covers focus/error summary and status announcement where applicable.

## 3. Native Mobile Only

Prompt: `Sketsa tampilan native mobile untuk scan barang gudang. Tidak perlu web atau desktop.`

Pass conditions:

- Only Mobile is drawn.
- No invented Desktop or Tablet view.
- Icon actions have accessible names and touch-target considerations.

## 4. Desktop-Only Internal Tool

Prompt: `Wireframe a desktop-only log viewer with a dense table and resizable detail panel.`

Pass conditions:

- Only Desktop is drawn.
- Essential two-dimensional scrolling is documented rather than hiding required data.
- Dense controls remain labeled and keyboard order is addressed.

## 5. Project Legend Override

Setup: Create `wireframes/_legend.md` defining `[:scan:]` as the warehouse scanner action.

Prompt: `Draft the warehouse receiving screen using the project wireframe conventions.`

Pass conditions:

- The project notation is reused.
- The installed central legend is not modified or copied into the project.
- Any new project notation is added only to the project legend.

## 6. Multi-Screen Checkout

Prompt: `Plan cart, checkout, payment failure, and confirmation as ASCII wireframes.`

Pass conditions:

- `_flow.md` maps primary and recovery paths.
- Each screen has its own file.
- The flow map links screens without duplicating full layouts.

## 7. Strict ASCII

Prompt: `Create the mobile checkout wireframe using strict 7-bit ASCII because the target terminal cannot align Unicode.`

Pass conditions:

- Diagram structure uses only ASCII characters.
- Semantic modifiers remain unchanged.
- `validate_wireframe.py --ascii` passes.

## 8. Negative Activation

Prompt: `Implement the settings page in React. I do not need a wireframe.`

Pass conditions:

- This skill does not take over the implementation request.
- No wireframe artifact is created.
