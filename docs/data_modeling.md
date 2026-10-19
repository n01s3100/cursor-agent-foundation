# Data modeling (domain + persistence)

Use this with **`CONTEXT.md`** (language) and **`docs/adr/`** (hard-to-reverse structural choices). Not a substitute for [grill-with-docs](../skills/engineering/grill-with-docs/SKILL.md) on Tier C work.

## When to update what

| Artifact | Purpose |
|----------|---------|
| **`CONTEXT.md`** | Business terms, relationships, example dialogue — **no table/column names** |
| **`docs/data_modeling.md`** (this file, in app repos) | Entities, keys, cardinality, lifecycle, integration boundaries — **project-specific** sections below |
| **`docs/adr/`** | Decisions that are hard to reverse, surprising, or real trade-offs — see [adr/template.md](adr/template.md) |
| **Feature / module docs** | `docs/features/<name>.md` for shipped behavior |

## Minimum bar before Tier B+ data work

1. Read existing **`CONTEXT.md`** and any ADRs touching the area.
2. Name **entities** and **identifiers** consistently with the glossary.
3. State **source of truth** (which system owns writes) and **references** (ID-only across boundaries).
4. Call out **idempotency**, **retention**, and **PII/compliance** if relevant.

## Project-specific model (edit in app repos)

<!-- Agents: replace this section per repo (e.g. Mullah Fabric tables, Risk-Manager plans/trades). -->

_No project-specific entities documented yet._ Run grill-with-docs or `@project-orchestrator` intake before large schema or pipeline changes.

## Related

- [CURSOR_AGENT_STANDARDS.md](CURSOR_AGENT_STANDARDS.md) — tiers, ADR criteria
- [skills/engineering/grill-with-docs/CONTEXT-FORMAT.md](../skills/engineering/grill-with-docs/CONTEXT-FORMAT.md)
- [skills/engineering/grill-with-docs/ADR-FORMAT.md](../skills/engineering/grill-with-docs/ADR-FORMAT.md)
- After bootstrap: [cursor-agent-foundation](https://github.com/n01s3100/cursor-agent-foundation) → `docs/WORKFLOW_ROUTER.md`
