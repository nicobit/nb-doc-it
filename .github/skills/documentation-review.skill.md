# Documentation Review Skill

Review documentation pages in the Smart City portal for quality, consistency, and correct placement.

## What to check

1. Valid YAML frontmatter with required fields (`owner`, `status`, `last_review_date`, `next_review_date`, `classification`, `criticality`).
2. Clear ownership — no generic or missing owners.
3. No empty placeholder pages without real content.
4. Content in the correct section (product, engineering, QA, operations, governance).
5. How-to articles placed in the owning section's `how-to/` subfolder and listed in `docs/how-to.md`.
6. No user stories or ticket-level detail (these belong in GitLab).
7. BRS content summarized with a link to SharePoint, not pasted in full.
8. No broken internal links.
9. No stale `next_review_date` values.
10. Runbooks and SOPs contain actionable steps, not just descriptions.
