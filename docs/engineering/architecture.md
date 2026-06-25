---
owner: "Engineering Lead"
status: "draft"
last_review_date: "2026-06-25"
next_review_date: "2026-12-25"
classification: "internal"
criticality: "high"
---

# System Architecture

## Overview

_Replace with a high-level description of the system architecture: what the major components are, how they interact, and what the system boundaries look like._

## Block Diagram

_Insert or link to the high-level architecture diagram here._

!!! tip "Diagram source"
    Keep diagrams in a versioned format (Mermaid, draw.io, or PlantUML) so they can be updated alongside documentation changes.

## Interaction Layers

| Layer | Components | Purpose |
|---|---|---|
| Presentation | _e.g. Web app, mobile app_ | Client-facing user interface |
| API | _e.g. Onboarding API, Reporting API_ | Service endpoints consumed by the presentation layer and integrations |
| Domain | _e.g. Onboarding engine, Rules engine_ | Core business logic and workflow orchestration |
| Data | _e.g. SQL database, Blob storage_ | Persistent storage and data access |
| Integration | _e.g. Identity provider, Document service_ | External system connectors |

## Architecture Principles

| Principle | Meaning |
|---|---|
| Product ownership | Every module has clear business and technical ownership |
| Runtime clarity | Every production service is listed in the module registry |
| Evidence by design | Releases and operational changes must produce reviewable evidence |
| No empty docs | Create documents only when there is real content and an owner |

## Related

- [Module Registry](registry.md) — index of all modules and repositories
- [Environments](environments.md) — deployment targets and pipeline status
- [ADRs](adr/index.md) — architecture decisions and trade-offs
