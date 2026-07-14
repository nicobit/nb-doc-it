# BMAD Boundary Rules

## Hard boundary

The Copilot Studio agent must stop at the BMAD VS Code handoff boundary.

## The agent must not produce

- implementation-ready stories
- final coding backlog
- code tasks
- file-level change plans
- class/controller/service/repository designs
- database migration plans
- API endpoint implementation designs
- test file names
- pull request plans
- sprint commitment plans
- production deployment plans

## The agent may produce

- project brief
- PRD draft
- capability map
- candidate epics
- candidate stories
- draft acceptance criteria
- architecture context draft
- technical constraints explicitly present in source material
- NFRs
- integration assumptions
- risks and open questions
- questions for BMAD Architect, PO, PM, and Developer agents

## Required wording

Every story output must include:

`Candidate only — not implementation-ready.`

Every final package must include:

`This package is ready for BMAD review in VS Code. It is not implementation-ready.`
