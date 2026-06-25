---
owner: "SRE Lead"
status: "draft"
last_review_date: "2026-06-25"
next_review_date: "2026-12-25"
classification: "internal"
criticality: "high"
---

# Monitoring Dashboards

This page links to the external monitoring tools used for the Smart City. Dashboards are the primary tool for observing system health during incidents and routine operations.

## Dashboards

| Dashboard | Tool | Purpose | Link |
|---|---|---|---|
| Application health | _e.g. Datadog, Application Insights_ | Overall application availability and error rates | [Open dashboard](https://monitoring.example.com) |
| API latency | _e.g. Grafana_ | p50, p95, p99 latency for API endpoints | [Open dashboard](https://monitoring.example.com) |
| Infrastructure | _e.g. Azure Monitor_ | VM, container, and database resource utilization | [Open dashboard](https://monitoring.example.com) |
| Business metrics | _e.g. Custom dashboard_ | Onboarding completion rates, conversion funnels | [Open dashboard](https://monitoring.example.com) |

## Alerts

| Alert | Severity | Channel | Runbook |
|---|---|---|---|
| _Example: API error rate > 5%_ | Critical | _Slack channel or PagerDuty_ | [Critical Incident](runbooks/critical-incident.md) |
| _Example: Onboarding queue backlog > 100_ | Warning | _Slack channel_ | _Link to runbook_ |

## Related

- [Incident Management](incidents.md) — escalation and on-call details
- [Critical Incident Runbook](runbooks/critical-incident.md) — what to do when alerts fire
