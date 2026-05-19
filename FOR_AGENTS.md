# Instructions for AI agents — using this repo

Treat this repository as **read-only canon** unless the human asks you to change it.

## Before starting greenfield work in an empty folder

1. **Read** [`docs/CURSOR_AGENT_STANDARDS.md`](docs/CURSOR_AGENT_STANDARDS.md) (or clone/fetch from the remote URL the human gave you).
2. **Apply** the kit into the new project directory by running:

   ```bash
   /path/to/cursor-agent-foundation/scripts/apply-to-repo.sh /path/to/new/project
   ```

   If this repo lives at a known clone path on the human’s machine, prefer that clone over improvising shortened copies.

3. **Optional hub file:** copy [`templates/AGENTS.md.template`](templates/AGENTS.md.template) to the new repo as `AGENTS.md` so developers know where the baseline lives.

4. **Global Cursor behaviour:** remind the human to paste [`USER_RULES_SNIPPET.md`](USER_RULES_SNIPPET.md) into Cursor **User Rules** once per machine/workspace policy (those settings do not live in git).

## After foundations are copied

Layer **product- or stack-specific** rules in **that** project:

- `.cursor/rules/*.mdc` (narrow globs where possible)
- `AGENTS.md` sections
- Any existing `CONTEXT.md`, `docs/adr/`, etc.

Do not fork or duplicate the universal document inside the consumer repo except by running `apply-to-repo.sh` — one source avoids drift unless the human intentionally edits their copy.

## Fetching without a local clone

After this repo is pushed to GitHub/GitLab:

- Humans or agents may use **`git sparse-checkout`** or **`curl`/raw URLs** for `docs/CURSOR_AGENT_STANDARDS.md` and the `.mdc` only.
- Prefer a **pinned tag or commit SHA** when the human asks for reproducible bootstrap.
