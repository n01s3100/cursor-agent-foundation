# Cursor agent standards (universal)

Repo-agnostic playbook for AI agents and developers. **Stack- or product-specific rules** live in this repo’s other `.cursor/rules/` files and docs — this file is the shared baseline.

**Principle:** scale ceremony with irreversibility and blast radius — trivial work gets a sentence; expensive-to-reverse work gets heavier requirements and documentation.

**Vendored skills (full workflows):** `skills/engineering/grill-with-docs/` and `skills/engineering/improve-codebase-architecture/` (from [mattpocock/skills](https://github.com/mattpocock/skills)). When triggers below apply, follow those **SKILL.md** files in full — summaries in this doc are not enough.

---

## Mandatory workflows (not optional)

When a trigger applies, you **must** open and follow the linked **SKILL.md** end-to-end before writing implementation code (unless the human explicitly opts out for this task). **Tier A is exempt.**

### grill-with-docs — REQUIRED when

- **Tier C** or greenfield shaping
- Domain terms are fuzzy, conflicting, or new
- Human asks to stress-test, “grill”, or clarify a plan
- Before the first meaningful **`CONTEXT.md`** in a repo

**Skill:** [skills/engineering/grill-with-docs/SKILL.md](../skills/engineering/grill-with-docs/SKILL.md)  
**Formats:** [CONTEXT-FORMAT.md](../skills/engineering/grill-with-docs/CONTEXT-FORMAT.md), [ADR-FORMAT.md](../skills/engineering/grill-with-docs/ADR-FORMAT.md)

**You must:** one question at a time (wait for human feedback); explore codebase when that answers the question; challenge glossary conflicts; update **`CONTEXT.md` inline** (domain only, no implementation); offer ADRs only when all three criteria in ADR-FORMAT apply.

### improve-codebase-architecture — REQUIRED when

- Refactoring module boundaries, consolidation, or “make it more testable / navigable”
- Proposing splits/merges across modules or seams
- Human asks for architecture review or “deepening”

**Skill:** [skills/engineering/improve-codebase-architecture/SKILL.md](../skills/engineering/improve-codebase-architecture/SKILL.md)  
**Support:** [LANGUAGE.md](../skills/engineering/improve-codebase-architecture/LANGUAGE.md), [DEEPENING.md](../skills/engineering/improve-codebase-architecture/DEEPENING.md), [INTERFACE-DESIGN.md](../skills/engineering/improve-codebase-architecture/INTERFACE-DESIGN.md)

**You must:** read **`CONTEXT.md`** and relevant **`docs/adr/`** first; explore; present numbered **deepening candidates** (no interfaces yet); after human picks one, run the grilling loop; use module / interface / seam / adapter vocabulary only.

If `skills/engineering/` is missing in this repo, clone [cursor-agent-foundation](https://github.com/n01s3100/cursor-agent-foundation) or re-run its `scripts/apply-to-repo.sh` — do not improvise a shortened grill or architecture pass.

---

## Tiers

### Tier A — Trivial

Examples: typos, obvious one-liners, single config knobs, copy tweaks.

- **Before code:** one-sentence problem + what “done” means.
- **After code:** lint/tidy touched files; tests only if the area already requires them for that change class.
- **Mandatory skills:** none.

### Tier B — Default feature / bug / refactor

Anything that changes behaviour, data, APIs, auth, money, concurrency, or cross-cutting state — but not a new system.

- **Before code:** short **pre-build block** (below); human can reply “go” or confirm bullets — no formal PRD unless they ask.
- **Mandatory skills:** **grill-with-docs** if domain language is fuzzy; **improve-codebase-architecture** if the change is primarily structural refactor across modules.
- **After code:** definition of done (below) + **commit / push / deploy** when the repo defines how (ask if unclear).

### Tier C — Greenfield or large architectural change

New subsystem, major boundary moves, or “how the whole thing is shaped.”

- **Before code:** stronger requirements: overview, user flows, in/out of scope, stack, features, NFRs as appropriate; prefer reasoning order **functional → non-functional → domain → flows → data → API (if any) → architecture → code** without treating every tiny PR as a waterfall.
- **Mandatory skills:** **grill-with-docs** before implementation; **improve-codebase-architecture** when proposing module shape or refactors.
- **ADRs:** only when **all** of: hard to reverse; surprising without context; real trade-off ([ADR-FORMAT.md](../skills/engineering/grill-with-docs/ADR-FORMAT.md)).
- **PRD-style sign-off:** when the human wants it — not a blanket blocker for Tier B.

---

## Pre-build confirmation (Tier B and above)

Before implementation, produce:

1. **Problem** — What is wrong or missing? Who is affected? What is explicitly **out of scope**?
2. **Approach** — Steps and **which areas/files** you expect to touch (high level).
3. **Why it helps** — Correctness, maintainability, risk, or product outcome.
4. **Downsides / risks / follow-ups** — Trade-offs, edge cases, debt.
5. **Plan** — One recommended plan with a **3–7 item checkbox list**. If the wrong choice is costly (new boundaries, migrations, security), offer **at least two** options and recommend one.

If mandatory skill triggers apply, note in the plan: **“grill-with-docs first”** and/or **“architecture candidates before code”**.

For **non-trivial** debugging or design, use explicit **thought → action → observation**: reason, use tools, observe, correct before continuing.

**Tier A:** skip the block; one sentence is enough.

---

## Domain language and decisions

- **`CONTEXT.md`** (repo root or per-context): glossary + relationships + example dialogue — **domain only**. Format: [CONTEXT-FORMAT.md](../skills/engineering/grill-with-docs/CONTEXT-FORMAT.md). Maintain via **grill-with-docs** when triggers apply.
- **`docs/adr/`**: short records for structural decisions; criteria in [ADR-FORMAT.md](../skills/engineering/grill-with-docs/ADR-FORMAT.md).

---

## Architecture vocabulary (summary only)

When **improve-codebase-architecture** is not triggered, still prefer this language on small changes:

- **Module**, **interface**, **implementation**, **depth**, **seam**, **adapter** — see [LANGUAGE.md](../skills/engineering/improve-codebase-architecture/LANGUAGE.md).
- **Deletion test**, **interface is the test surface**, **one adapter = hypothetical seam; two = real seam**.

When the architecture skill **is** triggered, the SKILL.md process **overrides** this summary.

---

## Parallel agents and multitasking

Subagents do **not** share unstated context. **Default:** this conversation (lead) plans and integrates.

Use **parallel** work when tasks are independent (explore-only, disjoint files, clear splits). **Avoid** parallel **implementers** on the same seam without a written **handoff**:

- Goal and **non-goals**
- **Files or boundaries** allowed to touch
- **Interface / contract** to implement or preserve
- **Merge order** or dependency notes

**CONTEXT.md + ADRs** align agents; parallel work without a shared map ships contradictions.

---

## Definition of done (summary)

- **Lint / format:** no new issues in touched files.
- **Verification:** automated tests where they exist; otherwise **explicit manual steps**.
- **Contracts:** update consumers and caches/clients when public surfaces change.
- **Scope:** no drive-by refactors or unrequested features.

## When work is complete

Unless the human says otherwise:

1. **Commit** with a message that states what and why.
2. **Push** to the working branch.
3. **Deploy** when the project documents how; **ask** if unknown.

---

## Pairing principles that must not fight each other

- **DRY vs YAGNI:** dedupe when a **third** copy appears or inconsistency becomes a defect class.
- **Boy Scout vs minimal diff:** improve only paths you already touch unless scope expands.
- **API-first / contract-first:** when exposing or changing HTTP/RPC/CLI contracts.
