#!/bin/sh
set -eu
cd /workspace/upstream
bundle check || bundle install
echo "=== PATCHED FILEBLOB (should be Malbolge) ==="
bundle exec ruby -Ilib -e "require 'linguist'; b=Linguist::FileBlob.new('samples/Malbolge/truth_machine.malbolge'); abort 'FileBlob mismatch' unless b.language.name == 'Malbolge'; puts 'language:'+b.language.to_s; puts 'name:'+b.name; puts 'ext:'+File.extname(b.name); puts 'mime:'+b.mime_type.to_s; puts 'size:'+b.size.to_s" > /workspace/evidence/tests/patched_fileblob.log 2>&1
cat /workspace/evidence/tests/patched_fileblob.log
echo "EXIT:0" | tee -a /workspace/evidence/tests/patched_fileblob.log
echo "=== PATCHED LANGUAGE LOOKUP ==="
bundle exec ruby -Ilib -e "require 'linguist'; l=Linguist::Language['Malbolge']; abort 'Language mismatch' unless l.extensions == ['.malbolge'] && l.color == '#1D1A2F' && l.tm_scope == 'source.malbolge'; puts l.inspect; puts 'ext:'+l.extensions.inspect; puts 'color:'+l.color; puts 'id:'+l.language_id.to_s; puts 'tm_scope:'+l.tm_scope" > /workspace/evidence/tests/patched_language.log 2>&1
cat /workspace/evidence/tests/patched_language.log
echo "EXIT:0" | tee -a /workspace/evidence/tests/patched_language.log
echo "=== REPO BREAKDOWN PATCHED ==="
mkdir -p /tmp/mal_patch_test
rm -rf /tmp/mal_patch_test/.git
cp /workspace/upstream/samples/Malbolge/truth_machine.malbolge /tmp/mal_patch_test/
cd /tmp/mal_patch_test
git init -q
git config user.email 'test@test'
git config user.name 'test'
git add .
git commit -qm init
BUNDLE_GEMFILE=/workspace/upstream/Gemfile bundle exec ruby /workspace/upstream/bin/github-linguist --breakdown > /workspace/evidence/tests/patched_breakdown.log 2>&1
cat /workspace/evidence/tests/patched_breakdown.log
echo "EXIT:0" | tee -a /workspace/evidence/tests/patched_breakdown.log
cat /workspace/evidence/tests/patched_fileblob.log
echo "---"
cat /workspace/evidence/tests/patched_language.log
echo "---"
cat /workspace/evidence/tests/patched_breakdown.log
