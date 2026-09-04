# History — github-linguist/linguist PR #4609

## Summary

- **PR**: [#4609 Add Malbolge](https://github.com/github-linguist/linguist/pull/4609)
- **Author**: @iczelia
- **Created**: 2019-08-14T18:51:08Z
- **Closed**: 2019-08-17T11:29:59Z
- **State**: Closed, **not merged** (`merged: false`)
- **Extension proposed**: `.mb` (not `.mal`/`.malbolge`)
- **Samples license**: GPLv3 (PR description)
- **Grammar**: none claimed — “I didn't, because it doesn't apply” (PR checklist)

## What was argued

PR body claimed Malbolge is “really, really widely known” (later corrected to “known”, not “widely used”) and cited:
- TIO.run support
- 45 code-golf answers
- Wikipedia page
- Notability as “hardest language”

Author acknowledged: “well, yes, but technically there is no way to prove [hundreds of repos] — look below” and proposed `xlat1` character set as search proxy.

## Maintainer response (verbatim, truncated)

- @Alhadis: requested source for “widely used” claim; noted Malbolge’s renown is gimmick (“impossible to read or write”), distinct from in-use.
- On Brainfuck comparison: Brainfuck had **325 repositories** at the time and met usage criteria; Malbolge did not.
- Investigation of `.mb` (81,681 indexed at the time, 2019): harvest script collected 2,785, most binary, “assortment of random text formats”, **only two Malbolge files (both Hello World)**. Script: `Alhadis/Silos` + `Alhadis/Harvester`.
- Author conceded “That’s a derp moment. I meant ‘known’.” and “If this PR is not passing, please close it.” — then closed.

## Historical blocker

**Insufficient real-world usage** as observed across public repositories, per Linguist’s documented requirement (now `CONTRIBUTING.md:236-250`: 2000 files for common extension / 200 for once-per-repo). Notability (Wikipedia, TIO, golf) was explicitly ruled **not sufficient** — “we don’t determine eligibility based solely on notability.”

## Lessons for current proposal

- **Do not repeat** `notability = usage`. Current workspace does not claim “Malbolge is legendary therefore GitHub must add it.” It states `USAGE_GATE = NOT_DEMONSTRATED` honestly (see `evidence/github_usage/results_summary.json`: `.malbolge` 42 < 2000, `.mal` contaminated).
- **Do not manufacture usage**: no mass creation of files, no exploitation of `.mal` contamination, no counting of DannyBaanks-owned repos as independent adoption (`CLAIM_SCOPE <= EVIDENCE_SCOPE`).
- **Do not claim `.mb`**: current candidate is `.malbolge` only (unambiguous), not `.mb` (binary-heavy per 2019 audit).
- **Provide technical correctness** (grammar that does not mislabel positional opcodes, sample that is not Hello World, detection that is demonstrated post-patch) even though it cannot cure the usage gate.
- **Acknowledge precedent**: the 2019 closure is **not** a technical rejection of Malbolge’s implementation; it was a usage-threshold rejection that still applies. The current workspace preserves that distinction and does not ask maintainers to waive the threshold without an explicit alternative path.

## Sources

- `gh api repos/github-linguist/linguist/pulls/4609` (body, state, dates)
- `gh api repos/github-linguist/linguist/issues/4609/comments` (8 comments, 2019-08-14 to 2019-08-17)
- Harvest evidence: `Alhadis/Silos` (mb branch, `urls.log` 2785, `files/hello-world.mb`), `Alhadis/Harvester`

Prepared 2026-09-02, not posted as comment or PR.
