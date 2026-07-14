# SharePoint Folder Map

Create a SharePoint document library or folder named:

```text
BMAD-Copilot-Studio/
```

Recommended structure:

```text
BMAD-Copilot-Studio/
  01-source-bmad/
    README-source-notes.md
    optional-bmad-reference-files/

  02-agent-knowledge/
    method/
    roles/
    checklists/
    templates/

  03-input/
    brs/
    architecture/
    meeting-notes/
    constraints/

  04-working/
    initiative-id/

  05-output/
    bmad-handoff/
      initiative-id/

  06-tests/
    test-brs/
    expected-output/

  07-archive/
```

## What Copilot Studio reads

Configure the agent knowledge source to include:

```text
BMAD-Copilot-Studio/02-agent-knowledge/
BMAD-Copilot-Studio/03-input/
```

## Where outputs are written

If you use a SharePoint write action, write final handoff outputs to:

```text
BMAD-Copilot-Studio/05-output/bmad-handoff/<initiative-id>/
```

If you do not use a write action, the agent should generate each Markdown artefact in the chat and the user should save them manually.
