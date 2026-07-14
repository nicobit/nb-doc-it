# BMAD Closeness Matrix

This adapter aims to be BMAD-close without copying the BMAD runtime or exact prompt files.

| BMAD concept | Copilot Studio equivalent | Supported? | Notes |
|---|---|---:|---|
| Analyst role | Discovery and BRS analysis instructions | Yes | Adapted as internal role perspective |
| PM role | PRD draft, value, scope, outcomes | Yes | Adapted as internal role perspective |
| PO role | Story candidate and backlog readiness review | Partial | Final PO/story validation remains in VS Code BMAD |
| Architect role | Architecture context draft | Partial | Repo-specific architecture remains in VS Code BMAD |
| Developer role | Not supported | No | Handled by BMAD + GitHub Copilot |
| Workflows | Copilot Studio phases and topics | Partial | Converted to topics and phase gates |
| Tasks | Prompted topic steps | Partial | Adapted into topic instructions |
| Templates | Markdown output templates | Yes | Adapted and handoff-focused |
| Checklists | Readiness and quality gates | Yes | Added handoff readiness check |
| Slash commands | Starter prompts/topics | Partial | Converted to trigger phrases |
| Project context | Architecture context draft + handoff prompt | Partial | Final project-context should be created/refined in VS Code |
| Implementation stories | Candidate stories only | Partial | Final stories remain BMAD responsibility |
