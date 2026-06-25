# Copilot Instructions

This repository is a single-product documentation portal for the Smart City, built with MkDocs Material and hosted in GitLab.

## Hybrid documentation strategy

Three systems hold different types of content. Never mix them:

- **MkDocs (this repo)**: Long-lived product context, architecture, business rules, QA strategy, operational procedures, and governance.
- **GitLab Epics/Issues**: Active execution — user stories, sprint work, bug tracking, milestone progress. Never duplicate user stories or acceptance criteria in MkDocs.
- **SharePoint**: Official Word documents, signed-off Business Requirements (BRS), executive approvals. Summarize core rules in MkDocs and link to the SharePoint source.

## Portal structure

| Section | Folder | What belongs here |
|---|---|---|
| Product | `docs/product/` | Functional specs (epic level), design/UX links, BRS references, GitLab execution links, contribution guides |
| Engineering | `docs/engineering/` | System architecture, module registry, environments, deployment, ADRs |
| QA | `docs/qa/` | Test strategy, test environments, mock data, automated test report links |
| Operations | `docs/operations/` | SOPs, runbooks, controls, monitoring dashboards, incident management |
| Governance | `docs/governance/` | Onboarding, compliance/security, team roster, meeting rhythms |
| How-to Catalog | `docs/how-to.md` | Central index of all how-to articles (articles live in their owning section) |
| Templates | `docs/doc-templates/` | Standard document shapes for features, runbooks, ADRs, services, how-to guides |

## Rules

- Add valid YAML frontmatter to every Markdown page: `owner`, `status`, `last_review_date`, `next_review_date`, `classification`, `criticality`.
- Do not create empty placeholder files. Create documents only when there is real content and an owner.
- Use templates from `docs/doc-templates/`.
- Put how-to articles in a `how-to/` subfolder under the owning section (e.g. `operations/how-to/`, `engineering/how-to/`).
- Update `docs/how-to.md` when adding a new how-to article.
- When referencing user stories or sprint work, link to GitLab — never paste story text into MkDocs.
- When referencing signed-off BRS documents, summarize the core rules and link to SharePoint.
- Keep operational pages (runbooks, SOPs) precise and actionable — commands, checks, and steps, not explanatory prose.
