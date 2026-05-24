# init-agents-monorepo.ps1 - Initialize AI Workspace (Monorepo)
# Usage: irm https://raw.githubusercontent.com/your-username/project-scaffold/main/init-agents-monorepo.ps1 | iex

# Colors
$GREEN = "`e[0;32m"
$BLUE = "`e[0;34m"
$YELLOW = "`e[1;33m"
$NC = "`e[0m"

Write-Host "${BLUE}🚀 Initializing AI Agents Workspace (Monorepo)...${NC}`n"

# 1. Create .agents folder structure
Write-Host "📁 Creating .agents/ folder structure..."
$folders = @(
    ".agents",
    ".agents/contracts"
)

foreach ($folder in $folders) {
    if (-not (Test-Path $folder)) {
        New-Item -ItemType Directory -Path $folder -Force | Out-Null
    }
}

# 2. Create CLAUDE.md at ROOT
Write-Host "📝 Creating CLAUDE.md..."
$claudeMd = @"
# AI Constitution for [PROJECT_NAME]

## 1. Project Info
- **Name:** [PROJECT_NAME]
- **Type:** Monorepo (FE + BE together)
- **Frontend:** [e.g., React Native]
- **Backend:** [e.g., NestJS]
- **Team:** You + AI agents

## 2. Read These Files First
1. .agents/SKILL.md (boot instructions + project context)
2. .agents/active.md (what to do)
3. .agents/contracts/api-contract.md (API rules)

## 3. DO ✅
- Follow .agents/contracts/api-contract.md exactly
- Update .agents/active.md when done
- Keep it clean (remove old tasks to save tokens)
- Ask if unclear

## 4. DON'T ❌
- Create API fields on your own
- Assume what API returns
- Deploy without asking
- Mix FE and BE folders

## 5. Risk Level
- **R0 (Ask First):** Deploy, DB changes, git push main
- **R1 (Tell After):** Change API contract
- **R2 (Just Do):** Features, bug fixes, refactor

---
**Created:** $(Get-Date -Format 'yyyy-MM-dd')
**Maintained By:** [YOUR_NAME]
"@
$claudeMd | Out-File -FilePath "CLAUDE.md" -Encoding UTF8 -Force

# 3. Create SKILL.md (AGENTS + SKILL combined)
Write-Host "📝 Creating .agents/SKILL.md..."
$skillMd = @"
# 🚀 Boot Instructions + Project Context
---

## Project Overview

### Architecture
- **Frontend:** Located in \`/frontend\` folder
- **Backend:** Located in \`/backend\` folder
- **Shared:** Everything in \`.agents/\` is shared

### Tech Stack
- Frontend: [e.g., React Native + TypeScript]
- Backend: [e.g., NestJS + PostgreSQL]
- Database: [e.g., PostgreSQL]

### Key Folders
\`\`\`
project/
├── frontend/          ← FE code here
├── backend/           ← BE code here
├── CLAUDE.md          ← AI rules
└── .agents/           ← Shared context
    ├── SKILL.md       ← This file
    ├── active.md      ← Current work
    └── contracts/
        └── api-contract.md  ← API truth
\`\`\`

---

## What to Do

### 1. Check active.md
- See current task
- See blockers
- See what's next

### 2. Check contracts/api-contract.md
- **Never assume** API shape
- Always follow the contract
- If API doesn't match → STOP and ask

### 3. Follow Patterns
- Keep code style consistent
- Follow naming conventions
- Check if similar code exists

### 4. Update active.md
- When you start → mark as \`in_progress\`
- When you finish → mark as \`done\`
- Keep session history (last 3 sessions only!)
- Note blockers if stuck

---

## Common Tasks

### Adding a New API
1. Check contracts/api-contract.md
2. Create contract FIRST (before coding)
3. Implement in backend
4. Test with frontend
5. Update active.md

### Fixing a Bug
1. Understand the issue (check active.md)
2. Check if it's API-related (check contracts/)
3. Fix the code
4. Test thoroughly
5. Update active.md with "done"

### Creating a Feature
1. Read CLAUDE.md for rules
2. Check contracts/ for API shape
3. Implement step by step
4. Test with both FE and BE
5. Update active.md

---

## Important Rules

### Rule 1: Contract is Law
- If code doesn't match contract → change code, not contract
- Update contract BEFORE coding
- Both FE and BE must follow same contract

### Rule 2: Update Daily
- Every session → update active.md
- Every task done → mark as done
- Every blocker → document it

---

## Getting Help

| Question | Answer |
|----------|--------|
| "What's the API shape?" | contracts/api-contract.md |
| "What should I do?" | active.md |
| "Why this way?" | CLAUDE.md |
| "How does this work?" | This file (SKILL.md) |

---

## Next Steps
1. Read CLAUDE.md
2. Read active.md
3. Check contracts/api-contract.md
4. Start working!

---
**Version:** 1.0
**Updated:** $(Get-Date -Format 'yyyy-MM-dd')
"@
$skillMd | Out-File -FilePath ".agents/SKILL.md" -Encoding UTF8 -Force

# 4. Create active.md
Write-Host "📝 Creating .agents/active.md..."
$activeMd = @"
# 📍 Active Status

## 🎯 Right Now
- **Task:** [What I'm doing]
- **Status:** planned / in_progress / blocked / done

## ✅ Done
- [x] Example task 1
- [ ] ...

## 🚀 Next (For Next Agent)
- [ ] Next task 1
- [ ] Next task 2

## 🚧 Blockers
- [None / description of problem]

## 📝 Notes for Next Agent
[Important info to pass on]

## 🕒 Last 3 Sessions (Keep recent only!)
### $(Get-Date -Format 'yyyy-MM-dd') - [Agent Name]
- **Did:** [What was completed]
- **Next:** [What to do next]

---
**Last Updated:** $(Get-Date -Format 'yyyy-MM-dd') | **Next Agent:** [Name]
"@
$activeMd | Out-File -FilePath ".agents/active.md" -Encoding UTF8 -Force

# 5. Create contracts/api-contract.md
Write-Host "📝 Creating .agents/contracts/api-contract.md..."
$apiContractMd = @"
# 📜 API Contract (Single Source of Truth)

**Rule:** This is the TRUTH. Both FE & BE must follow it exactly.

## Current APIs

### Example: Login
\`\`\`
POST /api/auth/login

Request:
{
  "email": "string",
  "password": "string"
}

Response (200):
{
  "token": "string",
  "user": {
    "id": "number",
    "name": "string",
    "email": "string"
  }
}

Errors:
- 400: Invalid email/password
- 422: Validation error
- 500: Server error
\`\`\`

---

### [Add more APIs here as needed]

---

## Rules
✅ All APIs must be documented here  
✅ Update BEFORE coding  
✅ Both FE and BE follow this exactly  
❌ Never skip documentation  

**Important:** Update this file FIRST, code SECOND
"@
$apiContractMd | Out-File -FilePath ".agents/contracts/api-contract.md" -Encoding UTF8 -Force

# 6. Try to add to git
$isGitRepo = git rev-parse --git-dir 2>$null
if ($LASTEXITCODE -eq 0) {
    Write-Host "🔧 Adding to git..."
    git add CLAUDE.md .agents/ 2>$null
    git commit -m "chore: Initialize AI Agents workspace (Monorepo)" 2>$null
}

Write-Host "`n${GREEN}✅ Setup complete!${NC}`n"
Write-Host "📋 Files Created:"
Write-Host "  ${YELLOW}./CLAUDE.md${NC}                    <-- Rules"
Write-Host "  ./.agents/${YELLOW}SKILL.md${NC}              <-- Boot + Context"
Write-Host "  ./.agents/${YELLOW}active.md${NC}              <-- Current Work"
Write-Host "  ./.agents/contracts/${YELLOW}api-contract.md${NC} <-- API Truth"
Write-Host ""
Write-Host "📝 ${YELLOW}Next Steps:${NC}"
Write-Host "  1. Update [PROJECT_NAME] in CLAUDE.md"
Write-Host "  2. Update [YOUR_NAME] in CLAUDE.md"
Write-Host "  3. Fill .agents/SKILL.md with your tech details"
Write-Host "  4. Add your first task to .agents/active.md"
Write-Host "  5. Add your APIs to .agents/contracts/api-contract.md"
Write-Host ""
Write-Host "${GREEN}Ready for AI Collaboration! 🚀${NC}"