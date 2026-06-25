---
owner: "SRE Lead"
status: "draft"
last_review_date: "2026-06-25"
next_review_date: "2026-12-25"
classification: "internal"
criticality: "high"
---

# Incident Management

## On-Call Schedule

| Week | Primary | Secondary | Rotation tool |
|---|---|---|---|
| _Current week_ | _Name_ | _Name_ | [View rotation](https://oncall.example.com) |

_Keep the on-call rotation in the external tool (PagerDuty, Opsgenie, etc.) and link here._

## Escalation Paths

| Severity | Response time | Escalation |
|---|---|---|
| Critical | Immediate | Incident commander + engineering lead + business owner |
| High | 30 minutes | On-call engineer + team lead |
| Medium | 4 hours | On-call engineer |
| Low | Next business day | Team backlog |

## SLA Summary

| Metric | Target |
|---|---|
| Availability | _e.g. 99.9%_ |
| Mean time to acknowledge (MTTA) | _e.g. 15 minutes_ |
| Mean time to resolve (MTTR) | _e.g. 4 hours for critical_ |

## Post-Incident Review

After every critical or high-severity incident:

1. Schedule a blameless post-incident review within 5 business days.
2. Document root cause, timeline, and prevention actions.
3. File follow-up issues in GitLab.
4. Update the relevant runbook if the steps were inadequate.

## Related

- [Critical Incident Runbook](runbooks/critical-incident.md) — step-by-step incident response
- [Monitoring Dashboards](monitoring.md) — observability tools
