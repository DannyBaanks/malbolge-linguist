#!/bin/sh
set -eu
cd /workspace/upstream
# normalize line endings for this run (Windows autocrlf)
sed -i 's/\r$//' bin/* script/* 2>/dev/null || true
bundle check || bundle install
echo "=== PATCHED RAKE TEST ==="
log=/workspace/evidence/tests/patched_rake_test.log
set +e
timeout 400 bundle exec rake test > "$log" 2>&1
rake_exit=$?
set -e
cat "$log"
echo "RAKE_EXIT:$rake_exit" | tee -a "$log"
test "$rake_exit" -eq 0
# also capture language check
bundle exec ruby -Ilib -e "require 'linguist'; puts Linguist::Language['Malbolge'].name" 2>&1 | tee /workspace/evidence/tests/patched_language_check.log
