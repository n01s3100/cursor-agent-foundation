# Cursor agent foundation

Single **source of truth** for baseline AI engineering standards. Every app repo gets the same starting rules; product-specific rules are added **in that app’s repo** later.

**For AI agents:** open **[AGENTS.md](AGENTS.md)** first, then **[FOR_AGENTS.md](FOR_AGENTS.md)** for the full bootstrap workflow.

**For humans:** clone once, run `scripts/apply-to-repo.sh` on each project (see below).

---

## What this repo is

| File / folder | Purpose |
|---------------|---------|
| [AGENTS.md](AGENTS.md) | **Entry point** — what to do when you only have this link |
| [FOR_AGENTS.md](FOR_AGENTS.md) | Step-by-step workflows (bootstrap, already bootstrapped, edit foundation) |
| [docs/CURSOR_AGENT_STANDARDS.md](docs/CURSOR_AGENT_STANDARDS.md) | Full playbook (tiers, pre-build, CONTEXT/ADR, architecture, parallel agents) |
| [.cursor/rules/cursor-agent-standards.mdc](.cursor/rules/cursor-agent-standards.mdc) | Cursor rule copied into consumer repos |
| [scripts/apply-to-repo.sh](scripts/apply-to-repo.sh) | Installs playbook + rule into another project |
| [templates/AGENTS.md.template](templates/AGENTS.md.template) | Starter `AGENTS.md` for consumer repos |
| [USER_RULES_SNIPPET.md](USER_RULES_SNIPPET.md) | Paste into Cursor **User Rules** once per machine |

---

## Human quick start — new project

```bash
git clone https://github.com/n01s3100/cursor-agent-foundation.git
~/cursor-agent-foundation/scripts/apply-to-repo.sh /path/to/your-app
cp ~/cursor-agent-foundation/templates/AGENTS.md.template /path/to/your-app/AGENTS.md
cd /path/to/your-app && git add docs .cursor/rules AGENTS.md && git commit -m "Bootstrap Cursor agent foundation"
```

Then add stack-specific `.cursor/rules/*.mdc` in **your app repo** as needed.

---

## Giving an agent only this link

Say something like:

> Use https://github.com/n01s3100/cursor-agent-foundation — read **AGENTS.md** and bootstrap standards into `~/path/to/my-app`.

The agent should clone (or fetch), run **`scripts/apply-to-repo.sh`**, add **`AGENTS.md`**, commit in **your app**, then follow **`docs/CURSOR_AGENT_STANDARDS.md`** in that app.

---

## Pinned raw files (no clone)

- Standards: `https://raw.githubusercontent.com/n01s3100/cursor-agent-foundation/v1.0.0/docs/CURSOR_AGENT_STANDARDS.md`
- Cursor rule: `https://raw.githubusercontent.com/n01s3100/cursor-agent-foundation/v1.0.0/.cursor/rules/cursor-agent-standards.mdc`

Prefer tag **`v1.0.0`** (or latest tag) for reproducible bootstrap.

---

## Versioning

Tag releases when `docs/CURSOR_AGENT_STANDARDS.md` changes materially. Consumer repos can re-run `apply-to-repo.sh` to refresh.
