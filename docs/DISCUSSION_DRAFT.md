# Discussion Draft (Posted 2026-09-02)

> STATUS = POSTED
> Discussion #8164
> https://github.com/github-linguist/linguist/discussions/8164
> MAINTAINER_GUIDANCE = RECEIVED
> SEMANTIC_ALTERNATIVE_PATH = REJECTED
> USAGE_ASSESSMENT = PER_EXTENSION_OR_FILENAME
> FINAL_STATE = BLOCKED_BY_USAGE_POLICY
>
> Maintainer answer: "Usage has to be supported per extension or filename
> being added." https://github.com/github-linguist/linguist/discussions/8164#discussioncomment-18256725
>
> The text below is the original draft preserved for provenance. The published
> Discussion uses the same policy question and links to the public canonical
> evidence branch.

**Title**: Does the 2,000-file rule admit any alternative evidence path for Malbolge?

**Body** (concise, maintainer-compatible — updated per re-audit, not reopening 2019 notability argument):

> Hi maintainers — question about `CONTRIBUTING.md:236-250` (“Language extension and filename usage requirements”: 2000 files for common extensions, 200 for once-per-repo, last year, forks excluded) and `CONTRIBUTING.md:249-250` (“This method of assessment is reviewed periodically to see if a better method becomes available. If you have a better approach, please open a new [discussion].”).
>
> We have a technically complete Malbolge candidate (`.malbolge` only, unambiguous; `source.malbolge` grammar MIT, conservative/opcode-safe, integrated via canonical `script/add-grammar` exit 0; representative non-Hello sample `truth_machine.malbolge` 254 B, MIT, execution-verified; `languages.yml` + `update-ids` + detection `FileBlob` → `Malbolge` post-patch, `NO_NEW_FAILURES`, baseline 2034/2/1 vs patched 2036/2/1 in the same environment). Workspace: `DannyBaanks/malbolge-linguist` branch `malbolge-linguist` (patch `evidence/patches/malbolge.patch` `d5214e16..1af6aef9` SHA `DFDA0517...`, grammar `https://github.com/DannyBaanks/malbolge-syntax`).
>
> Honest usage on proposed extension (2026-09-02, `NOT is:fork`, Code Search):
> - `extension:malbolge NOT is:fork` = 42 (3 with term Malbolge)
> - `extension:mal NOT is:fork` = 6096 but heavily contaminated (Malabar, Scheme, model; 27 Malbolge) — not claimed
> - Prior PR #4609 (2019, `.mb`, closed not merged): 81k `.mb` → 2 Hello Worlds (`Alhadis/Silos`) — same blocker, notability (Wikipedia/TIO) was ruled not sufficient and we do **not** repeat it.
>
> Question: **Does Linguist’s usage assessment allow semantically validated evidence across Malbolge’s historically ambiguous extensions, rather than relying only on the proposed `.malbolge` extension?**
>
> We are building a reproducible corpus that separates actual Malbolge from false positives (via execution/grammar validation) and reports distribution by `repo`/`owner` (unique `user/repo`, deduplicated, no owner-controlled repos counted, no mass creation, no `.mal` contamination exploitation). **Would such a corpus be relevant to eligibility assessment, or is the 2,000-file threshold strictly per proposed extension?**
>
> We will not open a PR until you confirm. No PR is being opened here. If the threshold is strictly per-extension, we will keep `USAGE_GATE=NOT_DEMONSTRATED` and `POLICY_ELIGIBLE=FALSE` cleanly.

**Original draft status (historical):** Draft only. Do not post to `github-linguist/linguist` Discussions without explicit authorization. The current status is the posted header above; `USAGE_GATE = NOT_DEMONSTRATED` and `POLICY_ELIGIBLE = FALSE` remain unchanged until maintainer guidance.

**References**: `evidence/github_usage/results_summary.json`, `docs/HISTORY_PR4609.md`, `CONTRIBUTING.md:236-250`.
