# MkDocs GitLab Federated Documentation Portal

This project builds one MkDocs Material site from several private GitLab repositories when each repository may require different credentials.

It uses:

- `mkdocs-monorepo-plugin` for root navigation with child `mkdocs.yml` files;
- one GitLab deploy token or access token per repository;
- shallow partial clone and sparse checkout;
- only the configured documentation directory and child `mkdocs.yml` are checked out.

## Architecture

```text
Central documentation repository
├── root mkdocs.yml: global navigation, theme and plugins
├── repositories.conf: repository locations and path mappings
├── clone script: authentication and sparse checkout
└── GitLab Pages pipeline

Source repository
├── mkdocs.yml, or documentation/mkdocs.yml
└── docs/, or another configured documentation directory
```

The central repository controls the global navigation. Each source repository controls its own internal navigation.

## Project structure

```text
.
├── .gitlab-ci.yml
├── .gitignore
├── mkdocs.yml
├── repositories.conf
├── requirements.txt
├── docs/
├── examples/
└── scripts/
    ├── clone-repositories.sh
    └── validate-imports.sh
```

The generated `imported/` and `public/` directories are ignored by Git.

## 1. Configure repositories

Edit `repositories.conf`:

```text
application-a|https://gitlab.example.com/group-a/application-a.git|main|application-a|APPLICATION_A_GIT_USER|APPLICATION_A_GIT_TOKEN|docs|mkdocs.yml
application-b|https://gitlab.example.com/group-b/application-b.git|main|application-b|APPLICATION_B_GIT_USER|APPLICATION_B_GIT_TOKEN|documentation/docs|documentation/mkdocs.yml
```

Format:

```text
id|repository_url|branch|target_directory|username_variable|token_variable|docs_path|mkdocs_path
```

Fields:

| Field | Purpose |
|---|---|
| `id` | Logical repository identifier used in logs |
| `repository_url` | Credential-free HTTPS Git URL |
| `branch` | Branch or tag to import |
| `target_directory` | Directory below central `imported/` |
| `username_variable` | Environment-variable name containing the GitLab username |
| `token_variable` | Environment-variable name containing the token |
| `docs_path` | Documentation directory relative to the source repository root |
| `mkdocs_path` | Child MkDocs configuration relative to the source repository root |

Do not put usernames or tokens directly in this file.

## 2. Configure GitLab CI/CD variables

In the central portal project, create variables under **Settings → CI/CD → Variables**:

```text
APPLICATION_A_GIT_USER
APPLICATION_A_GIT_TOKEN
APPLICATION_B_GIT_USER
APPLICATION_B_GIT_TOKEN
```

Recommended settings:

- use a GitLab Deploy Token per repository where possible;
- grant only `read_repository`;
- mark tokens `Masked`;
- mark them `Protected` when builds run only on protected branches.

## 3. Configure root navigation

The central `mkdocs.yml` explicitly decides where each repository appears:

```yaml
nav:
  - Home: index.md
  - Applications:
      - Application A: "!include ./imported/application-a/mkdocs.yml"
      - Application B: "!include ./imported/application-b/documentation/mkdocs.yml"
```

The include path must combine:

```text
imported/<target_directory>/<mkdocs_path>
```

## 4. Configure source repositories

### Root documentation layout

```text
application-a/
├── mkdocs.yml
└── docs/
    ├── index.md
    └── architecture/
        └── index.md
```

Child `mkdocs.yml`:

```yaml
site_name: applications/application-a
docs_dir: docs

nav:
  - Overview: index.md
  - Architecture:
      - Overview: architecture/index.md
```

Corresponding central configuration:

```text
...|docs|mkdocs.yml
```

### Nested documentation layout

```text
application-b/
└── documentation/
    ├── mkdocs.yml
    └── docs/
        ├── index.md
        └── runbooks/
            └── index.md
```

Child `documentation/mkdocs.yml`:

```yaml
site_name: applications/application-b
docs_dir: docs

nav:
  - Overview: index.md
  - Runbooks:
      - Overview: runbooks/index.md
```

Corresponding central configuration:

```text
...|documentation/docs|documentation/mkdocs.yml
```

## 5. How the optimized clone works

For every repository, the script uses:

```bash
git clone \
  --depth 1 \
  --filter=blob:none \
  --no-checkout \
  --branch main \
  https://gitlab.example.com/group/project.git \
  imported/project

git -C imported/project sparse-checkout init --no-cone
git -C imported/project sparse-checkout set --no-cone \
  /docs/ \
  /mkdocs.yml
git -C imported/project checkout
```

The options have different purposes:

- `--depth 1` avoids downloading historical commits;
- `--filter=blob:none` delays downloading file contents until required;
- `--no-checkout` prevents an initial full working tree;
- sparse checkout materializes only the configured documentation and MkDocs configuration.

Git still downloads the commit and tree metadata needed to navigate the repository. When the GitLab server does not support partial-clone filtering, Git may ignore `--filter=blob:none`; sparse checkout still keeps the CI working tree small.

## 6. Local build

Create a virtual environment:

```bash
python3 -m venv .venv
. .venv/bin/activate
python -m pip install -r requirements.txt
```

Export credentials:

```bash
export APPLICATION_A_GIT_USER='gitlab+deploy-token-123'
export APPLICATION_A_GIT_TOKEN='token-value'
export APPLICATION_B_GIT_USER='gitlab+deploy-token-456'
export APPLICATION_B_GIT_TOKEN='token-value'
```

Clone and serve:

```bash
./scripts/clone-repositories.sh
./scripts/validate-imports.sh
mkdocs serve
```

Strict production build:

```bash
mkdocs build --strict --site-dir public
```

## 7. Test without GitLab

The `examples/` directory contains two sample child projects. Copy them into the same structure produced by the clone script:

```bash
rm -rf imported
mkdir -p imported/application-a imported/application-b/documentation
cp -R examples/application-a/. imported/application-a/
cp -R examples/application-b/. imported/application-b/documentation/
mkdocs build --strict --site-dir public
```

## 8. Add another repository

1. Add one line to `repositories.conf`.
2. Create its username and token CI/CD variables.
3. Add its `!include` entry to the root `mkdocs.yml`.
4. Confirm its child configuration has a unique path-like `site_name`.
5. Run `clone-repositories.sh`, `validate-imports.sh`, and a strict MkDocs build.

## Security notes

- Credentials are read only from environment variables.
- A temporary Git credential file is created with permission `600` and removed after each clone.
- Repository URLs contain no credentials.
- Usernames and tokens are URL encoded before being written to the temporary credential file.
- Do not use `set -x` in jobs that handle credentials.
- Prefer repository-scoped deploy tokens with `read_repository` only.
- Do not store the generated `imported/` directory as a CI artifact.

## Known limitation

The monorepo plugin supports includes from the root MkDocs configuration. Avoid nested `!include` directives inside child configurations. Keep shared theme, plugin and Markdown-extension settings in the root `mkdocs.yml`; use child files primarily for `site_name`, `docs_dir`, and local `nav`.
