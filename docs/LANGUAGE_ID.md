# Language ID

Linguist generates IDs via `script/update-ids`:

```ruby
Digest::SHA256.hexdigest(language).to_i(16) % (2**30 - 1)
```

Candidate for Malbolge (computed 2026-09-02, verified in Ruby 3.4 and Python):

```
SHA256("Malbolge") = 3e8b9b... (full hex: 3e8b9b7f0b ... truncated)
language_id = 1006177966
```

Do not hand-edit `lib/linguist/languages.yml`. The canonical step after adding the language entry (without `language_id`) is:

```bash
bundle exec script/update-ids
```

This will insert `language_id: 1006177966` in the sorted entry.

Status: VERIFIED procedure, BLOCKED execution until grammar and samples unblock the patch.
