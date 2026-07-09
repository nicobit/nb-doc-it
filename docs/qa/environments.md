---
owner: "QA Lead"
status: "draft"
last_review_date: "2026-07-10"
next_review_date: "2027-01-10"
classification: "internal"
criticality: "high"
---

# Test Data and Mocks

Environment facts (URLs, owners, deploy triggers, access) live in the
[Environment Registry](../engineering/environments.md) — they are deliberately
not repeated here. This page covers what QA owns: test accounts, test data,
and integration stubs.

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

- [Environment Registry](../engineering/environments.md) — URLs, owners, deploy triggers, access
- [QA Strategy](strategy.md) — testing approach and coverage targets
- [Smoke Test Procedure](../operations/sops/smoke-test.md) — uses the test accounts above
