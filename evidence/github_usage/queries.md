# GitHub Usage Queries

Captured 2026-09-02 UTC through authenticated GitHub REST Code Search using
`gh api`. Searches exclude forks. GitHub API rate limiting began after the
captured requests; this is recorded rather than retried as a different claim.

| Candidate | Query | Observable indexed count | Interpretation |
| --- | --- | ---: | --- |
| `.mal` | `extension:mal NOT is:fork` | 6096 | Exceeds raw count but is materially contaminated by unrelated formats. |
| `.malbolge` | `extension:malbolge NOT is:fork` | 42 | Below Linguist's 2,000-file common-extension threshold. |
| `.mal` with term | `extension:mal NOT is:fork Malbolge` | 27 | Below 2,000 and includes many tutorial/duplicate results. |
| `.malbolge` with term | `extension:malbolge NOT is:fork Malbolge` | 3 | Below 2,000. |

Reproducible GitHub web searches:

- https://github.com/search?type=code&q=extension%3Amal+NOT+is%3Afork
- https://github.com/search?type=code&q=extension%3Amalbolge+NOT+is%3Afork
- https://github.com/search?type=code&q=extension%3Amal+NOT+is%3Afork+Malbolge
- https://github.com/search?type=code&q=extension%3Amalbolge+NOT+is%3Afork+Malbolge

The current Linguist rule measures files indexed in the last year. GitHub's API
response used here did not establish that time window separately, so even a raw
count above 2,000 would require a fresh web-search verification before a PR.
