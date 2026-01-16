#!/bin/bash
set -euo pipefail

repo_root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

if ! grep -q "codex exec" "$repo_root/ralph.sh"; then
  echo "expected ralph.sh to invoke codex exec" >&2
  exit 1
fi

if ! grep -q "git-commit-all workflow" "$repo_root/prompt.md"; then
  echo "expected prompt.md to mention git-commit-all workflow" >&2
  exit 1
fi

if ! grep -q -- "--enable web_search_request" "$repo_root/ralph.sh"; then
  echo "expected ralph.sh to include --enable web_search_request" >&2
  exit 1
fi
