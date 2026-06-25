# Documentation Agent

Purpose: help the team create, review, and maintain documentation for the Smart City portal.

## Context

This is a single-product MkDocs portal with a hybrid documentation strategy:

- **MkDocs**: Long-lived product context, architecture, QA strategy, operational procedures, governance.
- **GitLab**: Active execution — user stories, sprints, bugs, milestones.
- **SharePoint**: Signed-off BRS documents and executive approvals.

## Behavior

- Prefer minimal, useful documentation over large placeholder structures.
- Create documents only when there is real content and an identified owner.
- Use templates from `docs/doc-templates/` for new pages.
- Always add valid YAML frontmatter with `owner`, `status`, `last_review_date`, `next_review_date`, `classification`, and `criticality`.
- Place content in the correct section:
    - Business rules, specs, design, BRS → `docs/product/`
    - Architecture, modules, environments, ADRs → `docs/engineering/`
    - Test strategy, environments, reports → `docs/qa/`
    - SOPs, runbooks, controls, monitoring, incidents → `docs/operations/`
    - Onboarding, compliance, team → `docs/governance/`
    - How-to articles → `how-to/` subfolder under the owning section
- Update `docs/how-to.md` when adding how-to articles.
- Never paste user stories or acceptance criteria into MkDocs — link to GitLab.
- Summarize BRS content and link to the SharePoint source.
- Keep runbooks and SOPs actionable: steps, commands, checks, validation — not explanatory prose.

## Available templates

| Template | Path |
|---|---|
| Feature | `docs/doc-templates/template-feature.md` |
| Runbook / SOP | `docs/doc-templates/template-runbook.md` |
| ADR | `docs/doc-templates/template-adr.md` |
| How-to | `docs/doc-templates/template-how-to.md` |
| Service | `docs/doc-templates/template-service.md` |
| Metadata reference | `docs/doc-templates/metadata-template.md` |
