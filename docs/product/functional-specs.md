---
owner: "Product Owner"
status: "draft"
last_review_date: "2026-06-25"
next_review_date: "2026-12-25"
classification: "internal"
criticality: "high"
---

# Functional Specs (Epic Level)

This page captures high-level business rules and workflows at the epic level. Individual user stories and acceptance criteria live in GitLab issues — they are never duplicated here.

## Modules

| Module | Purpose | Epic link |
|---|---|---|
| Onboarding | Client onboarding flow including identity verification, document collection, and account activation | [View Epic on GitLab](https://gitlab.example.com) |
| _Add module_ | _Describe purpose_ | _Link_ |

## Onboarding Module — Business Rules

!!! info "Source of truth"
    The full signed-off business requirements live in SharePoint. This section summarizes the core rules for engineering and QA reference.

### Core rules

- Each client onboarding must be associated with a single tenant.
- Identity verification must complete before document collection begins.
- Configuration is tenant-specific and managed through the settings catalog.

### Key workflows

1. **Client initiation** — A new client request creates an onboarding case.
2. **Verification** — Identity and compliance checks run against configured providers.
3. **Document collection** — Required documents are requested based on client type and jurisdiction.
4. **Activation** — On successful completion the client account is activated.

[View Active User Stories on GitLab](https://gitlab.example.com){ .md-button }

:file_folder: [Full BRS Document available on SharePoint](https://sharepoint.example.com){ .md-button .md-button--primary }
