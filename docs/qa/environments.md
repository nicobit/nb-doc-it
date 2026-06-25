---
owner: "QA Lead"
status: "draft"
last_review_date: "2026-06-25"
next_review_date: "2026-12-25"
classification: "internal"
criticality: "high"
---

# Test Environments and Mock Data

## QA Environment Access

| Environment | URL | Purpose | Access request |
|---|---|---|---|
| QA | _URL_ | Functional and regression testing | _Process or link_ |
| UAT | _URL_ | Business acceptance testing | _Process or link_ |

## Test User Accounts

| Account | Role | Environment | Credentials location |
|---|---|---|---|
| `testuser-admin` | Admin | QA | _Key Vault or password manager link_ |
| `testuser-client` | Client | QA | _Key Vault or password manager link_ |

!!! warning "Credential security"
    Never store passwords or secrets in this portal. Use references to the team's key vault or password manager.

## Mock Data and Synthetic Data

### Setup

_Describe how to seed or reset test data in QA environments._

### Data Policies

- Test data must not contain real client information.
- Synthetic data should cover: standard flow, edge cases, and error scenarios.
- QA environment data resets: _frequency and process._

## Integration Stubs

| External system | QA behavior | Notes |
|---|---|---|
| Identity provider | _Stubbed / Live sandbox_ | _Configuration notes_ |
| Document service | _Stubbed / Live sandbox_ | _Configuration notes_ |

## Related

- [Environments and Deployment](../engineering/environments.md) — full environment overview
- [QA Strategy](strategy.md) — testing approach and coverage targets
