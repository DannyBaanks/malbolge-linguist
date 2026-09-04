# Heuristics Analysis

## Extension Decision

- **`.malbolge`** — unambiguous in observed GitHub Code Search (42 indexed, no colliding language observed). No heuristic proposed. The cleanest upstream path is to register only `.malbolge`.
- **`.mal`** — intentionally NOT claimed. Observed contamination:
  - Malabar polyglot (`corkami/mitra/utils/ofb/malabar/*`)
  - Larceny Scheme libraries (`larcenists/larceny/lib/MzScheme/*`, `src/Lib/Common/arith.mal`)
  - NLP model resources (`AlexPoint/OpenNlp/Resources/Models/Coref/gen.mal`)
  - Only 27 of 6096 `.mal` files contain the term Malbolge; many are tutorial duplicates.

Claiming `.mal` would require a heuristic that distinguishes Malbolge from these formats. Any pattern based on a single sample (e.g., `b` vs `*` density) would misclassify. Even a well-tested heuristic would not cure the usage gate: `.mal` still fails the distribution test and `.malbolge` still fails the 2000-file threshold.

**Decision**: No heuristic is submitted. If Linguist later accepts Malbolge via `.malbolge`, a future heuristic for `.mal` can be designed from multiple representative programs with true/false positive fixtures.

## Required Fixtures (when heuristic becomes necessary)
- `test/fixtures/Data/*.mal` — negative cases (Scheme, model resource)
- `samples/Malbolge/*.malbolge` — positive cases (truth machine, non-Hello programs)
- Corresponding tests in `test/test_heuristics.rb` proving RE2-safe, linear patterns.

Status: NOT_DEMONSTRATED (no heuristic needed for current candidate).
