---
owner: "QA Lead"
status: "draft"
last_review_date: "2026-06-25"
next_review_date: "2026-12-25"
classification: "internal"
criticality: "medium"
---

# Automated Test Reports

This page links to CI/CD pipeline test artifacts. Reports are generated automatically on each pipeline run and are the source of truth for test results.

## Pipeline Reports

| Report | Tool | Pipeline link |
|---|---|---|
| Unit test results | _e.g. Jest, xUnit_ | [View latest](https://gitlab.example.com) |
| Integration test results | _e.g. Postman, custom suite_ | [View latest](https://gitlab.example.com) |
| E2E test results | _e.g. Cypress, Playwright_ | [View latest](https://gitlab.example.com) |
| Code coverage | _e.g. Istanbul, Coverlet_ | [View latest](https://gitlab.example.com) |

## How to Read These Reports

1. Open the pipeline link for the relevant merge request or branch.
2. Navigate to the **Test** tab in GitLab CI/CD.
3. Download artifacts for detailed failure analysis.

## Coverage Trends

_Link to a coverage trend dashboard if one exists (e.g. GitLab analytics, SonarQube)._

## Related

- [QA Strategy](strategy.md) — coverage targets and testing approach
- [GitLab Execution Hub](../product/gitlab-hub.md) — pipeline and milestone links
