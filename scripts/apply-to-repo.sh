#!/usr/bin/env bash
# Copy universal Cursor standards + vendored skills into a consumer project directory.
set -euo pipefail

if [[ "${1:-}" == "-h" || "${1:-}" == "--help" || $# -lt 1 ]]; then
  echo "Usage: $0 <path-to-target-repo-root>" >&2
  echo "" >&2
  echo "Copies:" >&2
  echo "  docs/CURSOR_AGENT_STANDARDS.md" >&2
  echo "  .cursor/rules/cursor-agent-standards.mdc" >&2
  echo "  skills/engineering/ (grill-with-docs + improve-codebase-architecture)" >&2
  exit 1
fi

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
TARGET="$(cd "$1" && pwd)"

mkdir -p "$TARGET/docs" "$TARGET/.cursor/rules" "$TARGET/skills/engineering"
install -m 0644 "$ROOT/docs/CURSOR_AGENT_STANDARDS.md" "$TARGET/docs/CURSOR_AGENT_STANDARDS.md"
install -m 0644 "$ROOT/.cursor/rules/cursor-agent-standards.mdc" "$TARGET/.cursor/rules/cursor-agent-standards.mdc"
rm -rf "$TARGET/skills/engineering/grill-with-docs" "$TARGET/skills/engineering/improve-codebase-architecture"
cp -R "$ROOT/skills/engineering/grill-with-docs" "$TARGET/skills/engineering/"
cp -R "$ROOT/skills/engineering/improve-codebase-architecture" "$TARGET/skills/engineering/"
if [[ -f "$ROOT/skills/README.md" ]]; then
  install -m 0644 "$ROOT/skills/README.md" "$TARGET/skills/README.md"
fi

echo "✅ Applied foundation to: $TARGET"
echo "   - docs/CURSOR_AGENT_STANDARDS.md"
echo "   - .cursor/rules/cursor-agent-standards.mdc"
echo "   - skills/engineering/grill-with-docs/"
echo "   - skills/engineering/improve-codebase-architecture/"
echo "Optional: cp \"$ROOT/templates/AGENTS.md.template\" \"$TARGET/AGENTS.md\""
