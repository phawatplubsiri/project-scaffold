# init-agents.ps1 - Initialize .agents folder (minimal version)
# Usage: irm https://raw.githubusercontent.com/your-username/project-scaffold/main/init-agents.ps1 | iex

# Colors
$GREEN = "`e[0;32m"
$BLUE = "`e[0;34m"
$NC = "`e[0m"

Write-Host "${BLUE}🚀 Initializing .agents/ structure...${NC}`n"

# Create .agents folder structure (minimal)
Write-Host "📁 Creating .agents/ folder..."
$folders = @(
    ".agents",
    ".agents/contracts",
    ".agents/specs",
    ".agents/patterns"
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

## Read First
1. Read [AGENTS.md](AGENTS.md)
2. Read [active.md](active.md)
3. Review [contracts/api-contract.md](contracts/api-contract.md)

## Project Context
**Project:** [PROJECT_NAME]
**Architecture:** [FULLSTACK / BACKEND / FRONTEND]
**Team:** [YOUR_NAME]
**Frameworks:** [YOUR_FRAMEWORKS]
**Languages:** [YOUR_LANGUAGES]

## Your Responsibilities
DO:
- Implement ตาม spec เท่านั้น
- Read contracts ก่อนเปลี่ยน API
- Update active.md เมื่อทำเสร็จ
- Ask when unclear

DON'T:
- สร้าง field/endpoint เอง
- สมมติ backend behavior
- เปลี่ยน spec คนเดียว

## Risk Level
- **R0 (Stop & Ask):** Deploy, DB migration, git push main, delete data
- **R1 (Do & Tell):** Change API contract, architecture, dependencies
- **R2 (Just Do):** Feature, bug fix, refactor, UI change

## Important
1. Never assume API shape - check contracts/api-contract.md
2. Always reference specs/ before architecture changes
3. Document decisions in decisions/
4. Keep patterns/ updated
5. Update active.md with progress

---
**Version:** 1.0
**Created:** [DATE]
**Maintained By:** [YOUR_NAME]
"@
$claudeMd | Out-File -FilePath ".agents/CLAUDE.md" -Encoding UTF8 -Force

# Create AGENTS.md
Write-Host "📝 Creating AGENTS.md..."
$agentsMd = @"
# AI Boot Instructions

Read completely before working.

## Boot Sequence
1. Read [CLAUDE.md](CLAUDE.md) - Constraints
2. Read [active.md](active.md) - Current work
3. Check [contracts/api-contract.md](contracts/api-contract.md) - API shape
4. Review [specs/](specs/) - Architecture
5. Browse [patterns/](patterns/) - How we do things

## What to Do
- Implement features per spec
- Check contracts before API changes
- Update active.md with progress
- Ask for clarification when unclear

## What NOT to Do
- Assume API shape
- Skip documentation
- Modify specs without discussion
- Ignore risk levels from CLAUDE.md

---
**Version:** 1.0
"@
$agentsMd | Out-File -FilePath ".agents/AGENTS.md" -Encoding UTF8 -Force

# Create active.md
Write-Host "📝 Creating active.md..."
$activeMd = @"
# Current Development Status

## Current Task
- **Task:** [WHAT_ARE_YOU_DOING]
- **Status:** planned / in_progress / blocked / completed
- **Started:** [DATE]

## What's Done
- [ ] Task 1
- [ ] Task 2

## What's Next
- [ ] Next task 1
- [ ] Next task 2

## Key Context
(Important context for next agent)

## Session History

### Session 1 - [DATE]
- Completed: [WHAT_YOU_DID]
- Blocker: [IF_ANY]
- Next: [WHAT_TO_DO]

---
**Last Updated:** [DATE]
**Next Agent:** [WHO]
"@
$activeMd | Out-File -FilePath ".agents/active.md" -Encoding UTF8 -Force

# Create contracts/api-contract.md
Write-Host "📝 Creating contracts/api-contract.md..."
$apiContractMd = @"
# API Contract

**Status:** IN_PROGRESS
**Last Updated:** [DATE]
**Maintained By:** [NAME]

## Current APIs

(Will be filled when building features)

### Template
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

---
**IMPORTANT:** This is the single source of truth for API shape.
"@
$apiContractMd | Out-File -FilePath ".agents/contracts/api-contract.md" -Encoding UTF8 -Force

# Create contracts/README.md
Write-Host "📝 Creating contracts/README.md..."
$contractsReadme = @"
# System Contracts

**api-contract.md** - API endpoints, request/response types, error codes

Rules:
- All APIs MUST be documented here
- Update BEFORE implementing
- All teams reference this
"@
$contractsReadme | Out-File -FilePath ".agents/contracts/README.md" -Encoding UTF8 -Force

# Create specs/README.md
Write-Host "📝 Creating specs/README.md..."
$specsReadme = @"
# Technical Specifications

Architecture and design documents.

Files:
- architecture.md - System design
- database.md - Data model
- [feature].md - Feature specs
"@
$specsReadme | Out-File -FilePath ".agents/specs/README.md" -Encoding UTF8 -Force

# Create patterns/README.md
Write-Host "📝 Creating patterns/README.md..."
$patternsReadme = @"
# Established Patterns

Record patterns you discover and reuse.

Files:
- naming-conventions.md
- error-handling.md
- testing.md
- api-patterns.md
"@
$patternsReadme | Out-File -FilePath ".agents/patterns/README.md" -Encoding UTF8 -Force

# Try to add to git
$isGitRepo = git rev-parse --git-dir 2>$null
if ($LASTEXITCODE -eq 0) {
    Write-Host "🔧 Adding to git..."
    git add .agents/ 2>$null
    git commit -m "Initialize .agents/ structure" 2>$null
}

Write-Host "`n${GREEN}✅ Setup complete!${NC}`n"
Write-Host "📋 Created:"
Write-Host "   ✓ .agents/CLAUDE.md (AI constitution)"
Write-Host "   ✓ .agents/AGENTS.md (Boot instructions)"
Write-Host "   ✓ .agents/active.md (Current work + history)"
Write-Host "   ✓ .agents/contracts/api-contract.md"
Write-Host "   ✓ .agents/specs/"
Write-Host "   ✓ .agents/patterns/"
Write-Host ""
Write-Host "📝 TODO:"
Write-Host "   1. Update placeholders: [PROJECT_NAME], [DATE], etc"
Write-Host "   2. Fill active.md with current work"
Write-Host "   3. Add APIs to contracts/api-contract.md"
Write-Host ""
Write-Host "${GREEN}Ready for any AI agent! 🚀${NC}"
