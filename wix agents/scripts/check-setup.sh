#!/usr/bin/env bash
set -euo pipefail

root="$(cd "$(dirname "$0")/.." && pwd)"
cd "$root"

full=0
if [[ "${1:-}" == "--full" ]]; then
  full=1
fi

ok=0
kit_fail=0
user_fail=0

check() {
  local label="$1"
  shift
  if "$@"; then
    echo "OK   $label"
    ok=$((ok + 1))
  else
    echo "NEED $label"
    kit_fail=$((kit_fail + 1))
  fi
}

echo "Wix Agents setup check"
echo "Root: $root"
echo

echo "== Downloaded kit =="
check "Node.js >= 20.11" bash -c 'node -e "const [maj,min]=process.versions.node.split(\".\").map(Number); process.exit(maj>20||(maj===20&&min>=11)?0:1)"'
check "npm available" bash -c 'command -v npm >/dev/null'
check "@wix/cli installed" bash -c 'test -x node_modules/.bin/wix || test -d node_modules/@wix/cli'
check "@wix/mcp-remote installed" bash -c 'test -d node_modules/@wix/mcp-remote'
check "Wix skills snapshot" bash -c 'test -f vendor/wix-skills/skills/wix-docs/SKILL.md'
check "Wix MCP snapshot" bash -c 'test -f vendor/wix-mcp/README.md'
check "Cursor MCP config" bash -c 'test -f .cursor/mcp.json'
check "SITE_INFO template" bash -c 'test -f templates/SITE_INFO.md'

echo
echo "== What you still do on Wix (not a kit failure) =="
if [ -f .env ]; then
  # shellcheck disable=SC1091
  set -a
  source .env
  set +a
  if [ -n "${WIX_API_KEY:-}" ]; then
    echo "OK   WIX_API_KEY set in .env"
  else
    echo "NEED WIX_API_KEY in .env (create it in Wix API Keys Manager)"
    user_fail=$((user_fail + 1))
  fi
  if [ -n "${WIX_ACCOUNT_ID:-}" ]; then
    echo "OK   WIX_ACCOUNT_ID set in .env"
  else
    echo "NEED WIX_ACCOUNT_ID in .env"
    user_fail=$((user_fail + 1))
  fi
else
  echo "NEED .env file (copy .env.example after you create a Wix API key)"
  user_fail=$((user_fail + 1))
fi

if [ -n "${WIX_SITE_GITHUB_REPO:-}" ]; then
  echo "OK   WIX_SITE_GITHUB_REPO=${WIX_SITE_GITHUB_REPO}"
else
  echo "NEED GitHub repo URL from Wix Git Integration (fill templates/SITE_INFO.md)"
  user_fail=$((user_fail + 1))
fi

echo
echo "Kit items OK: $ok  Kit missing: $kit_fail  Wix-side items you still owe: $user_fail"
echo "See WHAT-YOU-NEED-TO-DO.md"
echo

if [ "$kit_fail" -gt 0 ]; then
  exit 1
fi
if [ "$full" -eq 1 ] && [ "$user_fail" -gt 0 ]; then
  exit 1
fi
