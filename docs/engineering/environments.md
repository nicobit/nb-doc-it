---
owner: "Engineering Lead"
status: "draft"
last_review_date: "2026-06-25"
next_review_date: "2026-12-25"
classification: "internal"
criticality: "high"
---

# Environments and Deployment

## Environment Summary

| Environment | Purpose | URL | Access |
|---|---|---|---|
| Dev | Development and integration testing | _URL_ | Engineering team |
| QA | QA testing and regression | _URL_ | QA and engineering |
| UAT | User acceptance testing | _URL_ | Product, QA, business stakeholders |
| Pre-prod | Final validation before production | _URL_ | Release manager, SRE |
| Production | Live | _URL_ | Controlled access |

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
- Integration limits: _Note any stubs, mocks, or disabled integrations._

### Production

- Deployment windows: _Define the standard deployment windows._
- Rollback procedure: _Link to the relevant runbook or SOP._

## Azure Resources

_Link or summarize the key Azure resources (App Services, Key Vaults, databases, storage accounts) used across environments. Keep detailed resource inventories in the infrastructure-as-code repository._

## Related

- [Module Registry](registry.md) — which modules deploy where
- [Deployment SOP](../operations/sops/index.md) — release execution steps
- [Rotate Key Vault Secret](../how-to.md) — operational how-to for secret rotation
