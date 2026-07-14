# SharePoint Write Handoff Package Action Contract

## Purpose

Write generated Markdown artefacts to SharePoint under the initiative handoff folder.

## Target folder

`BMAD-Copilot-Studio/05-output/bmad-handoff/<initiative-id>/`

## Input schema

```json
{
  "initiativeId": "string",
  "targetFolder": "string",
  "files": [
    {
      "fileName": "01-project-brief.md",
      "contentMarkdown": "string"
    }
  ]
}
```

## Expected output

```json
{
  "status": "success | partial | failed",
  "writtenFiles": ["string"],
  "errors": ["string"]
}
```

## Notes

This is a contract only. Implement it using an approved connector, Microsoft Graph, or Power Automate according to your tenant governance.
