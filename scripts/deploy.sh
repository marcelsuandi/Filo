#!/usr/bin/env bash
# Pull latest code and (re)build the production stack.
set -euo pipefail
cd "$(dirname "$0")/.."
COMPOSE="docker compose -f docker-compose.prod.yml"

git pull --ff-only || echo "git pull skipped (not a repo or no remote)"
$COMPOSE up -d --build
$COMPOSE ps
docker image prune -f >/dev/null 2>&1 || true
echo "Deployed."
