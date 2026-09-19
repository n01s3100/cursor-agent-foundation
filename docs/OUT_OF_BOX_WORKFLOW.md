# Out-of-box workflow — foundation + agent team + pstack

Goal: **every Project and cloud session** gets the same starting stack. Repo-specific rules and `AGENTS.md` sections accrue over time; the baseline should not depend on memory.

## What git already gives every bootstrapped repo

| Artifact | Purpose |
|----------|---------|
| `docs/WORKFLOW_ROUTER.md` | Chooses foundation vs pstack vs Matt skills |
| `docs/CURSOR_AGENT_STANDARDS.md` | Tiers, mandatory skills, completion |
| `.cursor/rules/cursor-agent-standards.mdc` | Always-on summary |
| `.cursor/rules/workflow-stack-harmony.mdc` | Always-on stack + **Tier B+ Workflow reminders** |
| `skills/engineering/` | grill-with-docs, improve-codebase-architecture |
| `.cursor/agents/`, `.cursor/skills/`, `.cursor/commands/` | Agent team kit (when deployed) |
| `AGENTS.md` | Project handover + team routing |

Cloud Agents and **Cursor Projects** load committed `.cursor/rules/` and repo skills from the clone on **`main`**.

## What you configure once (account / team)

These are **not** in your app repo but are required for “pstack always available”:

### 1. pstack plugin (Lauren Tan)

| Where | Action |
|-------|--------|
| **Desktop** | `/add-plugin pstack` then `/setup-pstack` |
| **Team / Cloud** | Dashboard → Plugins → import [pstack marketplace](https://cursor.com/marketplace/cursor/pstack) → set **Default On** or **Required** for the org |

Without pstack, agents still follow **WORKFLOW_ROUTER** (foundation + team kit + Matt skills). Harmony rules tell the agent to **remind you once** to install or require pstack.

### 2. User Rules

Paste [`USER_RULES_SNIPPET.md`](../USER_RULES_SNIPPET.md) at the **top** of Cursor **Settings → Rules → User Rules** (merge with existing git/PR rules).

### 3. Optional: sync personal skills to cloud

Settings → Agents → **Sync skills for cloud agents** — only if you rely on `~/.cursor/skills/` outside the repo. Prefer committed `.cursor/skills/` in the repo.

## How the three layers work together

```text
Tier A     → fix; no Workflow reminder
Tier B/C   → agent shows Workflow line (tier + /poteto-mode or @project-orchestrator + grill if needed)
pstack on  → playbook owns execution; no duplicate foundation pre-build
Team kit   → @project-orchestrator for phases; poteto-mode inside build when rigorous
Product    → repo .cursor/rules (Fabric, deploy, portal, …) wins on conflict
```

## New Cursor Project checklist

1. Workspace = GitHub repo, branch **`main`** (foundation synced).
2. Team **pstack Required** (or user installed on desktop).
3. User Rules snippet merged.
4. First message can be the task alone — agent should still emit **Workflow** on Tier B+.

## Refresh all cloud repos from foundation

```bash
~/cursor-agent-foundation/scripts/sync-cloud-repos.sh
```
