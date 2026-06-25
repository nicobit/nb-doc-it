# Smart City — Documentation Portal

This repository contains an MkDocs-ready documentation portal for the Smart City.

## Hybrid documentation strategy

This portal uses three systems, each with a clear responsibility:

- **MkDocs (this repo)**: Long-lived product context, architecture, high-level business rules, QA strategy, operational procedures, and governance.
- **GitLab Epics/Issues**: Active execution — user stories, sprint work, bug tracking, and milestone progress. Never duplicated here.
- **SharePoint**: Official Word documents, signed-off Business Requirements (BRS), and executive approvals.

## Portal structure

| Section | What it covers |
|---|---|
| **Product** | Functional specs, business rules, design assets, BRS references, GitLab execution links |
| **Engineering** | System architecture, module registry, environments, deployment, ADRs |
| **QA** | Test strategy, test environments, mock data, automated test reports |
| **Operations** | SOPs, runbooks, controls, monitoring dashboards, incident management |
| **Governance** | Onboarding, compliance, team roster, meeting rhythms |
| **How-to Catalog** | Cross-cutting index of all practical how-to guides |
| **Templates** | Standard document shapes for features, runbooks, ADRs, services, and how-to guides |

## Local preview

```bash
pip install mkdocs-material
mkdocs serve
```

## Build

```bash
mkdocs build
```
