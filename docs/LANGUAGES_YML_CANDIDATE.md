# languages.yml Candidate

Alphabetical insertion point: between `Mako` and `Markdown` (per `lib/linguist/languages.yml` header: keep alphabetized, uppercase before lowercase).

```yaml
Malbolge:
  type: programming
  color: "#1D1A2F"
  extensions:
  - ".malbolge"
  tm_scope: source.malbolge
  ace_mode: text
  language_id: 1006177966
```

Fields match current `languages.yml:3-15` required set. `ace_mode: text` because no Ace mode exists for Malbolge (gh.io/acemodes). `tm_scope` matches local grammar `source.malbolge`; it must be added via `script/add-grammar` before this entry lands or `tm_scope: none` would be required temporarily.

Do not commit to `upstream/` until grammar is published and samples are eligible.
