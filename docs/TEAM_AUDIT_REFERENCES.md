# Team audit — references

Curated starting points for **team-auditor** web research. Verify freshness; supplement with search.

## Agent Skills (open standard)

- [Specification](https://agentskills.io/specification) — `SKILL.md` format, frontmatter, folder layout
- [Best practices](https://agentskills.io/skill-creation/best-practices) — descriptions, scoping, references/
- [Example skills](https://github.com/anthropics/skills) — community patterns; audit before adopting
- [skills-ref validator](https://github.com/agentskills/agentskills/tree/main/skills-ref) — run via `validate-kit.sh`

## Cursor platform

- [Cursor Skills](https://cursor.com/docs/context/skills) — skill format, discovery, when agents invoke skills
- [Cursor Rules](https://cursor.com/docs/context/rules) — alwaysApply vs glob rules
- [Cursor Subagents](https://cursor.com/docs/agent/subagents) — parallel Task delegation, lead integrates

## Multi-agent orchestration (general)

- **Orchestrator + specialists** — one user-facing coordinator, domain agents behind handoffs
- **Written handoffs** — goal, non-goals, allowed paths (see `handoff` skill)
- **Human gates** — pitch selection, Tier B+ plan approval, sensitive ops only
- **State files** — durable `.team/` or `CONTEXT.md`, not chat-only memory

## This user's existing assets

| Asset | Path | Use when |
|-------|------|----------|
| Universal standards | `docs/CURSOR_AGENT_STANDARDS.md` | Tier ceremony, pre-build, DoD |
| Grill + CONTEXT | `skills/engineering/grill-with-docs/` | Tier C, fuzzy domain |
| Architecture | `skills/engineering/improve-codebase-architecture/` | Refactors, boundaries |
| Foundation repo | `~/cursor-agent-foundation` | Re-apply or diff standards |

## Domain plugins (when pitch requires)

Check Cursor marketplace / Runlayer-managed MCPs before custom skills:

- Stripe → stripe-best-practices skill (if plugin installed)
- Notion → notion-workspace skills
- Security → security-review / mcp-security-audit

Propose `@creator` specialist only when plugin skills insufficient.

## Model selection heuristics

| Role type | Model tier |
|-----------|------------|
| Orchestrator, architect, auditor, principal review | Strongest reasoning |
| Implementation, tests | Strong coding |
| Research (structured) | Balanced + tools |
| Dashboard, formatter, github hygiene | Fast/cheap |

Run `@model-selector` to apply; auditor only recommends.

## Evaluating external suggestions (user or other AI)

The auditor **never** implements pasted ideas without evaluation.

| Question | Reject if… |
|----------|------------|
| In MVP scope? | Expands beyond `.team/selection.md` |
| Redundant? | Existing agent/skill already covers it |
| Worth the gate cost? | Adds human involvement without payoff |
| Tier fit? | Tier A project getting Tier C ceremony |
| Kit conflict? | Breaks orchestrator → tech-lead handoff model |

Verdicts: **Adopt | Adapt | Defer | Reject** — document all in `.team/team-audit.md`.

## Red flags in agent configs

- Two agents with overlapping mandate and no handoff boundary
- Skill referenced in rule but missing from repo
- Tier B+ agent with no pre-build-block awareness
- Opus-tier model on mechanical logging agents
- No human gate before editing agent fleet mid-build without audit sign-off
