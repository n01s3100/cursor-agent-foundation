# Workflow router — what to use when

**Read this first** in any **app repo** (not the foundation repo itself). It prevents double-planning between **this foundation**, **Cursor [pstack](https://cursor.com/marketplace/cursor/pstack)**, and **vendored Matt Pocock skills**.

| Layer | What it is | Where it lives |
|-------|------------|----------------|
| **Foundation** | Tiers, product rules, CONTEXT/ADR, commit/deploy hygiene | `docs/CURSOR_AGENT_STANDARDS.md`, `.cursor/rules/*.mdc`, `AGENTS.md` |
| **pstack** | Cursor plugin: playbooks, multi-model design, verification | `/poteto-mode`, `/architect`, `/how`, … (after `/add-plugin pstack`) |
| **Domain & structure skills** | Glossary + deepening (required when triggered) | `skills/engineering/grill-with-docs/`, `improve-codebase-architecture/` |

**Precedence (highest wins on conflict):**

1. This repo’s **product** `.cursor/rules/*.mdc` (e.g. “no estimates”, Fabric sync)
2. **`docs/WORKFLOW_ROUTER.md`** (this file)
3. **`docs/CURSOR_AGENT_STANDARDS.md`**
4. **pstack** playbook steps (when active — see below)
5. User’s explicit “skip X for this task”

---

## Step 1 — Classify tier (always)

| Tier | Examples | Mandatory Matt skills? | pstack? |
|------|----------|------------------------|---------|
| **A** | typo, one-liner, copy | No | Optional — usually skip |
| **B** | feature, bug, localized refactor | Only if triggers in Step 3 | Recommended for non-trivial work |
| **C** | new subsystem, major boundaries, greenfield | **Yes** — grill before code | **Yes** — `/poteto-mode` + checkpoint |

---

## Step 2 — Is pstack driving this turn?

**pstack is ACTIVE** when any of:

- User message starts with **`/poteto-mode`** or **`/poteto-mode new task`**
- User invoked a pstack skill directly (`/architect`, `/how`, `/blast-radius`, …)
- User says they are **in poteto-mode** / sticky mode is on
- pstack plugin is installed and user asked for “rigorous” / “playbook” / “land the stack” style work

**When pstack is ACTIVE:**

- Let the **matched playbook** own the task list and verification steps.
- **Do not** also paste the foundation **pre-build block** (problem / approach / risks / checkbox) — that duplicates the playbook. Instead, ensure the playbook’s visible todos cover scope and verification.
- Still apply **Step 3** (grill / architecture) **before** implementation when triggers fire — insert them as explicit playbook steps (e.g. before `/architect` or before “implement”).
- Still follow **definition of done** and **commit / push / deploy** from `CURSOR_AGENT_STANDARDS.md` at the end unless the human opts out.

**When pstack is NOT active:**

- Follow **`docs/CURSOR_AGENT_STANDARDS.md`** fully (pre-build block on Tier B+, mandatory skills when triggered).

**Human shortcut (recommended for Tier B+ in Cursor):**

```text
/poteto-mode <goal>. Verify: <how we know it's done>.
```

---

## Step 3 — Mandatory Matt skills (foundation — not replaced by pstack)

Run these **in the app repo** when triggers apply — **even if pstack is active**. They answer *domain words* and *module shape*; pstack answers *how to execute*.

### grill-with-docs

**Use when:** Tier **C**; fuzzy/conflicting domain terms; “grill this plan”; first real **`CONTEXT.md`**.

**Skill:** `skills/engineering/grill-with-docs/SKILL.md`

**Order with pstack:** **grill → then** `/poteto-mode` (feature / multi-phase) or **`/architect with checkpoint`**.

**Do not use:** Tier A; pure mechanical rename with no domain ambiguity.

### improve-codebase-architecture

**Use when:** choosing **what** to merge/split/deepen; “architecture review”; refactor across **seams** (not a small behavior-preserving cleanup).

**Skill:** `skills/engineering/improve-codebase-architecture/SKILL.md`

**Order with pstack:** **candidates + human pick → then** pstack **Refactoring** playbook (behavior-preserving steps) or **`/architect`** for the chosen shape.

**Do not use:** when pstack **Refactoring** playbook already covers a **single**, behavior-preserving move with characterization tests and no boundary redesign.

---

## Step 4 — Pick pstack skill (only when pstack active or user asks)

| User intent | pstack entry | Notes |
|-------------|--------------|--------|
| Default rigorous task | **`/poteto-mode`** | Router picks playbook |
| Understand system (read-only) | **`/how`**, **`/why`** | Investigation playbook |
| Code shape before implement | **`/architect`** | Use **`with checkpoint`** when wrong shape is costly |
| Compare designs | **`/arena`** | Often inside architect |
| Small diff, could break elsewhere | **`/blast-radius`** | |
| Review diff | **`/interrogate`** | |
| Bug with repro | Bug fix playbook via **`/poteto-mode`** | |
| Behavior-preserving structure change | Refactoring playbook | After architecture skill if boundaries change |
| New behavior | Feature playbook | Grill first if Tier C / fuzzy domain |
| Long / overnight / many PRs | autonomous-run, shipping, orchestrate playbooks | Foundation handoffs still apply for parallel implementers |

If pstack is **not installed**, use foundation pre-build + Matt skills only; suggest `/add-plugin pstack` for heavy Cursor work.

---

## Step 5 — Parallel agents

| Situation | Use |
|-----------|-----|
| pstack **swarm / arena / orchestrate** | Follow pstack; one coordinator |
| Foundation parallel implementers | Written **handoff** (goal, non-goals, files, interface, merge order) |
| Both | pstack coordinates workers; handoff briefs name **seams** and **CONTEXT.md** terms |

---

## Quick decision (agents)

```text
1. Tier A? → implement + lint; stop.
2. Tier C or fuzzy domain? → grill-with-docs (full SKILL.md).
3. Boundary / deepening refactor? → improve-codebase-architecture (candidates → pick).
4. Cursor + non-trivial + pstack available? → /poteto-mode (skip foundation pre-build).
5. Else → foundation pre-build + human "go".
6. Done → lint/tests, commit, push, deploy (if repo defines how).
```

---

## For humans

- **One line to start hard work:** `/poteto-mode <outcome>. Verify: <check>.`
- **New repo:** bootstrap from [cursor-agent-foundation](https://github.com/n01s3100/cursor-agent-foundation); install pstack once per machine.
- **Domain-heavy feature:** “Grill domain first, then poteto-mode feature with architect checkpoint.”
