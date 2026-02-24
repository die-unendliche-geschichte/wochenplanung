# Wochenplanung

A printable weekly planner as a single-page HTML/CSS file, designed for A4 landscape.

## Structure

- `index.html` — the planner (git-tracked); `wochenplanung.html` is a local working copy
- `style.css` — all styles

## Grid layout

The planner uses CSS grid with 11 columns and 15 rows:

- **Col 1**: hour labels (6mm wide)
- **Cols 2, 4, 6, 8, 10**: haushalt (household) sub-column per day
- **Cols 3, 5, 7, 9, 11**: erwerbsarbeit (job) sub-column per day
- **Row 1**: day headers
- **Rows 2–15**: hours 7–20

Every cell has an explicit `grid-column` (from a day class: `mo di mi do fr` + optionally `erwerbsarbeit`) and an explicit `grid-row` (from an hour class: `r7`–`r20`). This makes columns fully independent — spanning one column never affects another.

## Adding events

```html
<div class="cell mo r14 meeting"></div>
```

For multi-row events, add a `span-N` class and omit the covered rows **in that column only**:

```html
<div class="cell mo r14 meeting span-2"></div>
<!-- r15 omitted for mo haushalt; mo erwerbsarbeit still has its own r15 cell -->
```

## Adding labels

In `style.css`, under `/* ── Labels ──`:

```css
.my-label::before { content: "My Label"; }
```

Then add `.my-label` to the border list below it.

## Colours

Two CSS variables in `:root`:

- `--color-primary` — used for day headers and event label backgrounds
- `--color-secondary` — used for body text colour
