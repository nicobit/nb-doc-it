---
owner: "Engineering Lead"
status: "draft"
last_review_date: "2026-06-25"
next_review_date: "2026-12-25"
classification: "internal"
criticality: "medium"
---

# Architecture Decision Records

ADRs capture significant architecture and technology decisions along with their context and trade-offs. They are immutable once accepted — superseded decisions are marked as such, not deleted.

## Index

| ADR | Title | Status | Date |
|---|---|---|---|
| ADR-001 | _Example: Use MkDocs Material for the documentation portal_ | Accepted | 2026-06-25 |

## When to Write an ADR

Write an ADR when:

- A technology or framework is selected or replaced.
- A significant architectural pattern is adopted.
- A trade-off is made that future engineers need to understand.

## Template

Use the [ADR template](../../doc-templates/template-adr.md) to start a new record.

## Adding a New ADR

1. Create the file in this folder as `adr-NNN-short-slug.md` (e.g. `adr-002-adopt-event-sourcing.md`), using the template.
2. Add a row to the [Index](#index) table above with its status and date.
3. Add the page to the nav in `mkdocs.yml` under `Engineering → ADRs` — pages not listed in the nav are built but do not appear in the sidebar.
4. When a decision is superseded, set its status to `Superseded by ADR-NNN` — do not delete or rewrite it.
