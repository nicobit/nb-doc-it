---
owner: "Documentation Owner"
status: "draft"
last_review_date: "2026-06-25"
next_review_date: "2026-12-25"
classification: "internal"
criticality: "medium"
---

# Metadata Template

All documentation pages should include frontmatter metadata. Use the fields below as a reference.

```yaml
---
owner: "Team or role"
business_owner: "Name or role"
technical_owner: "Name or role"
status: "draft | reviewed | approved | deprecated"
last_review_date: "YYYY-MM-DD"
next_review_date: "YYYY-MM-DD"
classification: "public | internal | confidential | restricted"
criticality: "low | medium | high | critical"
related_services:
  - service-name
related_adrs:
  - ADR-001
related_runbooks:
  - runbook-name
---
```

## Required Fields

Every page must have at minimum:

- `owner` — the team or role responsible for keeping this page current.
- `status` — current lifecycle state.
- `classification` — data classification level.
- `criticality` — operational importance.
