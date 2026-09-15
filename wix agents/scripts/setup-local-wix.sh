#!/usr/bin/env bash
# Wix "Set up your local environment" steps for the Vered site.
# Source: Wix Git Integration → Local Dev Setup
set -euo pipefail

root="$(cd "$(dirname "$0")/.." && pwd)"
cd "$root"

repo_ssh="git@github.com:ophir15/Vered.git"
repo_https="https://github.com/ophir15/Vered.git"
site_dir="$root/Vered"

echo "== Step 1: Install the Wix CLI =="
if command -v wix >/dev/null 2>&1; then
  echo "Wix CLI already on PATH: $(command -v wix)"
  wix --version || true
else
  npm install -g @wix/cli
fi

echo
echo "== Step 2: Clone the GitHub repository and install its dependencies =="
if [ -d "$site_dir/.git" ]; then
  echo "Already cloned: $site_dir"
  git -C "$site_dir" remote -v
  git -C "$site_dir" pull --ff-only || true
else
  if git clone "$repo_ssh" "$site_dir"; then
    echo "Cloned via SSH"
  else
    echo "SSH clone failed; trying HTTPS"
    git clone "$repo_https" "$site_dir"
  fi
fi

cd "$site_dir"
npm install

echo
echo "== Step 3: Open the Local Editor =="
echo "From $site_dir run:"
echo "  wix dev"
echo
echo "Skipping 'wix dev' here (it opens a browser). Run it on your computer after clone."
