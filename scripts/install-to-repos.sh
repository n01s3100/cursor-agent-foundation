#!/usr/bin/env bash
# Apply foundation files to a list of repos (no commit/push). For full cloud sync use sync-cloud-repos.sh.
set -euo pipefail

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
APPLY="$ROOT/scripts/apply-to-repo.sh"

REPOS=(
  "$HOME/Auto"
  "$HOME/Risk-Manager"
  "$HOME/mullah"
  "$HOME/hd-life-os-portal"
  "$HOME/replyforge"
  "$HOME/tradingview-mcp-jackson"
)

for repo in "${REPOS[@]}"; do
  if [[ ! -d "$repo/.git" ]]; then
    echo "Skip (not a git repo): $repo"
    continue
  fi
  "$APPLY" "$repo"
done

echo "Done. To commit and push all cloud repos: $ROOT/scripts/sync-cloud-repos.sh"
