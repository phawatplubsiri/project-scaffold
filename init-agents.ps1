# init-agents.ps1 - Initialize .agents folder structure
# Usage: irm https://raw.githubusercontent.com/your-username/project-scaffold/main/init-agents.ps1 | iex

# Colors
$GREEN = "`e[0;32m"
$BLUE = "`e[0;34m"
$YELLOW = "`e[1;33m"
$NC = "`e[0m"

Write-Host "${BLUE}🚀 Initializing .agents/ structure...${NC}`n"

# Create .agents folder structure
Write-Host "📁 Creating .agents/ folder..."
$folders = @(
    ".agents",
    ".agents/contracts",
    ".agents/specs",
    ".agents/patterns",
    ".agents/decisions",
    ".agents/handoffs",
    ".agents/sessions",
    ".agents/topics",
    ".agents/memory"
)

foreach ($folder in $folders) {
    if (-not (Test-Path $folder)) {
        New-Item -ItemType Directory -Path $folder -Force | Out-Null
    }
}

# Create CLAUDE.md
Write-Host "📝 Creating CLAUDE.md..."
$claudeMd = @"
# AI Constitution for [PROJECT_NAME]

## Read First (ตามลำดับ)
1. Read [AGENTS.md](AGENTS.md)
2. Read [active.md](active.md)
3. Review [contracts/](contracts/)

## Project Context
**Project:** [PROJECT_NAME]
**Architecture:** [FULLSTACK / BACKEND / FRONTEND]
**Team:** [YOUR_NAME]
**Frameworks:** [YOUR_FRAMEWORKS]
**Languages:** [YOUR_LANGUAGES]

## Your Responsibilities
- Implement ตาม spec เท่านั้น
- Read contracts ก่อนเปลี่ยน API
- Update active.md เมื่อทำเสร็จ
- Ask when unclear

- ห้ามสร้าง field/endpoint เอง
- ห้ามสมมติ backend behavior
- ห้ามเปลี่ยน spec คนเดียว

## Risk Level
- **R0 (Stop & Ask):** Deploy, DB migration, git push main, delete data
- **R1 (Do & Tell):** Change API contract, architecture, dependencies
- **R2 (Just Do):** Feature, bug fix, refactor, UI change

## Important Rules
1. Never assume API shape - check contracts/
2. Always reference specs/ before architecture changes
3. Document decisions in decisions/
4. Keep patterns/ updated with discoveries
5. Update active.md daily

---
**Version:** 1.0
**Created:** [DATE]
**Maintained By:** [YOUR_NAME]
"@
$claudeMd | Out-File -FilePath ".agents/CLAUDE.md" -Encoding UTF8

# Create AGENTS.md
Write-Host "📝 Creating AGENTS.md..."
$agentsMd = @"
# AI Boot Instructions

**Read completely before working.**

## Boot Sequence
1. Read [CLAUDE.md](CLAUDE.md) - Constraints & responsibilities
2. Read [active.md](active.md) - Current work status
3. Review [contracts/](contracts/) - API shape & data contracts
4. Check [specs/](specs/) - Architecture & design
5. Browse [patterns/](patterns/) - Established conventions
6. Check [decisions/](decisions/) - Why we chose this

## AI Modes

### Dev Mode
Implement features per spec
- Follow patterns from patterns/
- Reference specs/ for architecture
- Check contracts/ before API changes
- Add tests

### Review Mode
Check code for violations
- Compare against CLAUDE.md
- Check contract compliance
- Suggest pattern usage

### Doc Mode
Update documentation
- Add new patterns to patterns/
- Record decisions in decisions/
- Update specs/ when architecture changes
- Keep active.md current

### Advisory Mode
Answer questions
- Reference existing docs
- Suggest improvements
- Point to relevant specs

## Important Rules

DO:
- Read CLAUDE.md and active.md first
- Check contracts/ before API changes
- Update active.md with progress
- Ask for clarification when unclear

DO NOT:
- Assume API shape - check contracts/
- Ignore risk levels from CLAUDE.md
- Skip pattern documentation
- Modify specs without discussion

## Getting Help
- Architecture questions → specs/
- Implementation details → patterns/
- "Why?" questions → decisions/
- Current context → active.md
- Constraints → CLAUDE.md

---
**Version:** 1.0
**Last Updated:** [DATE]
"@
$agentsMd | Out-File -FilePath ".agents/AGENTS.md" -Encoding UTF8

# Create active.md
Write-Host "📝 Creating active.md..."
$activeMd = @"
# Current Development Status

## Current Task
- **Task:** [DESCRIBE_WHAT_YOU_DOING]
- **Status:** planned / in_progress / blocked / completed
- **Started:** [DATE]
- **Expected Finish:** [DATE]

## What's Done This Session
- [ ] Task 1
- [ ] Task 2

## What's Next
- [ ] Next task 1
- [ ] Next task 2

## Key Context
(Any important context for next agent)

## Blockers
(If any)

## Notes
(Anything else important)

---
**Last Updated:** [DATE]
**Next Agent:** [WHO]
"@
$activeMd | Out-File -FilePath ".agents/active.md" -Encoding UTF8

# Create contracts/api-contract.md
Write-Host "📝 Creating contracts/api-contract.md..."
$apiContractMd = @"
# API Contract

**Status:** IN_PROGRESS
**Last Updated:** [DATE]
**Maintained By:** [NAME]

## Current APIs

(Will be filled when building features)

### Example Template
\`\`\`
POST /auth/login
Request:
{
  "email": "string",
  "password": "string"
}

Response (200):
{
  "token": "string",
  "user": {
    "id": "string",
    "email": "string"
  }
}

Errors:
- 400: Invalid credentials
- 500: Server error
\`\`\`

## Rules
- All APIs MUST be documented here
- Changes require discussion first
- Never skip documentation

---
**IMPORTANT:** This is the single source of truth for API shape.
"@
$apiContractMd | Out-File -FilePath ".agents/contracts/api-contract.md" -Encoding UTF8

# Create contracts/README.md
Write-Host "📝 Creating contracts/README.md..."
$contractsReadme = @"
# System Contracts

Non-negotiable system boundaries and data shapes.

**Files:**
- api-contract.md - API endpoints & types
- data-contract.md - Data shapes

**Rules:**
- All teams MUST reference these
- Update BEFORE implementing
- Never deviate from contracts
"@
$contractsReadme | Out-File -FilePath ".agents/contracts/README.md" -Encoding UTF8

# Create specs/README.md
Write-Host "📝 Creating specs/README.md..."
$specsReadme = @"
# Technical Specifications

Architecture and design documents.

**Files:**
- architecture.md - System design
- database.md - Data model
- [feature].md - Feature specs

**When to read:** Before major features & changes
**When to update:** Architecture changes
"@
$specsReadme | Out-File -FilePath ".agents/specs/README.md" -Encoding UTF8

# Create patterns/README.md
Write-Host "📝 Creating patterns/README.md..."
$patternsReadme = @"
# Established Patterns

Record patterns you discover and reuse.

**Files:**
- naming-conventions.md
- error-handling.md
- testing.md
- api-patterns.md

**When to add:** When you discover a reusable approach
"@
$patternsReadme | Out-File -FilePath ".agents/patterns/README.md" -Encoding UTF8

# Create decisions/README.md
Write-Host "📝 Creating decisions/README.md..."
$decisionsReadme = @"
# Architecture Decision Records (ADRs)

Document significant architectural decisions.

## Format
\`\`\`
## ADR-001: [Title]
**Date:** [DATE]
**Status:** Accepted / Rejected / Deprecated

### Decision
What we decided.

### Reasoning
Why we chose this.

### Tradeoffs
What we gave up.
\`\`\`
"@
$decisionsReadme | Out-File -FilePath ".agents/decisions/README.md" -Encoding UTF8

# Create .gitignore for .agents
Write-Host "📝 Creating .gitignore..."
$gitignore = @"
# Local files only
/memory/*
!/memory/.gitkeep
"@
$gitignore | Out-File -FilePath ".agents/.gitignore" -Encoding UTF8

# Create .gitkeep files
@(".agents/handoffs/.gitkeep", ".agents/sessions/.gitkeep", ".agents/topics/.gitkeep", ".agents/memory/.gitkeep") | ForEach-Object {
    if (-not (Test-Path $_)) {
        New-Item -ItemType File -Path $_ -Force | Out-Null
    }
}

# Try to add to git if repo exists
$isGitRepo = git rev-parse --git-dir 2>$null
if ($LASTEXITCODE -eq 0) {
    Write-Host "🔧 Adding to git..."
    git add .agents/ 2>$null
    git commit -m "Initialize .agents/ structure" 2>$null
}

Write-Host "`n${GREEN}✅ Setup complete!${NC}`n"
Write-Host "📋 Created .agents/ with:"
Write-Host "   ✓ CLAUDE.md (AI constitution)"
Write-Host "   ✓ AGENTS.md (Boot instructions)"
Write-Host "   ✓ active.md (Current work)"
Write-Host "   ✓ contracts/ (API & data contracts)"
Write-Host "   ✓ specs/ (Architecture docs)"
Write-Host "   ✓ patterns/ (Code patterns)"
Write-Host "   ✓ decisions/ (ADRs)"
Write-Host ""
Write-Host "📝 TODO:"
Write-Host "   1. Update placeholders in .agents/CLAUDE.md"
Write-Host "   2. Fill .agents/active.md with current work"
Write-Host "   3. Add APIs to .agents/contracts/api-contract.md"
Write-Host ""
Write-Host "${GREEN}Ready to use with AI agents! 🚀${NC}"
