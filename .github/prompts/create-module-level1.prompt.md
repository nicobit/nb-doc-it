# Add a New Module to the Registry

Register a new module in the Smart City documentation.

## Requirements

1. Add an entry to the module registry table in `docs/engineering/registry.md` with: module name, type, owner, GitLab repo link, and CI status.
2. If the module introduces a new interaction boundary, update the architecture diagram in `docs/engineering/architecture.md`.
3. If the module has important settings or configuration, add an entry summarizing them under the relevant product section or link from `docs/product/functional-specs.md`.
4. If the module exposes an API, consider creating a service page using `docs/doc-templates/template-service.md`.

## Rules

- The code-level `README.md` lives in the GitLab repository, not in this portal.
- Do not create empty placeholder pages. Only create documentation when there is real content and an owner.
- Add valid YAML frontmatter to every new page.
- Do not duplicate user stories or acceptance criteria — link to GitLab.
