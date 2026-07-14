# BMAD-Close Copilot Studio Adapter 8.5

This project is a Microsoft Copilot Studio + SharePoint adapter that prepares a BMAD-ready handoff package for later validation and delivery inside VS Code with BMAD and GitHub Copilot.

It is intentionally **not** a BMAD clone and does not copy the BMAD runtime. It is a BMAD-close adaptation of the behavior: agent personas, phased workflow, elicitation, artefact templates, checklists, and handoff boundary.

## Target flow

```text
SharePoint BRS / source material
  -> Copilot Studio BMAD-close Handoff Orchestrator
  -> planning mode selection
  -> discovery / project brief
  -> capability map
  -> PRD draft
  -> epic candidates
  -> story candidates
  -> architecture context draft
  -> risks, assumptions, questions
  -> BMAD handoff readiness check
  -> BMAD VS Code handoff package
STOP

VS Code + BMAD + GitHub Copilot
  -> validate PRD and architecture
  -> refine epics and stories
  -> create implementation-ready stories
  -> code and tests
```

## Important boundary

Copilot Studio must stop before implementation-ready stories. It may create candidate stories only. BMAD in VS Code owns implementation readiness.

## First files to read

1. `02-copilot-studio-setup/setup-guide.md`
2. `COPILOT-STUDIO-COPY-PASTE.md`
3. `03-agent-instructions/agent-01-bmad-close-handoff-orchestrator.md`
4. `03-agent-instructions/bmad-close-operating-protocol.md`
5. `09-governance/bmad-boundary-rules.md`

## SharePoint folder target

```text
BMAD-Copilot-Studio/
  01-source-bmad/
  02-agent-knowledge/
  03-input/
  04-working/
  05-output/bmad-handoff/
  06-tests/
  07-archive/
```

## Recommended pilot

Use one anonymized real BRS. Run the agent in Standard mode first. Check whether BMAD in VS Code can use the package without major rewriting.
