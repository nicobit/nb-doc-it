---
owner: "Engineering Lead"
status: "draft"
last_review_date: "2026-07-10"
next_review_date: "2027-01-10"
classification: "internal"
criticality: "high"
---

# Environments and Deployment

!!! info "Canonical registry"
    This page is the single source of truth for environment facts: URLs, owners,
    deploy triggers, and data policies. Other pages link here instead of repeating
    them — if an environment fact changes, change it here only.

## Environment Registry

| Environment | Purpose | URL | Owner | Deployed by | Data policy | Access |
|---|---|---|---|---|---|---|
| Dev | Development and integration testing | _URL_ | Engineering Lead | Auto on merge to `develop` | Synthetic only | Engineering team |
| QA | QA testing and regression | _URL_ | QA Lead | Auto on merge to `develop` | Synthetic only | QA and engineering |
| UAT | User acceptance testing | _URL_ | Product Owner | Manual, per release candidate | Anonymized production subset | Product, QA, business stakeholders |
| Pre-prod | Final validation before production | _URL_ | Release Manager | Manual, release pipeline | Anonymized production subset | Release manager, SRE |
| Production | Live | _URL_ | SRE Lead | Manual approval on `main` | Real data — controlled | Controlled access |

## CI/CD Pipelines

| Pipeline | Tool | Link | Trigger |
|---|---|---|---|
| Build and test | GitLab CI | [View pipeline](https://gitlab.example.com) | Every merge request |
| Deploy to QA | GitLab CI | [View pipeline](https://gitlab.example.com) | Merge to `develop` |
| Deploy to production | GitLab CI | [View pipeline](https://gitlab.example.com) | Manual approval on `main` |

## Environment-Specific Notes

### Dev

- Reset cycle: _Describe if/when dev environments are rebuilt._
- Test data: _Describe seeded data or synthetic data policies._

### QA

- Shared with: _List teams that share this environment._
- Integration limits: stubs, mocks, and test accounts are owned by QA — see
  [Test Data and Mocks](../qa/environments.md).

### Production

- Deployment windows: _Define the standard deployment windows._
- Rollback procedure: see the [Release Execution SOP](../operations/sops/release-execution.md#rollback).

## Azure Resources

_Link or summarize the key Azure resources (App Services, Key Vaults, databases, storage accounts) used across environments. Keep detailed resource inventories in the infrastructure-as-code repository._

## Related

- [Module Registry](registry.md) — which modules deploy where
- [Release Execution SOP](../operations/sops/release-execution.md) — release steps and rollback
- [Test Data and Mocks](../qa/environments.md) — QA-owned test accounts, seeding, and stubs
