#!/usr/bin/env bash
set -euo pipefail

REPO_URL="https://github.com/yaseenyaseen123/swq.git"
SITE_URL="https://yaseenyaseen123.github.io/swq/"

if [[ ! -f index.html ]]; then
  echo "[ERROR] index.html not found. Run this script from the project directory." >&2
  exit 1
fi

if [[ ! -d .git ]]; then
  git init
fi

git branch -M main
if git remote get-url origin >/dev/null 2>&1; then
  git remote set-url origin "$REPO_URL"
else
  git remote add origin "$REPO_URL"
fi

git add index.html README.md .nojekyll .github/workflows/deploy.yml deploy.sh
git diff --cached --quiet || git commit -m "Deploy Jordan driving academy website"
git push -u origin main

echo "Deployment pushed. GitHub Actions will publish the site at:"
echo "$SITE_URL"
