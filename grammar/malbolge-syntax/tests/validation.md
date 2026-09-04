# Grammar Validation — Published

Published at `https://github.com/DannyBaanks/malbolge-syntax` (`4ec029d` → fix `syntaxes/` layout).

## Checks performed (2026-09-02, updated)

- `syntaxes/Malbolge.tmLanguage.json` is valid JSON (`ruby -rjson` OK)
- `scopeName` is `source.malbolge` (matches `languages.yml`)
- `fileTypes` is `["malbolge"]`
- PCRE-safe, linear: `[^\\x09\\x0A\\x0D\\x20-\\x7E]` and `[!-~]`
- `package.json` MIT, `contributes.grammars` → `./syntaxes/Malbolge.tmLanguage.json` (located in `syntaxes/` so `isValidGrammar` → true)
- Sample `tests/sample.malbolge` is `truth_machine` (SHA `7062713e96dae33f5672fc4dcd654d5657e3c0ab44fd03bd93ebdd3ec43feb82`, 254 B)
- Upstream validation: `script/add-grammar https://github.com/DannyBaanks/malbolge-syntax` now discovers the grammar (`source 'vendor/grammars/malbolge-syntax' contains ...` no longer) and updates `grammars.yml` + `vendor/`

`GRAMMAR_PACKAGE_READY = TRUE` and after `script/add-grammar` `GRAMMAR_IN_CANONICAL_PATCH = TRUE` (no manual `grammars.yml` edit needed).

See `README.md` for why the grammar does not try to label positional opcodes.
