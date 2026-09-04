# Linguist Requirements Audit

Audit date: 2026-09-02 UTC

Upstream inspected: `github-linguist/linguist` commit `d5214e1612c858ba14bf98edeca57e1683276f1d`.

Primary source: `upstream/CONTRIBUTING.md`, read in full before this workspace
was changed. The current PR template was also inspected at
`upstream/.github/PULL_REQUEST_TEMPLATE.md`.

| Requirement | Current upstream rule | Planned compliance | Evidence | Status |
| --- | --- | --- | --- | --- |
| Language definition | Add a sorted `languages.yml` entry; omit `language_id` initially. Required fields include `type`, `ace_mode`, `extensions` or `filenames`, `tm_scope`, and generated `language_id`. | Candidate: programming language, `source.malbolge`, `.malbolge` only; `.mal` is excluded because it is heavily contaminated. | `CONTRIBUTING.md:134-137`; `languages.yml:3-15`. | VERIFIED |
| Syntax grammar | Add through `script/add-grammar <HTTPS URL>`; grammar must be TextMate compatible and have an allowed license. | Local MIT candidate grammar is prepared separately. It cannot be added until it has a public HTTPS upstream repository. | `CONTRIBUTING.md:138-149`; `script/add-grammar`; allowed-license list. | BLOCKED |
| Samples | Samples must be real-world/common usage; tutorial Hello World is explicitly rejected. State each sample's license and original source. | Do not add a sample until its original public URL and redistribution license are demonstrated. | `CONTRIBUTING.md:150-161`. | BLOCKED |
| Language ID | Run `script/update-ids`; never choose it by hand. | Run only after a valid entry can enter the upstream patch. | `CONTRIBUTING.md:157`; `script/update-ids`. | VERIFIED |
| Extension usage | Common extensions need 2,000 public non-fork files indexed in the last year; one-per-repository names need 200. Results must be reasonably distributed across user/repository pairs. | Audit `.mal` and `.malbolge` with GitHub Code Search. | `CONTRIBUTING.md:236-250`; captured results. | VERIFIED |
| Shared extension | If an extension is already assigned, add two samples for each language and consider a heuristic. | Neither candidate is assigned today, but `.mal` has unrelated content and is rejected rather than claimed. | `CONTRIBUTING.md:166-171`; `languages.yml` search. | VERIFIED |
| Heuristics | Add only when necessary; repository contract requires RE2-safe patterns and tests. | No heuristic is proposed for `.malbolge`; it is unambiguous in observed results. A `.mal` heuristic is intentionally not proposed because it would not cure the adoption gate or broad contamination. | `upstream/AGENTS.md`; usage audit. | VERIFIED |
| Color | New-language template strongly recommends a color and rationale. Community consensus is explicitly required only for changing an existing language's color. | Candidate `#1D1A2F`, EVA-01 deep purple; see `COLOR_RATIONALE.md`. | PR template:30-34,55-58; `CONTRIBUTING.md:226-234`. | VERIFIED |
| Tests | Run `bundle exec rake test`; classifier test is `bundle exec script/cross-validation --test`. | Run bootstrap and all feasible checks; record raw logs and failures. | `CONTRIBUTING.md:252-268`. | NOT_DEMONSTRATED |
| PR template | Template must be used and filled in; incomplete templates are not reviewed. | `PR_DRAFT.md` mirrors the current template and truthfully leaves blocked boxes unchecked. | `CONTRIBUTING.md:163-164`; PR template. | VERIFIED |

## Decision

The upstream patch must not be created yet. The current evidence does not meet
the usage gate, there is no reusable maintained public TextMate grammar, and no
eligible representative sample has been demonstrated. These are upstream
review requirements, not implementation defects.
