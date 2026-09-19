# Start here (AI agents)

You are in an **app repo** or the **foundation** repo. Pick the path below.

## Working in an app repo (Risk-Manager, Auto, mullah, …)

1. **Read [`docs/WORKFLOW_ROUTER.md`](docs/WORKFLOW_ROUTER.md)** — single decision guide (foundation + pstack + Matt skills).
2. Follow [`docs/CURSOR_AGENT_STANDARDS.md`](docs/CURSOR_AGENT_STANDARDS.md) and this repo’s other `.cursor/rules/*.mdc`.

**Default for non-trivial Cursor work (if pstack installed):**

```text
/poteto-mode <goal>. Verify: <how we know it's done>.
```

**Still mandatory when router says so:** `skills/engineering/grill-with-docs/` (domain) and `improve-codebase-architecture/` (boundaries) — **before** implementation, even during poteto-mode.

## Foundation repo only (`cursor-agent-foundation`)

| Intent | Action |
|--------|--------|
| Bootstrap another project | [FOR_AGENTS.md](FOR_AGENTS.md) → Workflow A |
| Change universal standards | Edit here, tag release, re-run `scripts/apply-to-repo.sh` on app repos |

**Humans:** [README.md](README.md).
