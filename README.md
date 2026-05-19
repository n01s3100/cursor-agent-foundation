# Cursor agent foundation

Portable **baseline** for AI-assisted engineering: tiered ceremony, pre-build loop, CONTEXT/ADR links, architecture vocabulary ([Matt Pocock skills](https://github.com/mattpocock/skills)), parallel-agent handoffs, and completion hygiene.

Consumer projects layer **their own** `.cursor/rules/*.mdc`, `AGENTS.md`, and product docs **on top** of this kit.

---

## Contents

| Path | Purpose |
|------|---------|
| [`docs/CURSOR_AGENT_STANDARDS.md`](docs/CURSOR_AGENT_STANDARDS.md) | Full universal playbook |
| [`.cursor/rules/cursor-agent-standards.mdc`](.cursor/rules/cursor-agent-standards.mdc) | Cursor project rule (`alwaysApply`) — copies into consumer repos |
| [`USER_RULES_SNIPPET.md`](USER_RULES_SNIPPET.md) | Paste into **Cursor → Settings → Rules → User Rules** per machine |
| [`templates/AGENTS.md.template`](templates/AGENTS.md.template) | Optional starter `AGENTS.md` in new projects |
| [`scripts/apply-to-repo.sh`](scripts/apply-to-repo.sh) | Copy playbook + rule into a target repo |
| [`FOR_AGENTS.md`](FOR_AGENTS.md) | Short workflow for assistants bootstrapping a new workspace |

---

## Quick start — new local project

```bash
git clone https://github.com/n01s3100/cursor-agent-foundation.git
~/cursor-agent-foundation/scripts/apply-to-repo.sh /path/to/your/new-or-existing-app
cp ~/cursor-agent-foundation/templates/AGENTS.md.template /path/to/your/new-or-existing-app/AGENTS.md
cd /path/to/your/new-or-existing-app && git add docs .cursor/rules AGENTS.md && git commit -m "Bootstrap Cursor agent foundation"
```

Then add stack-specific `.cursor/rules/*.mdc` in that project as needed.

---

## Publish remotely (team / agents fetching)

Create a **private or public** git remote (GitHub, GitLab, etc.), push this repo, and:

- Humans clone it once OR
- Automated scripts/`curl` **raw files** using pinned refs (recommended for reproducibility):

  `https://raw.githubusercontent.com/n01s3100/cursor-agent-foundation/v1.0.0/docs/CURSOR_AGENT_STANDARDS.md`

After you push, paste the canonical clone URL into your team playbook or **`FOR_AGENTS.md`** forks.

---

## Relationship to `~/.cursor/agent-bootstrap`

If you maintained an older **`~/.cursor/agent-bootstrap`** copy on disk, prefer **this git repo** as the single source of truth. Update bootstrap from here or delete duplicates when comfortable.

---

## Versioning

Tag releases (`v1.0.0`, …) when you change **`docs/CURSOR_AGENT_STANDARDS.md`** materially so downstream projects know when to refresh their copies (`apply-to-repo.sh` again or merge changes).
