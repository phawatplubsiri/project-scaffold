# init-agents-multirepo.ps1 - Initialize .agents folder for polyrepo (multi-repo)
# Usage: irm https://raw.githubusercontent.com/your-username/project-scaffold/main/init-agents-multirepo.ps1 | iex

# Colors
$GREEN = "`e[0;32m"
$BLUE = "`e[0;34m"
$NC = "`e[0m"

Write-Host "${BLUE}🚀 Initializing .agents/ for POLYREPO...${NC}`n"

# Create .agents folder structure
Write-Host "📁 Creating .agents/ folder..."
$folders = @(
    ".agents",
    ".agents/contracts",
    ".agents/specs",
    ".agents/patterns",
    ".agents/handoffs"
)

foreach ($folder in $folders) {
    if (-not (Test-Path $folder)) {
        New-Item -ItemType Directory -Path $folder -Force | Out-Null
    }
}

# Create CLAUDE.md (Polyrepo Version - STRICT)
Write-Host "📝 Creating CLAUDE.md (Polyrepo)..."
$claudeMd = @"
# AI Constitution for [PROJECT_NAME] - POLYREPO

## IMPORTANT: Multi-Repo Protocol
This is a **POLYREPO** setup. FE, BE, and Contracts are in SEPARATE repositories.

## Read First
1. Read [AGENTS.md](AGENTS.md)
2. Read [active.md](active.md)
3. **CRITICAL:** Read [contracts/api-contract.md](contracts/api-contract.md)

## Project Context
**Project:** [PROJECT_NAME]
**Type:** POLYREPO (separate repos)
**Frontend Repo:** [LINK_TO_FE_REPO]
**Backend Repo:** [LINK_TO_BE_REPO]
**Frameworks:** [YOUR_FRAMEWORKS]
**Languages:** [YOUR_LANGUAGES]

## API Contract - SINGLE SOURCE OF TRUTH
**Location:** contracts/api-contract.md
**Rule:** NEVER modify without syncing other repos
**How to sync:** Use handoff notes (see below)

## Your Responsibilities

### DO:
- Read contracts/api-contract.md BEFORE any API changes
- Implement EXACTLY as spec says
- Create HANDOFF note when done
- Update active.md daily
- Ask for clarification

### DON'T:
- Assume API field names
- Create new API fields without contract update
- Assume response shape
- Skip contract review
- Deploy without handoff

## Multi-Repo Handoff Protocol

### When You Finish Work:
1. Create `.agents/handoffs/HANDOFF-[feature]-[date].md`
2. Document:
   - What you implemented
   - API endpoint & response shape (copy from contract)
   - Data types
   - Error codes
   - What's next for other repo
3. Commit to git
4. **Notify:** Other repos to read your handoff

### When Receiving Handoff:
1. Read `.agents/handoffs/HANDOFF-*.md`
2. Verify contracts/api-contract.md matches
3. Implement accordingly
4. Create your own handoff when done

## Risk Level (STRICT for Polyrepo)

### R0 (STOP & ASK) - NEVER do alone
- Deploy to production
- Database migration
- Modify API contract
- git push to main
→ Must ask other repos first

### R1 (DO & REPORT) - Do but notify
- Add new API field (update contract FIRST)
- Change response structure (update contract FIRST)
- Change error codes (update contract FIRST)
→ Create handoff note immediately

### R2 (JUST DO)
- Feature implementation (per contract)
- Bug fixes
- Refactor code
- UI improvements
→ Update active.md with progress

## CRITICAL Rules for Polyrepo

1. **Contract is Law** - Never deviate from contracts/api-contract.md
2. **Sync First** - Before any API change, update contract in BOTH repos
3. **Handoff Always** - When done, create handoff note for other repos
4. **No Assumptions** - If unsure about API, ask in handoff or CLAUDE.md
5. **Document Changes** - Every API change must be in contracts/

## Example: Implementing Login Feature

```
BACKEND:
1. Read contracts/api-contract.md
2. Check if POST /auth/login exists
3. If not → Create handoff: "Need to add POST /auth/login"
4. Wait for Frontend to confirm contract
5. Implement exactly as contract says
6. Create handoff: "Login API ready. Response shape: {...}"

FRONTEND:
1. Read Backend's handoff
2. Verify contracts/api-contract.md has POST /auth/login
3. Implement login form
4. Test with Backend handoff data
5. Create handoff: "Login form ready, ready for integration"
```

## Getting Help
- API questions → contracts/api-contract.md
- Architecture → specs/
- Code patterns → patterns/
- Current work → active.md
- Other repos → handoffs/

---
**Version:** 1.0
**Created:** [DATE]
**Maintained By:** [YOUR_NAME]
**Repos:** [LIST_ALL_REPO_LINKS]
"@
$claudeMd | Out-File -FilePath ".agents/CLAUDE.md" -Encoding UTF8 -Force

# Create AGENTS.md
Write-Host "📝 Creating AGENTS.md..."
$agentsMd = @"
# AI Boot Instructions - POLYREPO

Read completely before working.

## Boot Sequence
1. Read [CLAUDE.md](CLAUDE.md) - **CRITICAL for polyrepo**
2. Read [active.md](active.md) - Current work
3. Check [contracts/api-contract.md](contracts/api-contract.md) - API shape
4. Review [handoffs/](handoffs/) - What other repos did
5. Browse [specs/](specs/) - Architecture
6. Check [patterns/](patterns/) - How we code

## Polyrepo Rules
- **Contract = Single Source of Truth**
- **Sync handoffs** with other repos
- **Never assume** API shape
- **Update contract first** before API changes

## What to Do
- Implement per contract
- Check handoffs from other repos
- Create handoff when done
- Update active.md daily

## What NOT to Do
- Don't assume API fields
- Don't skip contract review
- Don't modify contracts alone
- Don't deploy without handoff sync

## If You Get Stuck
1. Check CLAUDE.md for rules
2. Read contracts/api-contract.md again
3. Check handoffs/ from other repos
4. Ask in active.md "blocked: [reason]"

---
**Polyrepo Mode Active**
"@
$agentsMd | Out-File -FilePath ".agents/AGENTS.md" -Encoding UTF8 -Force

# Create active.md
Write-Host "📝 Creating active.md..."
$activeMd = @"
# Current Development Status - POLYREPO

## Current Task
- **Task:** [WHAT_ARE_YOU_DOING]
- **Repository:** [FE / BE / CONTRACTS]
- **Status:** planned / in_progress / blocked / completed
- **Started:** [DATE]

## What's Done
- [ ] Task 1
- [ ] Task 2

## What's Next
- [ ] Next task 1
- [ ] Next task 2

## Waiting For (Handoff from other repos)
- [ ] [REPO_NAME]: [WHAT_YOU_NEED]

## Blockers
(If any - describe and create handoff for others)

## Session History

### Session 1 - [DATE]
- Repo: [FE/BE/CONTRACTS]
- Completed: [WHAT_YOU_DID]
- Handoff: [CREATED_HANDOFF_FILE]
- Next: [WHAT_TO_DO]

---
**Last Updated:** [DATE]
**This Repo:** [FE / BE / CONTRACTS]
**Next Agent:** [WHO]
"@
$activeMd | Out-File -FilePath ".agents/active.md" -Encoding UTF8 -Force

# Create contracts/api-contract.md
Write-Host "📝 Creating contracts/api-contract.md..."
$apiContractMd = @"
# API Contract - SINGLE SOURCE OF TRUTH

**IMPORTANT:** This file exists in BOTH FE and BE repos. Keep them SYNCHRONIZED.

**Status:** IN_PROGRESS
**Last Updated:** [DATE]
**Maintained By:** [NAME]
**Repos:** FE & BE must sync this file

## Sync Rules
- Any change here affects BOTH repos
- FE & BE must update SIMULTANEOUSLY
- Use handoff notes to communicate changes
- Never skip this file

## Current APIs

(Will be filled when building features)

### Example: Authentication

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
    "email": "string",
    "name": "string"
  }
}

Errors:
- 400: Invalid credentials
- 422: Validation error
- 500: Server error
\`\`\`

## Usage
1. Backend: Implement this endpoint
2. Backend: Create handoff with actual response
3. Frontend: Read handoff + contract
4. Frontend: Implement based on contract
5. Both: Verify response matches contract

---
**CRITICAL:** Keep FE and BE versions identical
Update both repos when contract changes
"@
$apiContractMd | Out-File -FilePath ".agents/contracts/api-contract.md" -Encoding UTF8 -Force

# Create contracts/README.md
Write-Host "📝 Creating contracts/README.md..."
$contractsReadme = @"
# System Contracts - POLYREPO

**api-contract.md** - THE single source of truth for API

## Rules
- This file must be IDENTICAL in FE & BE repos
- Any change requires SYNC between repos
- Use handoff notes to notify other repo
- Never deviate from this contract

## How to Update Contract
1. Create handoff: "Need to add/change [API]"
2. Sync with other repo first
3. Both repos update contract.md
4. Both repos git commit together
5. Both repos acknowledge in active.md
"@
$contractsReadme | Out-File -FilePath ".agents/contracts/README.md" -Encoding UTF8 -Force

# Create specs/README.md
Write-Host "📝 Creating specs/README.md..."
$specsReadme = @"
# Technical Specifications - POLYREPO

Architecture and design documents.

Files:
- architecture.md - System design (shared between repos)
- database.md - Data model
- [feature].md - Feature specs

When to read: Before major features & changes
When to update: Architecture changes (sync between repos)
"@
$specsReadme | Out-File -FilePath ".agents/specs/README.md" -Encoding UTF8 -Force

# Create patterns/README.md
Write-Host "📝 Creating patterns/README.md..."
$patternsReadme = @"
# Established Patterns - POLYREPO

Code patterns and conventions.

Files:
- naming-conventions.md
- error-handling.md
- testing.md
- api-patterns.md

Note: Try to keep patterns similar across FE & BE
Share good patterns via handoff notes
"@
$patternsReadme | Out-File -FilePath ".agents/patterns/README.md" -Encoding UTF8 -Force

# Create handoff template
Write-Host "📝 Creating HANDOFF-template.md..."
$handoffTemplate = @"
# HANDOFF - [FEATURE_NAME] - [DATE]

## From Repo: [FE / BE / CONTRACTS]
## To Repo: [FE / BE / CONTRACTS]

## What's Done
- [LIST_WHAT_YOU_COMPLETED]
- [EXAMPLE: Implemented POST /auth/login endpoint]

## API Changes
If you changed contracts/api-contract.md:
\`\`\`
POST /auth/login
Request: { email, password }
Response (200): { token, user: { id, email, name } }
Errors: 400, 422, 500
\`\`\`

## Important Details
- Data types: [DESCRIBE]
- Error handling: [DESCRIBE]
- Dependencies: [LIST_ANY]
- Test data: [PROVIDE_IF_NEEDED]

## What's Next
- [What the other repo should do]
- [Any blockers]
- [Timeline]

## Ready For
- [ ] FE: Implement login form
- [ ] BE: Add password reset
- [ ] Both: Integration testing

---
**From:** [YOUR_NAME]
**Date:** [DATE]
**Repo:** [FE/BE/CONTRACTS]
**Status:** Ready / Waiting / Blocked
"@
$handoffTemplate | Out-File -FilePath ".agents/handoffs/HANDOFF-template.md" -Encoding UTF8 -Force

# Try to add to git
$isGitRepo = git rev-parse --git-dir 2>$null
if ($LASTEXITCODE -eq 0) {
    Write-Host "🔧 Adding to git..."
    git add .agents/ 2>$null
    git commit -m "Initialize .agents/ for POLYREPO with handoff protocol" 2>$null
}

Write-Host "`n${GREEN}✅ Setup complete - POLYREPO MODE!${NC}`n"
Write-Host "📋 Created for Multi-Repo Setup:"
Write-Host "   ✓ .agents/CLAUDE.md (Strict polyrepo rules)"
Write-Host "   ✓ .agents/AGENTS.md (Polyrepo boot)"
Write-Host "   ✓ .agents/active.md (Task + handoff tracking)"
Write-Host "   ✓ .agents/contracts/api-contract.md (Shared contract)"
Write-Host "   ✓ .agents/handoffs/ (Handoff protocol)"
Write-Host "   ✓ .agents/specs/ & patterns/"
Write-Host ""
Write-Host "📝 TODO:"
Write-Host "   1. Update placeholders in .agents/CLAUDE.md"
Write-Host "   2. Add repo links (FE, BE) to CLAUDE.md"
Write-Host "   3. Fill .agents/contracts/api-contract.md"
Write-Host "   4. Sync this .agents/ folder with other repos"
Write-Host "   5. Use .agents/handoffs/ for inter-repo communication"
Write-Host ""
Write-Host "🔄 IMPORTANT: Sync contracts/api-contract.md across all repos!"
Write-Host ""
Write-Host "${GREEN}Ready for polyrepo + AI agents! 🚀${NC}"
