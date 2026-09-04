# Tests Evidence

Canonical runs use the Docker-volume pipeline documented in `docs/FINAL_AUDIT.md` §Reproducibility:
- volume `malbolge-canonical-work` (`/workspace/baseline` pinned `d5214e16`, `/workspace/patched` branch `malbolge-canonical`), shared gem bundle volume `malbolge-canonical-bundle`, DIND daemon `malbolge-canonical-dind`, runner image `malbolge-linguist-addgrammar`.
- Canonical `script/add-grammar` runs inside the patched worktree with `USER=root` (the script's `-u "$(id -u "$USER")"` needs a resolvable user) and the bundled grammar-compiler image.
- Raw canonical logs: `evidence/canonical/*.log` (baseline `rake_test.log`, patched `rake_test_final.log`, `environment.log`, `bundle_install.log`, `add_grammar.log`, `add_grammar_generated.diff`, `update_ids*.log`, `list_grammars.log`, `samples*.log`, `detection.log`, `breakdown_cli.log`, `apply_verify.log`).

## Results (2026-09-02, same Docker environment)

- Baseline `d5214e16`: `2034 runs, 39353 assertions, 2 failures, 1 error` (all CodeMirror, `vendor/CodeMirror` absent from fresh clone)
- Patched `1af6aef9`: `2036 runs, 39369 assertions, 2 failures, 1 error` (same 3 CodeMirror; **0 new failures**)

## Commands (canonical pipeline, run from the Docker volume)

```sh
# Inside runner image malbolge-linguist-addgrammar with the volumes attached:
cd /workspace/patched          # branch malbolge-canonical, base d5214e16, bundle satisfied
script/add-grammar https://github.com/DannyBaanks/malbolge-syntax   # exit 0
ruby script/update-ids          # exit 0
ruby script/list-grammars       # exit 0 (regenerates vendor/README.md)
bundle exec rake samples        # exit 0
bundle exec rake test           # 2036/2/1
# detection probes + breakdown, then git format-patch, then fresh-clone git apply verify
```

Legacy (non-canonical, superseded): host Windows checkout had CRLF + `core.autocrlf=true`; do not use for the final patch. `evidence/tests/*.log` (non-canonical) preserved for history only.
