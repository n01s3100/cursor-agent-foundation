#!/usr/bin/env bash
# One-shot: apply cursor-agent-foundation to cloud-connected repos, commit, push.
set -euo pipefail

FOUNDATION="$(cd "$(dirname "$0")/.." && pwd)"
APPLY="$FOUNDATION/scripts/apply-to-repo.sh"
COMMIT_MSG="Sync cursor-agent-foundation (WORKFLOW_ROUTER, OUT_OF_BOX, workflow-stack-harmony, skills)."

# Repos used by Cursor Cloud Agents (edit paths if yours differ)
CLOUD_REPOS=(
  "$HOME/Auto"                 # AP on GitHub
  "$HOME/Risk-Manager"
  "$HOME/mullah"
  "$HOME/hd-life-os-portal"
)

# Optional: other local repos that should get the same files (no push unless you add them above)
EXTRA_REPOS=(
  "$HOME/replyforge"
  "$HOME/tradingview-mcp-jackson"
)

DO_PUSH=1
DRY_RUN=0
INCLUDE_EXTRA=0

usage() {
  cat <<EOF
Usage: $(basename "$0") [options]

Applies foundation from:
  $FOUNDATION

Default targets (cloud):
  ${CLOUD_REPOS[*]}

Options:
  --no-push       Apply + commit only; do not git push
  --dry-run       Print actions only
  --extra         Also sync EXTRA_REPOS (replyforge, tradingview-mcp-jackson, …)
  -h, --help      This help

After push, Cloud Agents on main will pick up docs/WORKFLOW_ROUTER.md and .cursor/rules/.
EOF
}

while [[ $# -gt 0 ]]; do
  case "$1" in
    --no-push) DO_PUSH=0; shift ;;
    --dry-run) DRY_RUN=1; shift ;;
    --extra) INCLUDE_EXTRA=1; shift ;;
    -h | --help) usage; exit 0 ;;
    *) echo "Unknown option: $1" >&2; usage; exit 1 ;;
  esac
done

REPOS=("${CLOUD_REPOS[@]}")
if [[ "$INCLUDE_EXTRA" -eq 1 ]]; then
  REPOS+=("${EXTRA_REPOS[@]}")
fi

if [[ ! -x "$APPLY" ]]; then
  echo "Missing apply script: $APPLY" >&2
  exit 1
fi

sync_one() {
  local repo="$1"
  if [[ ! -d "$repo/.git" ]]; then
    echo "⏭️  Skip (not a git repo): $repo"
    return 0
  fi

  echo ""
  echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
  echo "📁 $repo"
  echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"

  if [[ "$DRY_RUN" -eq 1 ]]; then
    echo "  [dry-run] would run: $APPLY $repo"
    echo "  [dry-run] would git add docs/ .cursor/rules/cursor-agent-standards.mdc .cursor/rules/workflow-stack-harmony.mdc skills/"
    echo "  [dry-run] would commit if changed; push=$DO_PUSH"
    return 0
  fi

  "$APPLY" "$repo"

  cd "$repo"
  git add \
    docs/CURSOR_AGENT_STANDARDS.md \
    docs/WORKFLOW_ROUTER.md \
    docs/OUT_OF_BOX_WORKFLOW.md \
    .cursor/rules/cursor-agent-standards.mdc \
    .cursor/rules/workflow-stack-harmony.mdc \
    skills/README.md \
    skills/engineering/grill-with-docs \
    skills/engineering/improve-codebase-architecture \
    2>/dev/null || true

  if git diff --cached --quiet; then
    echo "✅ Already up to date (nothing to commit)"
  else
    git commit -m "$COMMIT_MSG"
    echo "✅ Committed"
  fi

  if [[ "$DO_PUSH" -eq 1 ]]; then
    local branch
    branch="$(git branch --show-current)"
    if git remote get-url origin &>/dev/null; then
      if git push origin "$branch"; then
        echo "✅ Pushed origin/$branch"
      else
        echo "⚠️  Push failed for $repo — run: cd $repo && git pull --rebase && git push" >&2
        return 1
      fi
    else
      echo "⚠️  No origin remote — committed locally only" >&2
    fi
  else
    echo "ℹ️  Skipped push (--no-push)"
  fi
}

failures=0
for repo in "${REPOS[@]}"; do
  sync_one "$repo" || failures=$((failures + 1))
done

echo ""
if [[ "$failures" -gt 0 ]]; then
  echo "Done with $failures repo(s) needing manual follow-up."
  exit 1
fi
echo "Done. Cloud agents: use branch main (or merge there) on each GitHub repo."
