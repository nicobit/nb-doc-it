---
owner: "Support Lead"
status: "draft"
last_review_date: "2026-07-09"
next_review_date: "2027-01-09"
classification: "internal"
criticality: "medium"
---

# SOP: Support Handoff

## Purpose

Ensure open issues, ongoing incidents, and pending client commitments transfer cleanly between support shifts or on-call rotations.

## Scope

Applies to daily shift changes and weekly on-call rotation changes for the Smart City support team.

## Prerequisites

- [ ] Ticket queue triaged — no unassigned tickets older than the SLA threshold
- [ ] Handoff notes template open
- [ ] Incoming person confirmed available

## Steps

1. **Review open incidents.** Walk through every active incident: current status, next action, and who owns it.
2. **Review pending client commitments.** List promised callbacks, updates, or deliverables with their deadlines.
3. **Flag at-risk SLAs.** Point out tickets approaching their SLA limit in the next shift.
4. **Hand over ongoing investigations.** Share context that is not yet in the ticket: hypotheses tested, dead ends, useful contacts.
5. **Confirm on-call access.** Incoming person verifies access to monitoring, paging, and escalation contacts.
6. **Write the handoff note.** Summarize items 1–4 in the handoff channel and tag the incoming person.
7. **Confirm acceptance.** Handoff is complete only when the incoming person acknowledges the note.

## Handoff note format

```text
Shift handoff — <date> <outgoing> → <incoming>
Incidents: <id> — <status> — <next action> — <owner>
Commitments: <client> — <what> — <due>
SLA watch: <ticket> — <deadline>
Context: <anything not in tickets>
```

## Related

- [Incident Management](../incidents.md)
- [Team and Meetings](../../governance/team.md)
