#!/bin/sh
set -e
apk add --no-cache build-base cmake git icu-dev zlib-dev openssl-dev linux-headers > /dev/null 2>&1 || true
sed -i 's/\r$//' /workspace/upstream/bin/* 2>/dev/null || true
cd /workspace/upstream
bundle install > /dev/null 2>&1 || true
echo '===FILEBLOB==='
bundle exec ruby -Ilib -e "require 'linguist'; b=Linguist::FileBlob.new('/workspace/evidence/tests/corpus/truth.malbolge'); puts 'language:'+b.language.to_s; puts 'name:'+b.name; puts 'mime:'+b.mime_type.to_s; puts 'size:'+b.size.to_s; puts 'binary:'+b.binary?.to_s; puts 'text:'+b.text?.to_s" 2>&1 | tee /workspace/evidence/tests/fileblob.log
echo EXIT:$? | tee -a /workspace/evidence/tests/fileblob.log
echo '===REPO BREAKDOWN==='
mkdir -p /tmp/mal_test
rm -rf /tmp/mal_test/.git
cp /workspace/evidence/tests/corpus/truth.malbolge /tmp/mal_test/
cd /tmp/mal_test
git init -q
git config user.email 'test@test'
git config user.name 'test'
git add .
git commit -qm init
BUNDLE_GEMFILE=/workspace/upstream/Gemfile bundle exec /workspace/upstream/bin/github-linguist --breakdown 2>&1 | tee /workspace/evidence/tests/breakdown_repo2.log
echo EXIT:$? | tee -a /workspace/evidence/tests/breakdown_repo2.log
cat /workspace/evidence/tests/fileblob.log
echo '---'
cat /workspace/evidence/tests/breakdown_repo2.log
