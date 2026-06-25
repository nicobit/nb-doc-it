---
owner: "Product Owner"
status: "draft"
last_review_date: "2026-06-25"
next_review_date: "2026-12-25"
classification: "internal"
criticality: "medium"
---

# Contribution Guide

This page explains how to contribute to the product through GitLab and to this documentation portal.

## Reporting Bugs

1. Open a new issue in the product GitLab project.
2. Use the **Bug Report** template.
3. Include steps to reproduce, expected behavior, and actual behavior.
4. Attach screenshots or logs when possible.

## Requesting Features

1. Open a new issue in the product GitLab project.
2. Use the **Feature Request** template.
3. Describe the user need, not the solution.
4. The product owner will triage and prioritize.

## Updating Documentation

1. Clone this documentation repository.
2. Create a branch following the naming convention `docs/short-description`.
3. Use the appropriate [template](../doc-templates/index.md).
4. Set frontmatter metadata: `owner`, `status`, `next_review_date`, `classification`, `criticality`.
5. Submit a merge request for review.

## Issue Templates

| Template | When to use | Link |
|---|---|---|
| Bug Report | Defect in production or test | [Use template](https://gitlab.example.com) |
| Feature Request | New capability or improvement | [Use template](https://gitlab.example.com) |
| Documentation | Portal content change | [Use template](https://gitlab.example.com) |
