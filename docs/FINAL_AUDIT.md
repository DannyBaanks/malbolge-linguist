# Final Audit — Malbolge Linguist (Re-audit 2026-09-02, canonical `script/add-grammar` integration)

Upstream: `github-linguist/linguist@d5214e1612c858ba14bf98edeca57e1683276f1d`
Research branch: `malbolge-linguist` (`ebcc105` → new)
Canonical patch commit (in Docker volume `malbolge-canonical-work`, `/workspace/patched`): `1af6aef9a93085cd878f16bbde19513d72055060` — built by running the upstream **canonical** `script/add-grammar https://github.com/DannyBaanks/malbolge-syntax` (exit 0) on branch `malbolge-canonical` from `d5214e16`, then `script/update-ids` (exit 0), `script/list-grammars` (exit 0), `bundle exec rake samples` (exit 0). No manual fabrication of `.gitmodules` / `grammars.yml` / `vendor/README.md` / license metadata — those all came from upstream tooling.
Grammar package: `https://github.com/DannyBaanks/malbolge-syntax` (`225f5acbb846dbc7d23b5c497f4487dfefb161ac`, MIT, `source.malbolge`) — published, `syntaxes/` layout fixed

## Verdicts — New Schema

```
TECHNICAL_IMPLEMENTATION_READY = TRUE
SAMPLE_READY = TRUE
GRAMMAR_PACKAGE_READY = TRUE
GRAMMAR_IN_FINAL_UPSTREAM_PATCH = TRUE
DETECTION_READY = TRUE
NO_NEW_FAILURES = TRUE
USAGE_GATE = NOT_DEMONSTRATED
POLICY_ELIGIBLE = FALSE
PR_READY = FALSE
PR_OPEN = FALSE
DISCUSSION_POSTED = TRUE
DISCUSSION_URL = https://github.com/github-linguist/linguist/discussions/8164
MAINTAINER_GUIDANCE = RECEIVED
SEMANTIC_ALTERNATIVE_PATH = REJECTED
USAGE_ASSESSMENT = PER_EXTENSION_OR_FILENAME
TECHNICAL_WORK = DONE
FINAL_STATE = BLOCKED_BY_USAGE_POLICY
```

Legacy mapping:
```
LANGUAGE_DEFINITION_READY = TRUE
SAMPLES_READY = TRUE
GRAMMAR_READY = TRUE (now split: PACKAGE_READY TRUE, IN_PATCH TRUE)
DETECTION_READY = TRUE
TESTS_PASS = FALSE (venial CodeMirror 2/1) → NO_NEW_FAILURES = TRUE (baseline 2/1 vs patched 2/1, 2034→2036 runs)
USAGE_GATE = NOT_DEMONSTRATED
PR_READY = FALSE
```

Values: TRUE | FALSE | NOT_DEMONSTRATED | BLOCKED

## 1. Sample — `SAMPLE_READY = TRUE`

Correction: `CONTRIBUTING.md:150-161` permits PR-authored MIT sample (not Hello World). No independent adoption required for sample.

Selected: `upstream/samples/Malbolge/truth_machine.malbolge` (from `MALPAD/evidence/m2_state/truth_machine.mal`)

| Field | Value |
| --- | --- |
| Size | 254 B, single line, Classic 59049 |
| SHA256 | `7062713e96dae33f5672fc4dcd654d5657e3c0ab44fd03bd93ebdd3ec43feb82` |
| Author | DannyBaanks |
| License | MIT — relicensed for Linguist (PR-authored-sample clause) |
| Why representative | `IN→branch→OUT→HALT/loop` Classic: `'0'`→halt 136 steps, `'1'`→loop; cross-verified `gost`+`oracle` |
| Execution | `MALPAD/evidence/m2_state/GATES.md`, `evidence/tests/fileblob.log` |

Rejected: quine 820 lines, Quijote placeholders, `hello_classic` (Hello World) — see `docs/MALBOLGE_ASSET_INVENTORY.md`.

## 2. Grammar — `GRAMMAR_PACKAGE_READY=TRUE`, `GRAMMAR_IN_FINAL_UPSTREAM_PATCH=TRUE`

`REUSE>ADAPT>CREATE`: 0 public grammars found. Package `https://github.com/DannyBaanks/malbolge-syntax` (`225f5acb`) is MIT, `source.malbolge`, `package.json`, `syntaxes/malbolge.tmLanguage.json`, `tests/sample.malbolge` + `validation.md`, conservative (no positional opcode mislabel).

Integration: **canonical `script/add-grammar https://github.com/DannyBaanks/malbolge-syntax`** now succeeds (exit 0, `OK! added grammar source 'vendor/grammars/malbolge-syntax'` / `new scope: source.malbolge`). It generated: `.gitmodules` entry, `grammars.yml` entry `vendor/grammars/malbolge-syntax: - source.malbolge`, submodule clone at `225f5acb`, license cache `vendor/licenses/git_submodule/malbolge-syntax.dep.yml`, and `vendor/README.md` regeneration (via `script/list-grammars`, exit 0 — the README-sync test `test_readme_file_is_in_sync` passes). `languages.yml` has `tm_scope: source.malbolge`. Reproducible patch exported: `evidence/patches/malbolge.patch` (from `d5214e16..1af6aef9`, SHA `DFDA0517F53F95209DEEC4D43A6E287EBDC20C846D14034BFEDFAB57BE4620E8`, `git apply` verified on a fresh `d5214e16` clone).

## 3. Language Definition — `TRUE`

Alphabetical Mako/Markdown:

```yaml
Malbolge:
  type: programming
  color: "#1D1A2F" # EVA-01
  extensions: [".malbolge"]
  tm_scope: source.malbolge
  ace_mode: text
  language_id: 1006177966 # SHA256("Malbolge")%(2**30-1) via script/update-ids
```

Committed on canonical patch commit `1af6aef9` (branch `malbolge-canonical` in Docker volume).

## 4. Detection — `DETECTION_READY = TRUE` (post-patch)

- Baseline (main, `d5214e16`): `FileBlob` → empty `language:`, `mime:text/plain` (`evidence/tests/fileblob.log`, `breakdown_repo2.log` empty)
- Patched (`1af6aef9`): `evidence/canonical/detection.log` → `FileBlob` `language=Malbolge`, `extname=.malbolge`, `mime=text/plain`, `size=254`; `Language["Malbolge"]` → `extensions=[".malbolge"] color=#1D1A2F id=1006177966 tm_scope=source.malbolge ace_mode=text`; end-to-end `github-linguist --breakdown` on a git repo containing only `truth_machine.malbolge` → `100.00% 254 Malbolge` / `Malbolge: truth_machine.malbolge` (`breakdown_cli.log`)

Heuristics: none for `.malbolge` (42 files, unambiguous). `.mal` not claimed (6096 contaminated).

## 5. Tests — `NO_NEW_FAILURES = TRUE` (canonical same-environment comparison)

Both runs in the same Docker runner image `malbolge-linguist-addgrammar` (ruby 3.4.10, bundler 2.6.9, Docker server 27.5.1, git 2.54.0; `evidence/canonical/environment.log`):

- **UPSTREAM_BASELINE** `rake_test.log` (clean `d5214e16` clone) — `2034 runs, 39353 assertions, 2 failures, 1 error` (all 3 are CodeMirror: `vendor/CodeMirror` absent from a fresh clone; unrelated to Malbolge)
- **PATCHED** `rake_test_final.log` (`1af6aef9`, `source.malbolge` + grammar) — `2036 runs, 39369 assertions, 2 failures, 1 error` (+2 runs Malbolge, +16 assertions, **0 new failures**; the same 3 CodeMirror failures only)

Raw logs: `evidence/canonical/rake_test.log` (baseline), `rake_test_final.log` (patched), `environment.log`, `bundle_install.log`.

## 6. Usage Gate — `NOT_DEMONSTRATED`

- `extension:malbolge NOT is:fork` = **42** (3 Malbolge) — `evidence/github_usage/results_summary.json`
- `extension:mal NOT is:fork` = **6096** contaminated — not claimed
- Rule `CONTRIBUTING.md:236-250` (2000/200) not met. No DannyBaanks repo counted; no mass creation; `CLAIM_SCOPE <= EVIDENCE_SCOPE`
- Prior PR #4609: 81k `.mb` → 2 Hello Worlds (see `docs/HISTORY_PR4609.md`)

Maintainer guidance received in Discussion #8164: usage must be supported per extension or filename being added. Therefore `POLICY_ELIGIBLE = FALSE` for the proposed `.malbolge` extension.

## 7. History — PR #4609

`docs/HISTORY_PR4609.md`: #4609 Add Malbolge (2019-08-14—17, @iczelia, closed not merged, `.mb`, GPLv3, no grammar). Blocker was usage, not technical. Lesson: do not repeat `notability=usage`.

## 8. Discussion - Guidance Received

Discussion #8164 asked whether semantically validated evidence across Malbolge's historically ambiguous extensions could inform eligibility for the proposed `.malbolge` extension.

Maintainer answer from `@lildude`: "Usage has to be supported per extension or filename being added." See https://github.com/github-linguist/linguist/discussions/8164#discussioncomment-18256725.

Status: `MAINTAINER_GUIDANCE = RECEIVED`; `SEMANTIC_ALTERNATIVE_PATH = REJECTED`; `USAGE_ASSESSMENT = PER_EXTENSION_OR_FILENAME`; `USAGE_GATE = NOT_DEMONSTRATED`; `POLICY_ELIGIBLE = FALSE`; `PR_READY = FALSE`; `PR_OPEN = FALSE`; `FINAL_STATE = BLOCKED_BY_USAGE_POLICY`.

## What Enters Final Patch

```
.gitmodules  # submodule vendor/grammars/malbolge-syntax -> DannyBaanks/malbolge-syntax (225f5acb)
grammars.yml  # vendor/grammars/malbolge-syntax: - source.malbolge
lib/linguist/languages.yml  # Malbolge, #1D1A2F, .malbolge, source.malbolge, 1006177966
samples/Malbolge/truth_machine.malbolge  # 254 B, SHA 70627..., MIT, mode 100644
vendor/README.md  # Malbolge: DannyBaanks/malbolge-syntax (via script/list-grammars)
vendor/grammars/malbolge-syntax  # submodule gitlink 225f5acb (mode 160000)
vendor/licenses/git_submodule/malbolge-syntax.dep.yml  # license cache (script/add-grammar)
```

Reproducible: `evidence/patches/malbolge.patch` (`d5214e16..1af6aef9`, SHA `DFDA0517F53F95209DEEC4D43A6E287EBDC20C846D14034BFEDFAB57BE4620E8`, `git apply` verified on a fresh `d5214e16` clone — `apply_verify.log`). Research docs stay outside patch.

## Next Steps (only policy remains — census demonstrated)

1. ~~Grammar publish~~ Done (`https://github.com/DannyBaanks/malbolge-syntax` `225f5acb`, `syntaxes/` layout, canonical `script/add-grammar` exit 0)
2. ~~Sample~~ Done (`SAMPLE_READY=TRUE`, `truth_machine.malbolge` `70627...`)
3. ~~ProjectMap census~~ Done (demo `evidence/census/corpus` 3 files: baseline `candidate 2 verified 1` → with `external.json` `verified 2 rejected 1`; extrapolating GitHub Search corpus `extension:malbolge` 42 + `extension:mal` 27 + `.mb` 2 → `VALID_MALBOLGE` ~71 even optimistically, `UNIQUE_REPOS` ~40-45 < 2000 → `USAGE_GATE=NOT_DEMONSTRATED` final, see `evidence/census/README.md`)
4. **Discussion #8164 resolved the policy question.** Usage must be demonstrated per extension or filename. No follow-up work is planned.

Final state: `TECHNICAL_WORK = DONE`; `FINAL_STATE = BLOCKED_BY_USAGE_POLICY`; no PR.

## Reproducibility

- Canonical pipeline (Docker volume `malbolge-canonical-work`, runner `malbolge-linguist-addgrammar`, DIND `malbolge-canonical-dind`): fresh clone `d5214e16` → branch `malbolge-canonical` → `bundle check` satisfied (volume `malbolge-canonical-bundle`) → `script/add-grammar` exit 0 → `script/update-ids` exit 0 → `script/list-grammars` exit 0 → `rake samples` exit 0 → `rake test` 2036/2/1 → detection probes → commit `1af6aef9` → `git format-patch` → fresh-clone `git apply` verify.
- `evidence/canonical/environment.log` (ruby 3.4.10, bundler 2.6.9, Docker server 27.5.1, git 2.54.0), upstream `d5214e16`, grammar `225f5acb`.
- Raw logs in `evidence/canonical/`: `add_grammar.log`, `add_grammar_generated.diff`, `update_ids*.log`, `list_grammars.log`, `samples*.log`, `rake_test.log` (baseline), `rake_test_final.log` (patched), `detection.log`, `breakdown_cli.log`, `apply_verify.log`, `bundle_install.log`.
- Patch: `evidence/patches/malbolge.patch` (hash `DFDA0517...`, `d5214e16..1af6aef9`).
- Canonical patch commit `1af6aef9` lives only in the Docker volume (not pushed); outer `malbolge-linguist` at new commit (not pushed per task).
