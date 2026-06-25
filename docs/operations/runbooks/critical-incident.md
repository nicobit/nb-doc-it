---
owner: "SRE Lead"
status: "draft"
last_review_date: "2026-06-25"
next_review_date: "2026-12-25"
classification: "internal"
criticality: "critical"
---

# Runbook: Critical Incident

## Trigger

Use this runbook when a production issue has major user, client, regulatory, or business impact.

## Steps

1. **Confirm impact and severity.** Check monitoring dashboards, user reports, and error logs.
2. **Assign incident commander.** The incident commander owns communication and coordination.
3. **Open communication channel.** Create a dedicated channel or bridge call.
4. **Identify technical owner and support roles.** Assign investigation, communication, and business liaison roles.
5. **Start mitigation and evidence collection.** Capture timestamps, affected tenants, and initial root cause candidates.
6. **Communicate status at agreed intervals.** Update stakeholders at fixed intervals (e.g., every 30 minutes).
7. **Confirm recovery.** Validate that the issue is resolved and evidence is captured.
8. **Open problem record.** If root cause or prevention action is required, open a follow-up.

## Dashboards

| Dashboard | Link |
|---|---|
| Application health | _Link to monitoring dashboard_ |
| Error rate | _Link to monitoring dashboard_ |
| Infrastructure | _Link to monitoring dashboard_ |

## Escalation

| Role | Contact | When |
|---|---|---|
| Incident commander | _Name or rotation_ | Always |
| Engineering lead | _Name_ | Technical escalation |
| Business owner | _Name_ | Client or regulatory impact |

## Related

- [Incident Management](../incidents.md) — on-call schedules and SLA details
- [Monitoring Dashboards](../monitoring.md) — full dashboard list
