# malbolge-syntax — TextMate grammar for Malbolge

MIT-licensed TextMate grammar for [Malbolge](https://esolangs.org/wiki/Malbolge), published for `github-linguist/linguist`.

- **Scope**: `source.malbolge`
- **File**: `syntaxes/Malbolge.tmLanguage.json`
- **Version**: 0.1.0
- **License**: MIT
- **Published**: `https://github.com/DannyBaanks/malbolge-syntax` at `4ec029d` (initial) → fix `syntaxes/` layout (this commit)

## Scope

`source.malbolge` recognizes printable ASCII source characters and marks other non-whitespace bytes as invalid. It intentionally does **not** label individual source characters as `i`, `o`, `*`, `p`, `/`, `<`, `v`, or `j` instructions.

In Malbolge, a printable source character is normalized relative to its position after whitespace removal. The effective opcode is calculated from that position, and later self-encryption changes the runtime instruction again. TextMate regular expressions do not maintain the required modulo-94 positional state. Highlighting a character as an opcode based on its glyph would make a false semantic claim. The grammar highlights valid source uniformly instead of mislabeling arbitrary bytes as instructions.

## Installation (VS Code)

This grammar is consumed via `github-linguist/linguist` (`grammars.yml` → `vendor/grammars/malbolge-syntax`). For local VS Code use, copy `syntaxes/Malbolge.tmLanguage.json` and reference it via `package.json` `contributes.grammars`.

## Validation

- `syntaxes/Malbolge.tmLanguage.json` is valid JSON (`ruby -rjson` OK), `scopeName` `source.malbolge`, `fileTypes` `["malbolge"]`
- PCRE-safe, linear patterns: `[^\\x09\\x0A\\x0D\\x20-\\x7E]` and `[!-~]`
- Locates in `syntaxes/` so `github-linguist` `grammar-compiler` discovers it (`isValidGrammar` requires `.../syntaxes/*.json` or `.../grammars/*.json`)
- Sample `tests/sample.malbolge` is the `truth_machine` (SHA `7062713e96dae33f5672fc4dcd654d5657e3c0ab44fd03bd93ebdd3ec43feb82`, 254 B)
- Tested via `script/add-grammar https://github.com/DannyBaanks/malbolge-syntax` from clean `linguist` checkout (see `DannyBaanks/malbolge-linguist` `evidence/patches/malbolge.patch`)

## Upstream

Used by `DannyBaanks/malbolge-linguist` `malbolge-patch` (`grammars.yml` `vendor/grammars/malbolge-syntax: - source.malbolge`, `languages.yml` `tm_scope: source.malbolge`).

## License

MIT — see `LICENSE`.
