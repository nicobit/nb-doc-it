Yes. Since you **already have a BRS and an architecture**, you should not restart BMAD from brainstorming. Treat your documents as authoritative inputs, let BMAD convert the BRS into its PRD structure, reconcile the existing architecture with that PRD, and then generate epics and implementation stories.

BMAD currently recommends keeping existing project knowledge in a well-organized `docs/` folder, including business intent, business rules, architecture, and other relevant information. BMAD-generated artifacts go under `_bmad-output/`. ([BMAD Method][1])

# 1. Recommended project structure

At the root of your GitHub repository, use this structure:

```text
my-project/
├── docs/
│   ├── source/
│   │   ├── brs.md
│   │   └── architecture.md
│   ├── diagrams/
│   │   ├── system-context.png
│   │   ├── containers.png
│   │   └── deployment.png
│   └── references/
│       └── additional-information.md
│
├── src/
├── tests/
├── .github/
├── package.json
└── README.md
```

I recommend these names:

```text
docs/source/brs.md
docs/source/architecture.md
```

Do **not** initially put your existing documents inside `_bmad-output/`. That directory should contain BMAD-generated and BMAD-managed artifacts.

After installation, BMAD will create:

```text
_bmad/
_bmad-output/
```

`_bmad/` contains BMAD agents, workflows, tasks, and configuration. `_bmad-output/` contains generated planning and implementation artifacts. ([GitHub][2])

Your final structure will become approximately:

```text
my-project/
├── docs/
│   └── source/
│       ├── brs.md
│       └── architecture.md
│
├── _bmad/
│   ├── bmm/
│   └── ...
│
├── _bmad-output/
│   ├── planning-artifacts/
│   │   ├── prd.md
│   │   ├── architecture.md
│   │   └── epics.md
│   ├── implementation-artifacts/
│   │   ├── sprint-status.yaml
│   │   └── stories/
│   └── project-context.md
│
├── src/
└── tests/
```

The precise generated subdirectories can vary according to the installed BMAD version and configuration.

# 2. Convert the documents to Markdown when possible

BMAD and GitHub Copilot work better when the documents are plain Markdown rather than Word, PowerPoint, or PDF.

Preferred:

```text
docs/source/brs.md
docs/source/architecture.md
```

Acceptable:

```text
docs/source/brs.docx
docs/source/architecture.pdf
```

But Markdown is preferable because Copilot can follow sections, headings, links, requirement identifiers, and code blocks more reliably.

For the BRS, preserve requirement identifiers:

```markdown
# Business Requirements Specification

## Business objectives

## Scope

## Actors

## Functional requirements

### BRS-FR-001 — Create customer

The system shall allow...

### BRS-FR-002 — Approve customer

The system shall allow...

## Non-functional requirements

### BRS-NFR-001 — Availability

The service shall provide...

## Business rules

### BRS-BR-001 — Four-eyes approval

...
```

For the architecture:

```markdown
# Existing Solution Architecture

## Architecture overview

## System context

## Containers and components

## Technology stack

## Integration architecture

## Data architecture

## Security

## Deployment architecture

## Observability

## Architectural decisions

## Constraints

## Known gaps

## Diagrams
```

# 3. Install BMAD in the repository

Open a terminal in the repository root:

```bash
cd my-project
```

Check Node.js:

```bash
node --version
```

BMAD currently requires Node.js 20.12 or newer. The official installation command is: ([GitHub][2])

```bash
npx bmad-method install
```

During installation:

1. Select **BMad Method / BMM**.
2. Select **GitHub Copilot** as the AI tool.
3. Select your experience level.
4. Use the default `_bmad-output` output directory unless your repository requires something different.
5. Install the Test Architect module only when you want the extended testing workflows.

Use the normal stable version:

```bash
npx bmad-method install
```

Do not start with:

```bash
npx bmad-method@next install
```

The `@next` channel is the prerelease version and may change more frequently. ([GitHub][3])

After installation, commit the BMAD configuration:

```bash
git add _bmad .github
git commit -m "Install BMAD Method for GitHub Copilot"
```

Whether `_bmad-output` should be committed depends on your governance model. For a team project, I recommend committing the planning artifacts and story files so they can be reviewed in pull requests.

# 4. Open the repository in VS Code

Run:

```bash
code .
```

Open **GitHub Copilot Chat** and switch to **Agent mode**.

BMAD’s current workflow model uses named skills such as:

```text
bmad-help
bmad-prd
bmad-create-architecture
bmad-create-epics-and-stories
bmad-check-implementation-readiness
bmad-sprint-planning
bmad-create-story
bmad-dev-story
bmad-code-review
```

The official guidance says that you invoke the workflow by its `bmad-*` name; you do not normally need to load an agent separately. It also recommends starting a fresh Copilot chat for every major workflow to avoid context contamination. ([GitHub][2])

# 5. First Copilot command: verify the installation

Start a new Copilot chat and enter:

```text
bmad-help

I have an existing Business Requirements Specification at
docs/source/brs.md and an existing solution architecture at
docs/source/architecture.md.

There is no BMAD PRD yet. I want to use the full BMAD Method to validate the
requirements and architecture, generate epics and stories, check implementation
readiness, and then implement story by story.

Inspect the repository and tell me which workflow should run first.
Do not modify the source BRS or source architecture.
```

BMAD Help is designed to inspect what already exists and recommend the next workflow. ([BMAD Method][1])

The likely recommendation will be to run `bmad-prd`.

# 6. Create the BMAD PRD from your BRS

Your BRS is not automatically the BMAD PRD. A BRS is normally focused on business requirements, whereas the BMAD PRD organizes the product goals, users, scope, functional requirements, non-functional requirements, constraints, and delivery boundaries needed by the downstream architecture and story workflows.

Start a **fresh Copilot chat**.

Enter:

```text
bmad-prd

Intent: Create.

Use docs/source/brs.md as the authoritative business requirements source.

Also read docs/source/architecture.md to understand technical constraints,
existing architectural decisions and integration boundaries, but do not use the
architecture to invent or change business requirements.

Create the BMAD PRD from the existing BRS.

Requirements:

1. Preserve traceability to every BRS requirement identifier.
2. Do not silently omit any functional or non-functional requirement.
3. Do not modify docs/source/brs.md.
4. Clearly identify ambiguities, contradictions and missing acceptance criteria.
5. Separate confirmed requirements from assumptions.
6. Do not invent business rules.
7. Reference the original BRS requirement IDs in the resulting PRD.
8. Place generated BMAD artifacts in the configured _bmad-output directory.
9. Before finalizing, provide a coverage table mapping each BRS requirement
   to its corresponding PRD section.
```

BMAD’s current `bmad-prd` workflow supports three intents:

* `Create`
* `Update`
* `Validate`

Because your BRS has not yet been transformed into a BMAD PRD, use **Create**, not Update. The workflow generates a PRD and supporting artifacts. ([GitHub][2])

## What to review in the result

Before continuing, verify:

```text
BRS-FR-001 → PRD requirement
BRS-FR-002 → PRD requirement
BRS-NFR-001 → PRD non-functional requirement
BRS-BR-001 → PRD business rule or constraint
```

Also verify that BMAD did not:

* Add unsupported features.
* Turn assumptions into requirements.
* Remove difficult requirements.
* Change requirement intent.
* Mix architectural implementation choices into business requirements.

Commit the PRD after review:

```bash
git add _bmad-output
git commit -m "Create BMAD PRD from existing BRS"
```

# 7. Validate the generated PRD

Although optional, I strongly recommend a separate validation pass.

Start another fresh Copilot chat:

```text
bmad-prd

Intent: Validate.

Validate the BMAD PRD generated under _bmad-output against the authoritative
source document docs/source/brs.md.

Check:

1. Complete BRS-to-PRD traceability.
2. Missing functional requirements.
3. Missing non-functional requirements.
4. Requirements that were weakened or materially changed.
5. Unsupported assumptions.
6. Contradictory requirements.
7. Untestable requirements.
8. Missing actors, business rules or exceptional flows.
9. Scope inconsistencies.
10. Whether the PRD is ready for architecture reconciliation.

Do not edit docs/source/brs.md.
Produce the standard BMAD validation report.
```

Resolve important findings before moving to architecture.

# 8. Reconcile your existing architecture

Do not simply discard your existing architecture and ask BMAD to invent another one.

BMAD’s official established-project guidance says the architecture workflow should use the documented architecture and scan the existing codebase where applicable, to avoid conflicting with existing decisions or reinventing the system. ([BMAD Method][1])

Start a fresh Copilot chat:

```text
bmad-agent-architect
```

Then run:

```text
bmad-create-architecture

Use the following inputs:

- BMAD PRD under _bmad-output
- Existing authoritative architecture: docs/source/architecture.md
- Existing source code and repository structure, where present
- Existing diagrams under docs/diagrams, where present

This is architecture reconciliation, not a greenfield redesign.

Instructions:

1. Treat docs/source/architecture.md as the existing architecture baseline.
2. Validate whether it fully supports the BMAD PRD.
3. Preserve valid existing architectural decisions.
4. Do not replace established technologies without a documented reason.
5. Identify gaps between the PRD and the existing architecture.
6. Identify contradictions, risks and missing decisions.
7. Distinguish:
   - existing confirmed architecture;
   - proposed additions;
   - proposed changes;
   - assumptions requiring confirmation.
8. Preserve traceability from architectural decisions to PRD requirements.
9. Generate the BMAD architecture artifact under _bmad-output.
10. Do not modify docs/source/architecture.md.
11. Include a section called "Differences from source architecture".
12. Include a section called "Architecture decisions requiring approval".
```

BMAD normally creates architecture after the PRD, and its generated architecture becomes an input to the epics-and-stories workflow. ([GitHub][2])

## Important distinction

Keep both files:

```text
docs/source/architecture.md
_bmad-output/.../architecture.md
```

They have different purposes:

| Document                         | Purpose                                                      |
| -------------------------------- | ------------------------------------------------------------ |
| `docs/source/architecture.md`    | Your original authoritative input                            |
| BMAD-generated `architecture.md` | Implementation-oriented architecture reconciled with the PRD |

Once you approve the BMAD architecture, you can declare it the current implementation architecture. Until then, the source document remains the baseline.

Commit it:

```bash
git add _bmad-output
git commit -m "Reconcile BMAD architecture with existing design"
```

# 9. Generate project context

This is particularly useful with GitHub Copilot because it gives every implementation workflow concise coding rules.

Start a fresh chat:

```text
bmad-generate-project-context

Generate project-context.md using:

- The approved BMAD PRD
- The approved BMAD architecture
- docs/source/architecture.md
- The existing repository and source code

Include only implementation-critical rules such as:

- language and framework versions;
- repository structure;
- naming conventions;
- API conventions;
- database conventions;
- authentication and authorization rules;
- security constraints;
- logging and observability;
- testing expectations;
- error-handling rules;
- prohibited implementation approaches;
- required architectural boundaries.

Do not duplicate the entire PRD or architecture.
Do not invent conventions that are not supported by the documents or codebase.
```

BMAD supports `_bmad-output/project-context.md` specifically to hold technical preferences and implementation rules shared by downstream agents. ([GitHub][2])

# 10. Generate epics and stories

Start another fresh Copilot chat:

```text
bmad-create-epics-and-stories

Use the approved BMAD PRD, approved BMAD architecture and project-context.md.

Generate technically informed epics and user stories.

Requirements:

1. Preserve traceability to BRS and PRD requirement identifiers.
2. Each story must deliver a testable vertical increment.
3. Include functional and non-functional acceptance criteria.
4. Include security, observability and operational requirements where relevant.
5. Respect architectural component boundaries.
6. Identify dependencies between stories.
7. Do not create implementation stories unsupported by the PRD.
8. Do not combine unrelated capabilities into large stories.
9. Include explicit out-of-scope statements where ambiguity exists.
10. Produce the standard BMAD epics and stories artifacts.
```

BMAD now generates epics and stories **after architecture**, so story boundaries can reflect the API, database, UI, integration, and deployment decisions. ([GitHub][2])

# 11. Run the implementation-readiness check

This is the gate before coding.

Start a fresh chat:

```text
bmad-check-implementation-readiness

Validate cohesion and traceability across:

- docs/source/brs.md
- BMAD PRD
- docs/source/architecture.md
- BMAD architecture
- project-context.md
- generated epics and stories

Check specifically:

1. Every BRS requirement is covered.
2. Every PRD requirement has an implementation path.
3. Architecture supports all critical requirements.
4. Stories are consistent with architecture.
5. Non-functional requirements appear in architecture and stories.
6. Security and authorization requirements are actionable.
7. Data migration and integration requirements are covered.
8. Story dependencies are feasible.
9. Acceptance criteria are testable.
10. No major assumption is presented as an approved decision.

Do not implement code.
Produce the implementation-readiness assessment and list blocking findings first.
```

The official BMAD process highly recommends this check before beginning implementation. ([GitHub][2])

Do not start coding while it reports serious blockers.

# 12. Initialize sprint planning

After readiness is approved:

```text
bmad-sprint-planning

Initialize sprint tracking from the approved epics and stories.

Order stories according to:

1. architectural foundations;
2. technical dependencies;
3. end-to-end value;
4. risk reduction;
5. testability.

Do not assign multiple stories to active development simultaneously.
Produce the standard BMAD sprint-status artifact.
```

Review and commit:

```bash
git add _bmad-output
git commit -m "Initialize BMAD sprint plan"
```

# 13. Create one implementation-ready story

For each story, use a fresh chat.

```text
bmad-create-story

Create the next implementation-ready story from the sprint plan.

Use the approved PRD, architecture, project-context.md and relevant source code.

The story must contain:

- objective and business value;
- BRS and PRD traceability;
- scope and out-of-scope;
- acceptance criteria;
- architectural constraints;
- files or components likely to change;
- testing requirements;
- security requirements;
- observability requirements;
- dependencies;
- definition of done.

Do not implement the story yet.
```

Review the story before asking Copilot to implement it.

# 14. Implement the story

Create a dedicated Git branch:

```bash
git checkout -b feature/story-001-short-description
```

Start a fresh Copilot chat:

```text
bmad-dev-story

Implement the approved story that is currently marked ready for development.

Instructions:

1. Read the complete story.
2. Read project-context.md.
3. Read the relevant PRD and architecture sections.
4. Inspect the existing code before changing anything.
5. Follow the established repository patterns.
6. Implement only the approved story scope.
7. Add or update automated tests.
8. Run the relevant build, lint and test commands.
9. Do not silently alter architecture.
10. Record implementation notes and changed files in the story artifact.
11. Stop and report a blocker if the story conflicts with approved architecture
    or requirements.
```

Then inspect the code yourself and run the test suite.

# 15. Run BMAD code review

Use a new Copilot chat:

```text
bmad-code-review

Review the implementation of the current story against:

- its acceptance criteria;
- project-context.md;
- BMAD architecture;
- security requirements;
- existing code conventions;
- automated testing requirements.

Inspect the actual Git diff and repository files.

Focus on:

1. missing or incorrectly implemented acceptance criteria;
2. architectural violations;
3. security vulnerabilities;
4. missing authorization checks;
5. data integrity and transaction issues;
6. error handling;
7. logging and sensitive-data exposure;
8. insufficient tests;
9. regression risks;
10. unnecessary out-of-scope changes.

Do not approve based only on the developer notes.
Return findings ordered by severity, with file and line references.
```

After fixing findings:

```bash
git status
git diff
git add .
git commit -m "Implement story 001"
git push --set-upstream origin feature/story-001-short-description
```

Then create the pull request.

# Recommended complete sequence

For your situation, this is the workflow:

```text
Existing BRS
    ↓
bmad-prd — Create
    ↓
bmad-prd — Validate
    ↓
Existing architecture
    ↓
bmad-create-architecture — reconcile, not redesign
    ↓
bmad-generate-project-context
    ↓
bmad-create-epics-and-stories
    ↓
bmad-check-implementation-readiness
    ↓
bmad-sprint-planning
    ↓
bmad-create-story
    ↓
bmad-dev-story
    ↓
bmad-code-review
    ↓
Pull request
    ↓
Repeat for next story
```

# What you should not run

You probably do not need these at the beginning:

```text
bmad-brainstorming
bmad-forge-idea
bmad-product-brief
bmad-market-research
```

Those analysis workflows are optional. Since you already have a BRS, your first substantive workflow should normally be `bmad-prd`. BMAD identifies planning as required but treats brainstorming, research, and product-brief work as optional. ([GitHub][2])

# My strongest recommendation

Do not tell Copilot merely:

```text
Read my BRS and implement the application.
```

Use the controlled chain:

```text
BRS → validated PRD → reconciled architecture → epics → readiness check
→ individual story → implementation → review
```

Also keep these rules throughout:

```text
docs/source/* = immutable source inputs
_bmad-output/* = BMAD-derived artifacts
one fresh Copilot chat per workflow
one Git branch per story
human approval after PRD, architecture, readiness and code review
```

This gives you traceability from:

```text
BRS requirement
→ PRD requirement
→ architectural decision
→ epic
→ story
→ acceptance test
→ implementation
```

[1]: https://docs.bmad-method.org/how-to/established-projects/ "Established Projects | BMAD Method"
[2]: https://github.com/bmad-code-org/BMAD-METHOD/blob/main/docs/tutorials/getting-started.md "BMAD-METHOD/docs/tutorials/getting-started.md at main · bmad-code-org/BMAD-METHOD · GitHub"
[3]: https://github.com/bmad-code-org/bmad-method "GitHub - bmad-code-org/BMAD-METHOD: Breakthrough Method for Agile Ai Driven Development · GitHub"
