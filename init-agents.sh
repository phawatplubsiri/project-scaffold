# #!/bin/bash

# # Colors
# GREEN='\033[0;32m'
# BLUE='\033[0;34m'
# YELLOW='\033[1;33m'
# NC='\033[0m'

# echo -e "${BLUE}🚀 Initializing .agents/ structure...${NC}\n"

# # Create .agents folder structure
# echo "📁 Creating .agents/ folder..."
# mkdir -p .agents/{contracts,specs,patterns,decisions,handoffs,sessions,topics,memory}

# # Create CLAUDE.md
# echo "📝 Creating CLAUDE.md..."
# cat > .agents/CLAUDE.md << 'EOF'
# # AI Constitution for [PROJECT_NAME]

# ## Read First (ตามลำดับ)
# 1. Read [AGENTS.md](AGENTS.md)
# 2. Read [active.md](active.md)
# 3. Review [contracts/](contracts/)

# ## Project Context
# **Project:** [PROJECT_NAME]  
# **Architecture:** [FULLSTACK / BACKEND / FRONTEND]  
# **Team:** [YOUR_NAME]  
# **Frameworks:** [YOUR_FRAMEWORKS]  
# **Languages:** [YOUR_LANGUAGES]  

# ## Your Responsibilities
# - ✅ Implement ตาม spec เท่านั้น
# - ✅ Read contracts ก่อนเปลี่ยน API
# - ✅ Update active.md เมื่อทำเสร็จ
# - ✅ Ask when unclear

# - ❌ ห้ามสร้าง field/endpoint เอง
# - ❌ ห้ามสมมติ backend behavior
# - ❌ ห้ามเปลี่ยน spec คนเดียว

# ## Risk Level
# - **R0 (Stop & Ask):** Deploy, DB migration, git push main, delete data
# - **R1 (Do & Tell):** Change API contract, architecture, dependencies
# - **R2 (Just Do):** Feature, bug fix, refactor, UI change

# ## Important Rules
# 1. Never assume API shape - check contracts/
# 2. Always reference specs/ before architecture changes
# 3. Document decisions in decisions/
# 4. Keep patterns/ updated with discoveries
# 5. Update active.md daily

# ---
# **Version:** 1.0  
# **Created:** [DATE]  
# **Maintained By:** [YOUR_NAME]
# EOF

# # Create AGENTS.md
# echo "📝 Creating AGENTS.md..."
# cat > .agents/AGENTS.md << 'EOF'
# # AI Boot Instructions

# **Read completely before working.**

# ## Boot Sequence
# 1. Read [CLAUDE.md](CLAUDE.md) - Constraints & responsibilities
# 2. Read [active.md](active.md) - Current work status
# 3. Review [contracts/](contracts/) - API shape & data contracts
# 4. Check [specs/](specs/) - Architecture & design
# 5. Browse [patterns/](patterns/) - Established conventions
# 6. Check [decisions/](decisions/) - Why we chose this

# ## AI Modes

# ### 🛠️ Dev Mode
# Implement features per spec
# - Follow patterns from patterns/
# - Reference specs/ for architecture
# - Check contracts/ before API changes
# - Add tests

# ### 🔍 Review Mode
# Check code for violations
# - Compare against CLAUDE.md
# - Check contract compliance
# - Suggest pattern usage

# ### 📚 Doc Mode
# Update documentation
# - Add new patterns to patterns/
# - Record decisions in decisions/
# - Update specs/ when architecture changes
# - Keep active.md current

# ### 🤝 Advisory Mode
# Answer questions
# - Reference existing docs
# - Suggest improvements
# - Point to relevant specs

# ## Important Rules

# ✅ **DO:**
# - Read CLAUDE.md and active.md first
# - Check contracts/ before API changes
# - Update active.md with progress
# - Ask for clarification when unclear

# ❌ **DO NOT:**
# - Assume API shape - check contracts/
# - Ignore risk levels from CLAUDE.md
# - Skip pattern documentation
# - Modify specs without discussion

# ## Getting Help
# - Architecture questions → specs/
# - Implementation details → patterns/
# - "Why?" questions → decisions/
# - Current context → active.md
# - Constraints → CLAUDE.md

# ---
# **Version:** 1.0  
# **Last Updated:** [DATE]
# EOF

# # Create active.md
# echo "📝 Creating active.md..."
# cat > .agents/active.md << 'EOF'
# # Current Development Status

# ## Current Task
# - **Task:** [DESCRIBE_WHAT_YOU_DOING]
# - **Status:** planned / in_progress / blocked / completed
# - **Started:** [DATE]
# - **Expected Finish:** [DATE]

# ## What's Done This Session
# - [ ] Task 1
# - [ ] Task 2

# ## What's Next
# - [ ] Next task 1
# - [ ] Next task 2

# ## Key Context
# (Any important context for next agent)

# ## Blockers
# (If any)

# ## Notes
# (Anything else important)

# ---
# **Last Updated:** [DATE]  
# **Next Agent:** [WHO]
# EOF

# # Create contracts/api-contract.md
# echo "📝 Creating contracts/api-contract.md..."
# cat > .agents/contracts/api-contract.md << 'EOF'
# # API Contract

# **Status:** IN_PROGRESS  
# **Last Updated:** [DATE]  
# **Maintained By:** [NAME]

# ## Current APIs

# (Will be filled when building features)

# ### Example Template
# ```
# POST /auth/login
# Request:
# {
#   "email": "string",
#   "password": "string"
# }

# Response (200):
# {
#   "token": "string",
#   "user": {
#     "id": "string",
#     "email": "string"
#   }
# }

# Errors:
# - 400: Invalid credentials
# - 500: Server error
# ```

# ## Rules
# ✅ All APIs MUST be documented here  
# ✅ Changes require discussion first  
# ❌ Never skip documentation  

# ---
# **IMPORTANT:** This is the single source of truth for API shape.
# EOF

# # Create contracts/README.md
# echo "📝 Creating contracts/README.md..."
# cat > .agents/contracts/README.md << 'EOF'
# # System Contracts

# Non-negotiable system boundaries and data shapes.

# **Files:**
# - api-contract.md - API endpoints & types
# - data-contract.md - Data shapes

# **Rules:**
# ✅ All teams MUST reference these  
# ✅ Update BEFORE implementing  
# ❌ Never deviate from contracts
# EOF

# # Create specs/README.md
# echo "📝 Creating specs/README.md..."
# cat > .agents/specs/README.md << 'EOF'
# # Technical Specifications

# Architecture and design documents.

# **Files:**
# - architecture.md - System design
# - database.md - Data model
# - [feature].md - Feature specs

# **When to read:** Before major features & changes  
# **When to update:** Architecture changes
# EOF

# # Create patterns/README.md
# echo "📝 Creating patterns/README.md..."
# cat > .agents/patterns/README.md << 'EOF'
# # Established Patterns

# Record patterns you discover and reuse.

# **Files:**
# - naming-conventions.md
# - error-handling.md
# - testing.md
# - api-patterns.md

# **When to add:** When you discover a reusable approach
# EOF

# # Create decisions/README.md
# echo "📝 Creating decisions/README.md..."
# cat > .agents/decisions/README.md << 'EOF'
# # Architecture Decision Records (ADRs)

# Document significant architectural decisions.

# ## Format
# ```
# ## ADR-001: [Title]
# **Date:** [DATE]
# **Status:** Accepted / Rejected / Deprecated

# ### Decision
# What we decided.

# ### Reasoning
# Why we chose this.

# ### Tradeoffs
# What we gave up.
# ```
# EOF

# # Create .gitkeep files
# touch .agents/handoffs/.gitkeep
# touch .agents/sessions/.gitkeep
# touch .agents/topics/.gitkeep
# touch .agents/memory/.gitkeep

# # Create .gitignore for .agents
# cat > .agents/.gitignore << 'EOF'
# # Local files only
# /memory/*
# !/memory/.gitkeep
# EOF

# # Git commit (if git exists)
# if git rev-parse --git-dir > /dev/null 2>&1; then
#   echo "🔧 Adding to git..."
#   git add .agents/
#   git commit -m "Initialize .agents/ structure" 2>/dev/null || true
# fi

# echo -e "\n${GREEN}✅ Setup complete!${NC}\n"
# echo "📋 Created .agents/ with:"
# echo "   ✓ CLAUDE.md (AI constitution)"
# echo "   ✓ AGENTS.md (Boot instructions)"
# echo "   ✓ active.md (Current work)"
# echo "   ✓ contracts/ (API & data contracts)"
# echo "   ✓ specs/ (Architecture docs)"
# echo "   ✓ patterns/ (Code patterns)"
# echo "   ✓ decisions/ (ADRs)"
# echo ""
# echo "📝 TODO:"
# echo "   1. Update placeholders in .agents/CLAUDE.md"
# echo "   2. Fill .agents/active.md with current work"
# echo "   3. Add APIs to .agents/contracts/api-contract.md"
# echo ""
# echo -e "${GREEN}Ready to use with AI agents! 🚀${NC}"