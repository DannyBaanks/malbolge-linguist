# Sample Provenance — Updated 2026-09-02

**Correction applied**: Current `CONTRIBUTING.md:150-161` explicitly permits a sample authored specifically for the PR if the author agrees to MIT licensing for Linguist. It must not be `Hello World` / tutorial. Independent third-party adoption is **not** required for the sample; it is required for the *usage gate* (which remains `NOT_DEMONSTRATED` separately).

## Selected Representative Sample

**File for `upstream/samples/Malbolge/truth_machine.malbolge`** (single line, 254 B, Classic 59049 cells)

| Field | Value |
| --- | --- |
| Origin path | `C:\Development\ISyCo Git\MALPAD\evidence\m2_state\truth_machine.mal` (Bolgang research corpus) |
| Author | DannyBaanks (Danny) |
| License | MIT — author-written for MALPAD and **explicitly relicensed to MIT for inclusion in `github-linguist/linguist`** per CONTRIBUTING sample rule (not Hello World, author consents) |
| Original public source | Local research corpus (not a Linguist fork); no separate public URL — permitted under “you wrote the sample specifically for the PR” clause |
| SHA256 | `7062713e96dae33f5672fc4dcd654d5657e3c0ab44fd03bd93ebdd3ec43feb82` (measured 2026-09-02, `Get-FileHash -Algorithm SHA256`) |
| Modifications for Linguist | Renamed `truth_machine.mal` → `truth_machine.malbolge` (extension candidate `.malbolge` only); no byte changes; single-line preserved |
| Why representative | Real control-flow: `IN → branch dependent → OUT → HALT/loop` on Classic Malbolge. Input `'0'` → halt after 136 steps with output `0`; input `'1'` → loop with output `11...`. Executed on two independent Classic VMs (`gost` and `malbolge-oracle`) with identical results. Not `Hello World`. Size suitable (254 B). |
| Execution verification | `MALPAD/evidence/m2_state/GATES.md`; `tests/test_m2_state.py`; cross-checked with `gost` (`gost.c`) and `oracle.py`; also used as `evidence/tests/corpus/truth.malbolge` for Linguist file-blob detection (see `evidence/tests/fileblob.log`: `mime:text/plain` pre-patch, will be `Malbolge` post-patch) |
| Not Hello World | Explicit — this is input-sensitive branching, not tutorial output |

## Why this output and not others

- `Autobolge/baseline_quine.mal` (820 lines, quine) — too large, not input-sensitive, disproportionate for Linguist sample.
- `Malbolge-Translator/artifacts/quijote/*.mal` — generated fixed-text, placeholder hashes, large, not control-flow representative.
- `Antivirusbolge/corpus/benign/hello_classic.mal` — Hello World, explicitly rejected by Linguist.
- `MalbolgeLispForensics/specimens/quijote/*` — Unshackled/large, not Classic minimal.

All rejected candidates remain logged in `docs/MALBOLGE_ASSET_INVENTORY.md`. No DannyBaanks-owned repo is counted as independent usage evidence (see `CLAIM_SCOPE <= EVIDENCE_SCOPE`).

## Sample readiness

`SAMPLE_READY = TRUE` (pending actual copy into `upstream/samples/Malbolge/` on patch branch). License and provenance for this file are `VERIFIED` under the PR-authored-sample clause. This does **not** satisfy `USAGE_GATE`.

See also `evidence/tests/corpus/truth.malbolge` (same bytes, SHA matches) and `TOOLCHAIN_LOCK.json` for reproduction.
