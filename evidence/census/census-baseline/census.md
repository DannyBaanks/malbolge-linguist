# Census: corpus

Total files scanned: **3**
- Candidate files (ambiguous): 2
- Verified files: 1
- Inconclusive: 2
- Rejected false positives: 0

## By extension

| Extension | Files |
|---|---|
| .mal | 2 |
| .malbolge | 1 |

## By language assessment

| Language | Files | By confidence |
|---|---|---|
| malbolge | 3 | inferred:2, verified:1 |

## Notes

- ProjectMap can recognize/report Malbolge; GitHub Linguist support = unsupported_by_linguist
- Census is evidence collection, NOT proof of Linguist eligibility
- MANY_FILES_OWNED_BY_ONE_USER != WIDESPREAD_ADOPTION

## Per-file (sample)

| Path | Ext | Candidates | Language | Confidence | SHA256 | Reason |
|---|---|---|---|---|---|---|
| arith.mal | .mal | malbolge | malbolge | inferred | 77ec57ff1674 | ambiguous extension .mal -> malbolge (candidate, not verified); sin rol detectab |
| truth.mal | .mal | malbolge | malbolge | inferred | 7062713e96da | ambiguous extension .mal -> malbolge (candidate, not verified); sin rol detectab |
| truth.malbolge | .malbolge | malbolge | malbolge | verified | 7062713e96da | extension .malbolge -> malbolge; sin rol detectable; archivo en raíz -> misc |