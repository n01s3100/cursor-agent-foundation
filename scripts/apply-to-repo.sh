#!/usr/bin/env bash
# Copy universal Cursor standards into a consumer project directory.
set -euo pipefail

if [[ "${1:-}" == "-h" || "${1:-}" == "--help" || $# -lt 1 ]]; then
  echo "Usage: $0 <path-to-target-repo-root>" >&2
  echo "" >&2
  echo "Copies docs/CURSOR_AGENT_STANDARDS.md and .cursor/rules/cursor-agent-standards.mdc" >&2
  echo "from this kit into the target. Does not commit — run git in the target repo." >&2
  exit 1
fi

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
TARGET="$(cd "$1" && pwd)"

mkdir -p "$TARGET/docs" "$TARGET/.cursor/rules"
install -m 0644 "$ROOT/docs/CURSOR_AGENT_STANDARDS.md" "$TARGET/docs/CURSOR_AGENT_STANDARDS.md"
install -m 0644 "$ROOT/.cursor/rules/cursor-agent-standards.mdc" "$TARGET/.cursor/rules/cursor-agent-standards.mdc"

echo "✅ Applied foundation to: $TARGET"
echo "   - docs/CURSOR_AGENT_STANDARDS.md"
echo "   - .cursor/rules/cursor-agent-standards.mdc"
echo "Optional: cp \"$ROOT/templates/AGENTS.md.template\" \"$TARGET/AGENTS.md\""
echo "(or merge the template into existing AGENTS.md)"
