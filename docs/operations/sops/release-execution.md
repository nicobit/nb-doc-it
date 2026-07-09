---
owner: "Release Manager"
status: "draft"
last_review_date: "2026-07-09"
next_review_date: "2027-01-09"
classification: "internal"
criticality: "high"
---

# SOP: Release Execution

## Purpose

Provide a repeatable procedure for promoting a release from staging to production with the required approvals, checks, and communication.

## Scope

Applies to all scheduled production releases of Smart City modules. Hotfixes follow the same steps in compressed form; see [Critical Incident](../runbooks/critical-incident.md) for emergency changes.

## Prerequisites

- [ ] Release candidate tagged and deployed to staging
- [ ] All automated test suites green on the release branch
- [ ] Release notes drafted and reviewed by the product owner
- [ ] Change approval recorded in the change log
- [ ] Rollback plan confirmed for every module in the release

## Steps

1. **Announce the release window.** Post the schedule in the release channel at least 24 hours in advance.
2. **Freeze the release branch.** No merges after the freeze except approved blockers.
3. **Run the pre-release checklist.** Verify staging smoke tests, pending migrations, and feature flag states.
4. **Execute database migrations.** Run migrations in order and verify each one before continuing.
5. **Deploy to production.** Trigger the production pipeline and monitor each stage until completion.
6. **Run the post-deploy smoke test.** Follow the [Smoke Test Procedure](smoke-test.md) against production.
7. **Confirm monitoring is clean.** Watch error rates and latency dashboards for 30 minutes after deploy.
8. **Announce completion.** Publish release notes and close the release ticket.

## Rollback

If the post-deploy smoke test fails or error rates spike:

1. Stop any remaining deployment stages.
2. Redeploy the previous tagged version.
3. Revert migrations only if they are not backward compatible.
4. Notify stakeholders and open an incident if users were affected.

## Related

- [Smoke Test Procedure](smoke-test.md)
- [Environments and Deployment](../../engineering/environments.md)
