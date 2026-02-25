# Wochenplanung

A printable weekly planner as a single-page HTML/CSS file, designed for A4 landscape.

## Files

- `index.html` — the planner
- `style.css` — all styles
- `Makefile` — PDF export

## Exporting to PDF

Requires Google Chrome.

### Single week

```bash
make pdf WEEK=9            # ISO week number (current year)
make pdf WEEK=9 YEAR=2027  # ISO week, explicit year
make pdf DATE=2026-02-23   # explicit Monday date
```

Exports `wochenplanung.pdf`.

### Multiple weeks

```bash
make pdfs WEEKS="8 9 10"
make pdfs WEEKS="8 9 10" YEAR=2027
```

Exports `wochenplanung-8.pdf`, `wochenplanung-9.pdf`, etc.

### Browser preview with dates

```
index.html?week=9
index.html?date=2026-02-23
```



## Grid layout

The planner uses CSS grid with 11 columns and 16 rows:

- **Col 1**: hour labels (6mm wide)
- **Cols 2, 4, 6, 8, 10**: haushalt (household) sub-column per day
- **Cols 3, 5, 7, 9, 11**: erwerbsarbeit (job) sub-column per day
- **Row 1**: day headers
- **Rows 2–16**: hours 6–20

Every cell has an explicit `grid-column` (from a day class: `mo di mi do fr` + optionally `erwerbsarbeit`) and an explicit `grid-row` (from an hour class: `r6`–`r20`). This makes columns fully independent — spanning one column never affects another.

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

Then add `.my-label` to the border list below it, and use it in HTML:

```html
<div class="cell mo r14 my-label"></div>
```

## Colours

Two CSS variables in `:root`:

- `--color-primary` — day headers and event label backgrounds
- `--color-secondary` — body text colour


