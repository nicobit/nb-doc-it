---
owner: "QA Lead"
status: "draft"
last_review_date: "2026-07-09"
next_review_date: "2027-01-09"
classification: "internal"
criticality: "high"
---

# SOP: Smoke Test Procedure

## Purpose

Verify that core Smart City functionality works after a deployment, before declaring the release healthy.

## Scope

Run this procedure after every production or staging deployment, and after infrastructure changes that affect the application tier.

## Prerequisites

- [ ] Deployment pipeline completed without errors
- [ ] Test account credentials available for the target environment
- [ ] Monitoring dashboards open for the target environment

## Steps

1. **Check service health endpoints.** All modules must report healthy before functional checks start.
2. **Log in with a test account.** Confirm authentication and role-based landing page.
3. **Verify the main dashboard loads.** Widgets render with live data and no console errors.
4. **Create a test record.** Add a record in a non-critical module and confirm it persists.
5. **Verify search.** Run a known query and confirm expected results return.
6. **Verify notifications.** Trigger a test notification and confirm delivery.
7. **Delete the test record.** Clean up any data created during the test.
8. **Record the result.** Log pass/fail per step in the release ticket with timestamps.

## Pass criteria

All steps pass with no errors. A single failed step means the smoke test fails — escalate to the release manager and do not close the release.

## On failure

1. Capture screenshots, timestamps, and request IDs.
2. Notify the release manager in the release channel.
3. Decide with the release manager: retry, fix forward, or roll back per the [Release Execution SOP](release-execution.md).

## Related

- [Release Execution](release-execution.md)
- [Test Environments and Mock Data](../../qa/environments.md)
