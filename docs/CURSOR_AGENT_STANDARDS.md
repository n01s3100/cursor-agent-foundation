# Cursor agent standards (universal)

Repo-agnostic playbook for AI agents and developers. **Stack- or product-specific rules** live in this repo’s other `.cursor/rules/` files and docs — this file is the shared baseline.

**Principle:** scale ceremony with irreversibility and blast radius — trivial work gets a sentence; expensive-to-reverse work gets heavier requirements and documentation.

---

## Tiers

### Tier A — Trivial

Examples: typos, obvious one-liners, single config knobs, copy tweaks.

- **Before code:** one-sentence problem + what “done” means.
- **After code:** lint/tidy touched files; tests only if the area already requires them for that change class.

### Tier B — Default feature / bug / refactor

Anything that changes behaviour, data, APIs, auth, money, concurrency, or cross-cutting state — but not a new system.

- **Before code:** short **pre-build block** (below); human can reply “go” or confirm bullets — no formal PRD unless they ask.
- **After code:** definition of done (below) + **commit / push / deploy** when the repo defines how (ask if unclear).

### Tier C — Greenfield or large architectural change

New subsystem, major boundary moves, or “how the whole thing is shaped.”

- **Before code:** stronger requirements: overview, user flows, in/out of scope, stack, features, NFRs as appropriate; prefer reasoning order **functional → non-functional → domain → flows → data → API (if any) → architecture → code** without treating every tiny PR as a waterfall.
- **ADRs:** only when **all** of: hard to reverse; surprising without context; real trade-off between alternatives ([ADR guidance](https://github.com/mattpocock/skills/blob/main/skills/engineering/grill-with-docs/ADR-FORMAT.md)).
- **PRD-style sign-off:** when the human wants it — not a blanket blocker for Tier B.

---

## Pre-build confirmation (Tier B and above)

Before implementation, produce:

1. **Problem** — What is wrong or missing? Who is affected? What is explicitly **out of scope**?
2. **Approach** — Steps and **which areas/files** you expect to touch (high level).
3. **Why it helps** — Correctness, maintainability, risk, or product outcome.
4. **Downsides / risks / follow-ups** — Trade-offs, edge cases, debt.
5. **Plan** — One recommended plan with a **3–7 item checkbox list**. If the wrong choice is costly (new boundaries, migrations, security), offer **at least two** options and recommend one.

For **non-trivial** debugging or design, use explicit **thought → action → observation**: reason, use tools, observe, correct before continuing.

**Tier A:** skip the block; one sentence is enough.

---

## Domain language and decisions (lazy)

- **`CONTEXT.md`** (repo root or per-context): glossary + relationships + short example dialogue — **domain only**, not implementation. Format: [CONTEXT-FORMAT.md](https://github.com/mattpocock/skills/blob/main/skills/engineering/grill-with-docs/CONTEXT-FORMAT.md). Create or extend when terminology gets fuzzy — not mandatory on every task.
- **`docs/adr/`** (or project ADR location): short records for structural decisions worth remembering; skip routine fixes.

Stress-test plans against docs and code: [grill-with-docs](https://github.com/mattpocock/skills/tree/main/skills/engineering/grill-with-docs).

---

## Architecture vocabulary (when refactoring or deepening modules)

Use consistent terms from [improve-codebase-architecture](https://github.com/mattpocock/skills/tree/main/skills/engineering/improve-codebase-architecture) / [LANGUAGE.md](https://github.com/mattpocock/skills/blob/main/skills/engineering/improve-codebase-architecture/LANGUAGE.md):

- **Module**, **interface** (everything the caller must know — not only signatures), **implementation**, **depth**, **seam**, **adapter**.
- **Deletion test:** if deleting a module concentrates complexity in callers, it was shallow or mis-seamed; if complexity vanishes, it earned its keep.
- **Interface is the test surface**; prefer behaviour observable through the interface.
- **Seam discipline:** one adapter ⇒ hypothetical seam; two adapters ⇒ real seam ([DEEPENING.md](https://github.com/mattpocock/skills/blob/main/skills/engineering/improve-codebase-architecture/DEEPENING.md)).

Do not let this vocabulary **block** Tier A fixes; use it when choosing boundaries or reviewing refactors.

---

## Parallel agents and multitasking

Subagents do **not** share unstated context. **Default:** this conversation (lead) plans and integrates.

Use **parallel** work when tasks are independent (explore-only, disjoint files, clear splits). **Avoid** parallel **implementers** on the same seam without a written **handoff**:

- Goal and **non-goals**
- **Files or boundaries** allowed to touch
- **Interface / contract** to implement or preserve
- **Merge order** or dependency notes

What matters is **one coordinator** plus **written constraints**. **CONTEXT.md + ADRs** align agents; parallel work without a shared map ships contradictions.

---

## Definition of done (summary)

- **Lint / format:** no new issues in touched files (project linters / `read_lints` as available).
- **Verification:** automated tests where they exist; otherwise **explicit manual steps** for the human.
- **Contracts:** if you change public surfaces (HTTP APIs, CLI, schemas, shared types), update **consumers** and **caches / clients** in this repo so nothing stays stale.
- **Scope:** no drive-by refactors or unrequested features.

## When work is complete

Unless the human says otherwise:

1. **Commit** with a message that states what and why.
2. **Push** to the working branch.
3. **Deploy** when the project documents commands or hooks; if deploy target or credentials are unknown, **stop and ask** instead of guessing.

---

## Pairing principles that must not fight each other

- **DRY vs YAGNI:** dedupe when a **third** copy appears or inconsistency becomes a defect class — not when two lines merely look similar.
- **Boy Scout vs minimal diff:** improve only code paths you already touch for the task unless the human expands scope.
- **API-first / contract-first:** required when exposing or changing HTTP/RPC/CLI contracts; irrelevant when there is no such surface.

---

## Related

- [improve-codebase-architecture SKILL.md](https://github.com/mattpocock/skills/blob/main/skills/engineering/improve-codebase-architecture/SKILL.md)
- [grill-with-docs SKILL.md](https://github.com/mattpocock/skills/blob/main/skills/engineering/grill-with-docs/SKILL.md)
