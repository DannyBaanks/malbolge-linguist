# Malbolge Asset Inventory

Inventory date: 2026-09-02 UTC. Source roots were inspected read-only under
`C:\Development\ISyCo Git` using the public genealogy provided by the owner.
An artifact is not eligible merely because it is present locally.

| Artifact | Source | License | SHA256 | Purpose | Eligible for Linguist sample | Notes |
| --- | --- | --- | --- | --- | --- | --- |
| Truth machine | `MALPAD/evidence/m2_state/truth_machine.mal` | NOT_DEMONSTRATED | Pending checksum manifest | Real input, branch, output, and halt/loop Classic specimen | NO | No redistribution license or public original URL demonstrated. |
| Baseline quine | `Autobolge/quine_research/baseline_quine.mal` | MIT repository license | Pending checksum manifest | Real quine corpus | NO | 820 lines; disproportionate for a Linguist sample and origin/provenance of the program itself is not demonstrated. |
| Quijote chapter 1-17 | `Malbolge-Translator/artifacts/quijote/**/*.mal` | MIT generator; public-domain output text documented | Pending checksum manifest | Non-tutorial, self-contained generated programs | NO | Artifact documentation contains placeholder hashes and a placeholder GitHub URL; public original artifact provenance is NOT_DEMONSTRATED. |
| `gatito` | `meowbolge/examples/gatito.malbolge` | NOT_DEMONSTRATED | Pending checksum manifest | Fixed-text generated specimen | NO | No license was verified in this audit. |
| Malbolge-Engine example | `Malbolge-Engine/examples/hello.malbolge` | MIT repository license | Pending checksum manifest | Interpreter smoke program | NO | Hello World is explicitly unsuitable as the primary Linguist sample. |
| Antivirusbolge corpus | `Antivirusbolge/corpus/**/*.mal` | NOT_DEMONSTRATED | Pending checksum manifest | Valid, malformed, stress, and generated classifier negatives | NO | Appropriate research fixtures, not upstream samples until individual provenance is established. |
| Walbolge | `Walbolge/` | MIT repository license | n/a | Trace/decompiler and positional opcode explanation | n/a | Useful to validate source-character versus effective-opcode distinction. |
| Autobolge | `Autobolge/` | MIT repository license | n/a | Quine corpus and structural search | n/a | Tooling, not a sample source by itself. |
| Malbolge-Translator | `Malbolge-Translator/` | MIT | n/a | Program generator and Quijote artifact | n/a | Artifact provenance needs repair before reuse upstream. |
| Malbolge-Engine | `Malbolge-Engine/` | MIT | n/a | Independent Classic C VM | n/a | Suitable for later execution validation. |
| MALDOOM | `MALDOOM/` | GPL-2.0 | n/a | Classic and Unshackled vendor corpus | NO | GPL-2.0 is not appropriate for relicensing into Linguist's MIT sample tree without a clear compatible source decision. |
| malbolge-lisp-forensics | `malbolge-lisp-forensics/` | MIT wrapper; upstream specimen terms not demonstrated | n/a | Large historical specimens | NO | Includes Unshackled material; no established sample provenance. |

## Grammar Search

Searches for `Malbolge extension:tmLanguage`, `Malbolge filename:*.sublime-syntax`,
rate limit was reached. No existing TextMate grammar is claimed. The local
candidate is therefore a new dependency requiring publication and independent
review before `script/add-grammar` can be used.
