#!/usr/bin/env bash
# Turn a copied "wix agents" folder into its own git repo.
# Do not run this inside the parent workshop clone if you want one combined repo.
set -euo pipefail
root="$(cd "$(dirname "$0")/.." && pwd)"
cd "$root"
if [ -d .git ]; then
  echo "Already a git repository: $root"
  exit 0
fi
git init -b main
git add -A
git commit -m "Initial Wix Agents kit."
echo "Standalone repo created at $root"
echo "Create a GitHub repo, then: git remote add origin <url> && git push -u origin main"
