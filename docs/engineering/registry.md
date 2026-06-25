---
owner: "Engineering Lead"
status: "draft"
last_review_date: "2026-06-25"
next_review_date: "2026-12-25"
classification: "internal"
criticality: "high"
---

# Module Registry

This page is the central index of all modules and services that make up the Smart City. Each entry links to the module's GitLab repository where the code-level `README.md` lives.

## Registry

| Module | Type | Owner | GitLab repo | CI status |
|---|---|---|---|---|
| Onboarding API | API service | Team Alpha | [onboarding-api](https://gitlab.example.com) | _Link to pipeline badge_ |
| _Add module_ | _Type_ | _Owner_ | _Link_ | _Status_ |

## Module Types

- **API service** — HTTP/REST service exposing endpoints to consumers.
- **Worker** — Background job processor (queues, scheduled tasks).
- **Library** — Shared package consumed by other modules.
- **Frontend** — Client-facing UI application.

## Contribution Rule

When adding a new module:

1. Create the GitLab repository with a `README.md` covering purpose, setup, and dependencies.
2. Add an entry to this registry table.
3. Link the module in the [architecture diagram](architecture.md) if it introduces a new interaction boundary.
