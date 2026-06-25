---
owner: "QA Lead"
status: "draft"
last_review_date: "2026-06-25"
next_review_date: "2026-12-25"
classification: "internal"
criticality: "high"
---

# QA Strategy and Test Plans

## Testing Approach

| Level | Scope | Tooling | Responsibility |
|---|---|---|---|
| Unit tests | Individual functions and methods | _e.g. Jest, xUnit_ | Developer |
| Integration tests | API contracts and service interactions | _e.g. Postman, Integration test suite_ | Developer + QA |
| End-to-end tests | Critical user journeys through the UI | _e.g. Cypress, Playwright_ | QA |
| Manual regression | Exploratory testing and edge cases | Manual | QA |

## Test Coverage Targets

| Module | Unit | Integration | E2E |
|---|---|---|---|
| Onboarding API | _Target %_ | _Target %_ | Key flows |
| _Add module_ | _Target_ | _Target_ | _Scope_ |

## Regression Testing

- Regression suites run on every merge request via CI/CD.
- Manual regression is performed before each production release.
- Critical path regression covers: _list the critical user flows._

## Test Plan Ownership

| Module | Test plan owner | Last reviewed |
|---|---|---|
| Onboarding | _QA Lead_ | _Date_ |

## Acceptance Criteria Traceability

Acceptance criteria are defined in GitLab user stories and traced back to [BRS sections](../product/brs-reference.md). This portal does not duplicate acceptance criteria — refer to GitLab for the authoritative test-to-requirement mapping.
