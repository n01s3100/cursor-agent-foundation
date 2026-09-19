# Instructions for AI agents

**Repository:** https://github.com/n01s3100/cursor-agent-foundation  
**Pinned release (optional):** tag `v1.0.0`

This repo is **read-only canon** unless the human asks you to change the foundation itself.

---

## Workflow A — Bootstrap a consumer project (most common)

Use when the human wants a **new or existing app repo** to get the same baseline rules and docs.

### Inputs you need

- **Target path** — root of the app repo (e.g. `~/my-app`). If missing, **ask once**: “Which directory should I apply the foundation to?”
- **This foundation** — clone if you don’t have it:

  ```bash
  git clone https://github.com/n01s3100/cursor-agent-foundation.git /tmp/cursor-agent-foundation
  ```

### Steps (do in order)

1. **Clone** this repo (or use an existing clone on the machine).
2. **Apply** files into the **target** project (not into this foundation repo):

   ```bash
   /tmp/cursor-agent-foundation/scripts/apply-to-repo.sh /path/to/target-project
   ```

   This creates:

   - `target-project/docs/CURSOR_AGENT_STANDARDS.md`
   - `target-project/.cursor/rules/cursor-agent-standards.mdc`
   - `target-project/skills/engineering/grill-with-docs/` and `improve-codebase-architecture/` (mandatory workflows)

3. **Add hub file** (recommended):

   ```bash
   cp /tmp/cursor-agent-foundation/templates/AGENTS.md.template /path/to/target-project/AGENTS.md
   ```

   If `AGENTS.md` already exists, **merge** the template’s pointer block at the top; do not delete project-specific content.

4. **Commit in the target repo** (unless the human said not to):

   ```bash
   cd /path/to/target-project
   git add docs/CURSOR_AGENT_STANDARDS.md .cursor/rules/cursor-agent-standards.mdc skills AGENTS.md
   git commit -m "Bootstrap Cursor agent foundation from cursor-agent-foundation"
   ```

5. **Work in the target repo** using **[docs/WORKFLOW_ROUTER.md](docs/WORKFLOW_ROUTER.md)** first, then [docs/CURSOR_AGENT_STANDARDS.md](docs/CURSOR_AGENT_STANDARDS.md). If the human uses Cursor **pstack**, `/poteto-mode` replaces the foundation pre-build block; Matt skills still apply when the router says so. **Mandatory skills** (not optional when triggered):
   - **Tier C / fuzzy domain / plan stress-test** → [skills/engineering/grill-with-docs/SKILL.md](skills/engineering/grill-with-docs/SKILL.md) in the **target** repo.
   - **Refactors / boundaries / deepening** → [skills/engineering/improve-codebase-architecture/SKILL.md](skills/engineering/improve-codebase-architecture/SKILL.md) in the **target** repo.
6. Add **project-specific** `.cursor/rules/*.mdc` only when the stack or product needs them.

7. **Once per machine (remind human):** [USER_RULES_SNIPPET.md](USER_RULES_SNIPPET.md) → Cursor **Settings → Rules → User Rules**. Git cannot store that setting.

### Without a local clone (fetch only)

Copy pinned files into the target (adjust paths):

```bash
TAG=v1.0.0
BASE=https://raw.githubusercontent.com/n01s3100/cursor-agent-foundation/$TAG
mkdir -p /path/to/target-project/docs /path/to/target-project/.cursor/rules
curl -fsSL "$BASE/docs/CURSOR_AGENT_STANDARDS.md" -o /path/to/target-project/docs/CURSOR_AGENT_STANDARDS.md
curl -fsSL "$BASE/.cursor/rules/cursor-agent-standards.mdc" -o /path/to/target-project/.cursor/rules/cursor-agent-standards.mdc
```

Then add `AGENTS.md` from the template (curl or copy from clone). Prefer **`apply-to-repo.sh`** when a shell is available — fewer mistakes.

---

## Workflow B — Consumer project already bootstrapped

If the **target** repo already contains `docs/CURSOR_AGENT_STANDARDS.md` and `.cursor/rules/cursor-agent-standards.mdc`:

- **Do not** re-copy from foundation unless the human asks to refresh or sync versions.
- Follow **that repo’s** `AGENTS.md` and any extra `.cursor/rules/*.mdc`.
- Use [docs/CURSOR_AGENT_STANDARDS.md](docs/CURSOR_AGENT_STANDARDS.md) in the **target** as the playbook (content should match this foundation).

---

## Workflow C — Edit the foundation repo itself

Only when the human explicitly wants to change **shared** standards for all future projects:

- Edit `docs/CURSOR_AGENT_STANDARDS.md` and/or `.cursor/rules/cursor-agent-standards.mdc` here.
- Commit, push, and suggest a new **git tag** if the change is breaking or worth pinning.
- Tell the human which consumer repos should re-run `apply-to-repo.sh` or merge updates.

---

## After bootstrap — how to work (summary)

From [docs/CURSOR_AGENT_STANDARDS.md](docs/CURSOR_AGENT_STANDARDS.md):

- **Tier A:** trivial fix → one sentence, then implement (no mandatory skills).
- **Tier B+:** pre-build block; human **go** before behaviour/API changes; run **grill** / **architecture** skills when triggers apply.
- **Tier C:** **grill-with-docs** before implementation; architecture skill when shaping modules.
- **Parallel subagents:** one lead; written handoff before sharing a seam.
- **Done:** lint/tests; **commit, push, deploy** if the target repo documents how.

Layer **product rules** in the **consumer** repo only (`CONTEXT.md`, `docs/adr/`, extra `.mdc` files).
