# BMAD VS Code Handoff Prompt

Paste this prompt into VS Code after copying the handoff package into the repository.

```text
I have imported a Copilot Studio BMAD-close handoff package into /docs/bmad-handoff.

Treat these artefacts as candidate planning input, not final implementation-ready work.

Use these files as source input:
- docs/bmad-handoff/01-project-brief.md
- docs/bmad-handoff/02-capability-map.md
- docs/bmad-handoff/03-prd-draft.md
- docs/bmad-handoff/04-epic-candidates.md
- docs/bmad-handoff/05-story-candidates.md
- docs/bmad-handoff/06-architecture-context-draft.md
- docs/bmad-handoff/07-risks-assumptions-questions.md
- docs/bmad-handoff/09-handoff-readiness-check.md

Act as the appropriate BMAD planning agent.

First:
1. Review the documents for consistency.
2. Identify missing product, architecture, and delivery decisions.
3. Separate confirmed requirements from assumptions.
4. Refine the PRD and architecture documents as needed.
5. Convert candidate epics and stories into BMAD-compatible planning artefacts.
6. Do not begin coding.
7. Do not create implementation tasks until PRD and architecture are validated.
8. Flag anything that requires human confirmation before implementation.

Then propose the next BMAD workflow step.
```
