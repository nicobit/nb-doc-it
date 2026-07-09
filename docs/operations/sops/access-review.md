---
owner: "Operations Lead"
status: "draft"
last_review_date: "2026-07-09"
next_review_date: "2027-01-09"
classification: "internal"
criticality: "medium"
---

# SOP: Quarterly Access Review

## Purpose

Confirm every quarter that access to Smart City systems matches current roles, and remove access that is no longer justified.

## Scope

Covers production systems, cloud consoles, source repositories, CI/CD, and monitoring tools. HR systems are out of scope.

## Prerequisites

- [ ] Current team roster exported from HR
- [ ] Access reports exported from each in-scope system
- [ ] Previous review's findings available for follow-up

## Steps

1. **Export access lists.** Pull user and role lists from each in-scope system on the same day.
2. **Compare against the roster.** Flag accounts for people who left, changed teams, or changed roles.
3. **Flag privileged accounts.** Review every admin or production-write account individually with its owner's manager.
4. **Check service accounts.** Confirm each service account has a named owner and a documented purpose.
5. **Request removals.** Open a ticket per system listing accounts to remove or downgrade.
6. **Verify removals.** Re-export access lists after changes and confirm the flagged accounts are gone.
7. **Record the review.** File the evidence (exports, tickets, sign-off) in the compliance folder.

## Sign-off

| Role | Responsibility |
|---|---|
| Operations Lead | Runs the review and files evidence |
| Engineering Lead | Approves privileged access removals |
| Compliance Officer | Confirms evidence is complete |

## Related

- [Compliance and Security](../../governance/compliance.md)
- [Controls](../controls/index.md)
