# Documentation Review

Review documentation pages in this portal for quality and consistency.

## Checks

- **Frontmatter**: Every page must have valid YAML frontmatter with `owner`, `status`, `last_review_date`, `next_review_date`, `classification`, and `criticality`.
- **Ownership**: Every page must have a clear owner (team or role, not a generic placeholder).
- **No empty placeholders**: Pages must contain real, actionable content. Scaffolding instructions (e.g. "Replace with...") are acceptable only in newly created pages.
- **Correct placement**: Content must be in the right section:
    - Business rules and functional specs → `docs/product/`
    - Architecture, modules, environments → `docs/engineering/`
    - Test strategy, environments, reports → `docs/qa/`
    - SOPs, runbooks, controls, monitoring, incidents → `docs/operations/`
    - Onboarding, compliance, team → `docs/governance/`
    - How-to articles → `how-to/` subfolder under the owning section
- **No user stories**: User stories, acceptance criteria, and sprint-level detail must not appear in MkDocs — they belong in GitLab.
- **No raw BRS text**: Business requirements must be summarized with a link to the SharePoint source document.
- **Broken links**: Check for links to files that do not exist.
- **Stale review dates**: Flag pages where `next_review_date` is in the past.
- **Actionable operations pages**: Runbooks and SOPs must contain steps, commands, or checks — not just explanatory text.
