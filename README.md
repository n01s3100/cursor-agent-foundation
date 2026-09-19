# Cursor agent foundation

Single **source of truth** for baseline AI engineering standards. Every app repo gets the same starting rules; product-specific rules are added **in that app’s repo** later.

**For AI agents:** in an app repo, read **`docs/WORKFLOW_ROUTER.md`** first. For bootstrap only, see **[AGENTS.md](AGENTS.md)** → **[FOR_AGENTS.md](FOR_AGENTS.md)**.

**For humans:** clone once, run `scripts/apply-to-repo.sh` on each project (see below).

---

## What this repo is

| File / folder | Purpose |
|---------------|---------|
| [AGENTS.md](AGENTS.md) | **Entry point** — what to do when you only have this link |
| [FOR_AGENTS.md](FOR_AGENTS.md) | Step-by-step workflows (bootstrap, already bootstrapped, edit foundation) |
| [docs/WORKFLOW_ROUTER.md](docs/WORKFLOW_ROUTER.md) | **What to use when** — foundation + pstack + Matt skills |
| [docs/OUT_OF_BOX_WORKFLOW.md](docs/OUT_OF_BOX_WORKFLOW.md) | **Projects/cloud setup** — pstack Required, User Rules, reminders |
| [.cursor/rules/workflow-stack-harmony.mdc](.cursor/rules/workflow-stack-harmony.mdc) | Always-on stack harmony + Tier B+ Workflow reminders |
| [docs/CURSOR_AGENT_STANDARDS.md](docs/CURSOR_AGENT_STANDARDS.md) | Full playbook (tiers, pre-build, **mandatory** skill triggers) |
| [skills/engineering/](skills/engineering/) | Vendored **grill-with-docs** + **improve-codebase-architecture** |
| [.cursor/rules/cursor-agent-standards.mdc](.cursor/rules/cursor-agent-standards.mdc) | Cursor rule copied into consumer repos |
| [scripts/apply-to-repo.sh](scripts/apply-to-repo.sh) | Installs playbook + rule + skills into another project |
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

**One-shot update (AP, Risk-Manager, mullah, HD Life OS portal — apply, commit, push):**

```bash
~/cursor-agent-foundation/scripts/sync-cloud-repos.sh
```

Dry run: `sync-cloud-repos.sh --dry-run` · Commit without push: `--no-push`

Then add stack-specific `.cursor/rules/*.mdc` in **your app repo** as needed.

---

## Giving an agent only this link

> Use https://github.com/n01s3100/cursor-agent-foundation — bootstrap into `~/path/to/my-app`, then in that app follow **`docs/WORKFLOW_ROUTER.md`**. For hard Cursor work use **`/poteto-mode`** if pstack is installed.

Optional: `/add-plugin pstack` + `/setup-pstack` on your machine (works **with** this foundation, not instead of it).

---

## Pinned raw files (no clone)

Prefer **`scripts/apply-to-repo.sh`** so `skills/engineering/` is copied. For pinned raw files, use the latest tag (e.g. **`v1.1.0`**) on GitHub.

---

## Versioning

Tag releases when `docs/CURSOR_AGENT_STANDARDS.md` changes materially. Consumer repos can re-run `apply-to-repo.sh` to refresh.
