# Project Scaffold - AI Context Kit

Quick setup for AI agents (Claude Code, Cursor, etc) to understand your project.

## For Monorepo (FE + BE in same repo)
```powershell
irm https://raw.githubusercontent.com/your-username/project-scaffold/main/init-agents-monorepo.ps1 | iex
```

## For Polyrepo (FE & BE separate repos)
```powershell
irm https://raw.githubusercontent.com/your-username/project-scaffold/main/init-agents-multirepo.ps1 | iex
```

## What Gets Created
- .agents/CLAUDE.md (AI constitution)
- .agents/AGENTS.md (Boot instructions)
- .agents/active.md (Current work)
- .agents/contracts/api-contract.md
- .agents/specs/
- .agents/patterns/

## Next Steps
1. Update placeholders in .agents/CLAUDE.md
2. Fill .agents/active.md with current work
3. Add APIs to contracts/api-contract.md