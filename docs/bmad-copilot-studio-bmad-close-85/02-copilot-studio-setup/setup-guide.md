# Copilot Studio Setup Guide

## 1. Create SharePoint folders

Create the folder structure from `01-sharepoint-structure/sharepoint-folder-map.md`.

Copy these package folders into SharePoint under `02-agent-knowledge/`:

```text
05-bmad-close-knowledge/method/
05-bmad-close-knowledge/roles/
05-bmad-close-knowledge/checklists/
06-output-templates/
09-governance/
11-source-mapping/
```

Place BRS and architecture source documents under:

```text
03-input/brs/
03-input/architecture/
```

## 2. Create the Copilot Studio agent

Create a new Copilot Studio agent.

Recommended name:

```text
BMAD-Close Handoff Orchestrator
```

Recommended description:

```text
Transforms SharePoint business requirement documents into a BMAD-ready handoff package for later validation in VS Code. Stops before implementation-ready stories and coding tasks.
```

## 3. Add instructions

Paste the combined content from:

```text
03-agent-instructions/agent-01-bmad-close-handoff-orchestrator.md
03-agent-instructions/bmad-close-operating-protocol.md
09-governance/bmad-boundary-rules.md
```

## 4. Add knowledge

Add SharePoint knowledge source:

```text
BMAD-Copilot-Studio/02-agent-knowledge/
BMAD-Copilot-Studio/03-input/
```

Ensure users only have access to documents they are allowed to read.

## 5. Create topics

Create topics using the files under `04-topics/`.

Minimum topics for pilot:

```text
topic-00-select-planning-mode.md
topic-01-analyze-brs.md
topic-04-create-prd-draft.md
topic-08-prepare-bmad-handoff-package.md
```

Recommended full set: all topic files.

## 6. Optional SharePoint write action

Copilot Studio can use SharePoint as knowledge. Writing Markdown files back to SharePoint generally requires an action, custom connector, or Power Automate flow.

Use the action contract:

```text
07-actions/sharepoint-write-handoff-package-action-contract.md
```

For a pilot, manual copy/paste output is acceptable.

## 7. Test

Use:

```text
08-tests/test-prompts.md
08-tests/acceptance-test-matrix.md
```

Do not move to production until one real or anonymized BRS has passed the readiness checks.
