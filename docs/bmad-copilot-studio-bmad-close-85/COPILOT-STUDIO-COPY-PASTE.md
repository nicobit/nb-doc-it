# Copilot Studio Copy/Paste Configuration

## Agent name

BMAD-Close Handoff Orchestrator

## Description

Transforms SharePoint business requirements and source documents into a BMAD-ready handoff package for validation in VS Code. Produces project brief, capability map, PRD draft, epic candidates, story candidates, architecture context draft, risks, assumptions, open questions, and a BMAD import prompt. Stops before implementation-ready stories.

## Core instructions

Paste the content from:

- `03-agent-instructions/agent-01-bmad-close-handoff-orchestrator.md`
- `03-agent-instructions/bmad-close-operating-protocol.md`
- `09-governance/bmad-boundary-rules.md`

## Knowledge to add

Add the SharePoint folder:

`BMAD-Copilot-Studio/02-agent-knowledge/`

Recommended files to include there:

- `05-bmad-close-knowledge/method/elicitation-rules.md`
- `05-bmad-close-knowledge/method/planning-mode-rules.md`
- `05-bmad-close-knowledge/method/evidence-and-traceability-rules.md`
- `05-bmad-close-knowledge/roles/role-perspectives.md`
- `05-bmad-close-knowledge/checklists/handoff-quality-checklist.md`
- all files from `06-output-templates/`

## Topics to configure

Create topics based on:

1. `04-topics/topic-00-select-planning-mode.md`
2. `04-topics/topic-01-analyze-brs.md`
3. `04-topics/topic-02-create-project-brief.md`
4. `04-topics/topic-03-generate-capability-map.md`
5. `04-topics/topic-04-create-prd-draft.md`
6. `04-topics/topic-05-create-epic-candidates.md`
7. `04-topics/topic-06-create-story-candidates.md`
8. `04-topics/topic-07-create-architecture-context-draft.md`
9. `04-topics/topic-08-prepare-bmad-handoff-package.md`
10. `04-topics/topic-09-write-handoff-to-sharepoint.md`

## Starter prompts

- Analyze this BRS and prepare a BMAD handoff package.
- Select the right planning mode for this initiative.
- Create a project brief from the source documents.
- Generate a capability map from this BRS.
- Create a PRD draft, but do not create final implementation stories.
- Create candidate epics and candidate stories for BMAD validation.
- Prepare the final BMAD VS Code handoff package.

## Required final output folder

`BMAD-Copilot-Studio/05-output/bmad-handoff/<initiative-id>/`

Expected files:

1. `01-project-brief.md`
2. `02-capability-map.md`
3. `03-prd-draft.md`
4. `04-epic-candidates.md`
5. `05-story-candidates.md`
6. `06-architecture-context-draft.md`
7. `07-risks-assumptions-questions.md`
8. `08-bmad-vscode-handoff-prompt.md`
9. `09-handoff-readiness-check.md`
