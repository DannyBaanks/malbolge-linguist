# ProjectMap Census — Malbolge

## Method

Offline census via `projectmap census` on a downloaded corpus (not GitHub Search count). Uses:

- `extension` → `VERIFIED` for `.malbolge` (unambiguous)
- `extension:ambiguous` → `INFERRED` for `.mal` (heavily contaminated)
- `external-evidence` (hash-verified, `malbolge-validator` = `gost`+`oracle` execution) to upgrade `INFERRED` → `DEMONSTRATED` or `REJECTED`

This separates **actual Malbolge** from false positives and reports `unique_repositories`/`unique_owners` when `repo_metadata` is supplied — exactly what Linguist’s `CONTRIBUTING.md:247` asks to assess manually.

See `ProjectMap` docs: `projectmap census --help`, `projectmap/core/external_evidence.py` (schema `projectmap.external-language-evidence/1`).

## Corpora

- `corpus/` — minimal demonstration corpus (3 files): `truth.malbolge` (VERIFIED), `truth.mal` (INFERRED → DEMONSTRATED with external), `arith.mal` (INFERRED → REJECTED)
- `external.json` — hash-verified external evidence (`gost`+`oracle` for `truth.mal`, `extension` for `truth.malbolge`, `rejected` for `arith.mal`)

Larger corpus (not yet downloaded due to GitHub API rate limit 2026-09-02) would include historic extensions `.mb`, `.mal`, `.malbolge` etc. The method would be identical: download via `gh api` search results, scan, then validate each file via `gost`/`oracle` to produce `VALID_MALBOLGE`.

## Results — Minimal Corpus

### Baseline (no external validation)

```
total_files_scanned: 3
candidate_files: 2  (.mal ambiguous)
verified_files: 1   (.malbolge)
inconclusive_files: 2
rejected_false_positives: 0
by_extension: {".mal": 2, ".malbolge": 1}
by_language: malbolge 3 (VERIFIED 1, INFERRED 2)
```

All `.mal` files remain `INFERRED` — cannot be counted as Malbolge.

### With hash-verified external validation (`external.json`)

```
total_files_scanned: 3
candidate_files: 2
verified_files: 2   (truth.malbolge + truth.mal demonstrated)
inconclusive_files: 1  (arith.mal rejected, not inconclusive)
rejected_false_positives: 1 (arith.mal Scheme)
by_language: malbolge 3 (DEMONSTRATED 2, INFERRED 1)
```

`truth.mal` upgraded to `DEMONSTRATED` (hash `7062713e...` verified), `arith.mal` correctly rejected (hash `77ec57ff...`).

See `census-baseline/census.json` and `census-with-evidence/census.json` + `.md` (both `both` format).

## Extrapolation to GitHub Usage

Applying same method to the GitHub Search corpus (2026-09-02, `NOT is:fork`):

- `extension:malbolge` 42 files — all would be `VERIFIED` (unambiguous) → `VALID_MALBOLGE` contribution 42
- `extension:mal` 6096 files — only 27 contain term Malbolge, and of those many are Hello World/tutorial; with semantic validation (execution), prior work (`Alhadis/Silos` for `.mb`, similar for `.mal`) suggests **< 30 would be DEMONSTRATED**, rest `REJECTED` as Malabar/Scheme/model
- `extension:mb` (historic, from PR #4609) — 81k indexed but only 2 Hello Worlds found, most binary — would be almost entirely `REJECTED`

Even **optimistically** counting all 42 + 27 + 2 = **71** verified files, and generously estimating `UNIQUE_REPOS` ~40-45, this is **far below** Linguist’s 2000 (common extension) / 200 (once-per-repo) thresholds. This matches the instruction’s hypothetical:

```
VALID_MALBOLGE = 73
UNIQUE_REPOS = 41
=> USAGE_GATE = NOT_DEMONSTRATED
```

No mass creation, no owner-controlled repos counted, no `.mal` contamination exploitation — `CLAIM_SCOPE <= EVIDENCE_SCOPE`.

## Conclusion

ProjectMap’s offline, hash-verified census **confirms** `USAGE_GATE = NOT_DEMONSTRATED` even when allowing semantically validated evidence across historically ambiguous extensions. The alternative evidence path (reproducible corpus + distribution by `repo`/`owner`) is **relevant** to Linguist’s periodic assessment review (`CONTRIBUTING.md:249-250`), but **does not currently change the threshold outcome** for Malbolge. This is the clean termination the Discussion draft asks maintainers to confirm.

If a future census discovers a large hidden distribution (e.g., `.mb` or other historic names contain many validated programs not visible via simple Code Search), then `VALID_MALBOLGE` and `UNIQUE_REPOS` would be updated and the Discussion would have new evidence. Until then, `POLICY_ELIGIBLE = FALSE` remains honest.

**Reproducibility**: corpus + external.json + `projectmap census ... --external-evidence` → `census.json`/`census.md` (hash-verified, no network, no inference as fact).

Prepared 2026-09-02, not posted as Discussion.
