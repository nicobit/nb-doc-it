---
owner: "Governance Owner"
status: "draft"
last_review_date: "2026-06-25"
next_review_date: "2026-12-25"
classification: "internal"
criticality: "high"
---

# Compliance and Security

## Data Classification

| Classification | Definition | Handling rules |
|---|---|---|
| Public | Information intended for public release | No restrictions |
| Internal | Information for internal use within the organization | Do not share externally without approval |
| Confidential | Sensitive business or client information | Access restricted by role; encrypted at rest and in transit |
| Restricted | Regulated or legally protected data | Strict access controls; audit logging required |

## Security Requirements

- All services must enforce authentication and authorization.
- Secrets and credentials must be stored in Azure Key Vault, never in code or configuration files.
- Dependencies must be scanned for known vulnerabilities in the CI/CD pipeline.
- Security incidents follow the [Critical Incident Runbook](../operations/runbooks/critical-incident.md).

## Risk Controls

| Control | Frequency | Owner | Evidence |
|---|---|---|---|
| Dependency vulnerability scan | Per pipeline run | Engineering | CI/CD report |
| Access review | Quarterly | Team Lead | Review log |
| Secret rotation | Per policy | SRE Lead | Key Vault audit log |
| Penetration testing | Annual | Security team | Test report |

## Audit Evidence

When audit evidence is required:

1. Identify the control being audited.
2. Collect the evidence artifact (pipeline report, access log, review record).
3. Store evidence in the designated SharePoint folder.
4. Link the evidence in the relevant [Operational Control](../operations/controls/index.md).

## Related

- [Operational Controls](../operations/controls/index.md) — where evidence-oriented checks are tracked
- [BRS Reference](../product/brs-reference.md) — signed-off business requirements
