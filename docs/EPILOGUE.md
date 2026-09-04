# Epilogue - See You at the Threshold

The Malbolge Linguist effort did not end because the implementation failed.

The canonical integration was completed and reproduced successfully:

- syntax grammar integrated through Linguist's official `script/add-grammar` workflow
- language definition generated
- representative non-Hello-World sample included
- Malbolge detection demonstrated
- baseline and patched test runs showed no new failures
- reproducible patch and raw evidence preserved

The remaining blocker is external to the implementation.

In Discussion #8164, a Linguist maintainer clarified that usage must be
demonstrated for the specific extension or filename being added.

```text
TECHNICAL_IMPLEMENTATION = COMPLETE
UPSTREAM_POLICY_GUIDANCE = RECEIVED
BLOCKER = REAL_WORLD_USAGE_OF_.malbolge
PR = ON_HOLD
```

This repository is intentionally frozen until organic public usage of
`.malbolge` satisfies the documented Linguist requirement. No artificial
repositories, generated adoption, or inflated usage counts will be used.

When that condition changes, the intended path is:

```text
real independent adoption
-> usage threshold satisfied
-> rebase canonical patch onto current Linguist
-> rerun canonical validation
-> open PR
```

This is not a defeated implementation. It is a completed implementation
waiting for the world to catch up.

The canonical usage evidence records 42 indexed `.malbolge` files against the
documented 2,000-file common-extension threshold. The remaining documented gap
is therefore 1,958 files.

Malbolge will return when the usage evidence does.

> See you in 1,958 files, hijos de perra. :p
