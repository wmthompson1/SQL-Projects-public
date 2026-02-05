# GitHub Copilot Instructions Documentation

This document explains the GitHub Copilot instruction files configured for this repository.

## Overview

GitHub Copilot coding agent uses custom instruction files to understand how to work with this repository. These instructions help Copilot:
- Build and test code correctly
- Follow repository-specific coding standards
- Understand domain-specific patterns and conventions
- Make appropriate changes based on the file type being modified

## Instruction Files

### Repository-Wide Instructions

**File**: `.github/copilot-instructions.md` (243 lines)

This is the main instruction file that applies to all tasks in the repository. It includes:

- **Code Standards**: Clear build, test, and formatting commands
- **Architecture Overview**: Core components and data flow patterns
- **Database Conventions**: SQL Server connection patterns and schema standards
- **Development Workflows**: Python environment setup, schema extraction, ArangoDB usage
- **File Organization**: Documentation structure and naming conventions
- **Key Patterns**: PowerShell scripting, SQL data types, SSRS reports
- **Security Guidelines**: Credential management and secret handling
- **Common Pitfalls**: Known issues and how to avoid them

### Path-Specific Instructions

These files provide targeted guidance for specific types of files:

#### 1. Inventory Transaction Queries
**File**: `.github/instructions/INVENTORY_QUERIES.instructions.md` (42 lines)  
**Applies to**: `**/Data Models/Inventory_Transactions/*`

- Emphasizes that inventory queries span multiple related tables
- Provides document hierarchy and relationship guidance
- Includes example multi-table query patterns

#### 2. SQL Reports
**File**: `.github/instructions/SQL_REPORTS.instructions.md` (58 lines)  
**Applies to**: `**/SQL_Reports/**/*.sql`

- Enforces fully-qualified table naming: `Live.dbo.TABLE_NAME`
- Documents data type casting requirements
- Provides preferred join patterns
- Includes performance and testing considerations

#### 3. Python Scripts
**File**: `.github/instructions/PYTHON_SCRIPTS.instructions.md` (113 lines)  
**Applies to**: `**/scripts/**/*.py`

- Requires virtual environment usage
- Documents ArangoDB, NetworkX, and SQL Server connection patterns
- Enforces security best practices for credentials
- Provides error handling and testing guidelines

### Environment Setup

**File**: `.github/copilot-setup-steps.yml` (50 lines)

Pre-installs dependencies in Copilot's development environment:
- Python 3.11 with pip cache
- Core and development Python packages
- PowerShell for cross-platform script support
- Node.js 18 for package.json support
- Environment variable template (without secrets)

This ensures Copilot can immediately build, test, and validate changes without trial-and-error dependency installation.

## Best Practices Followed

This setup follows GitHub's official best practices for Copilot coding agent:

1. ✅ **Code Standards First**: Commands and guidelines at the top of main instruction file
2. ✅ **Path-Specific Instructions**: Targeted guidance using glob patterns and frontmatter
3. ✅ **Pre-Installed Dependencies**: `copilot-setup-steps.yml` for faster agent startup
4. ✅ **Clear Commands**: Explicit build, test, and validation commands
5. ✅ **Security Awareness**: Never commit secrets, use environment variables
6. ✅ **Repository Structure**: Clear explanation of file organization
7. ✅ **Examples**: Code snippets showing correct patterns

## How Copilot Uses These Instructions

When GitHub Copilot coding agent is assigned an issue:

1. **Loads repository-wide instructions** from `.github/copilot-instructions.md`
2. **Pre-installs dependencies** using `.github/copilot-setup-steps.yml`
3. **Applies path-specific instructions** based on files being modified:
   - Working on inventory queries? Uses `INVENTORY_QUERIES.instructions.md`
   - Editing SQL reports? Uses `SQL_REPORTS.instructions.md`
   - Modifying Python scripts? Uses `PYTHON_SCRIPTS.instructions.md`
4. **Follows guidelines** while making changes, running tests, and validating results

## Maintaining These Instructions

### When to Update

Update instruction files when:
- New coding standards or conventions are adopted
- Build, test, or deployment processes change
- New tools or frameworks are introduced
- Common mistakes or patterns emerge that should be documented

### How to Update

1. **Repository-wide changes**: Edit `.github/copilot-instructions.md`
2. **Path-specific guidance**: Add or modify files in `.github/instructions/`
3. **Environment changes**: Update `.github/copilot-setup-steps.yml`

### Validation

After updating instructions:
1. Check frontmatter syntax in `.instructions.md` files:
   ```yaml
   ---
   applyTo: "glob/pattern/**/*"
   ---
   ```
2. Ensure markdown formatting is correct
3. Test commands actually work in the development environment
4. Keep instructions concise but comprehensive

## Additional Resources

- [GitHub Copilot Best Practices](https://docs.github.com/en/copilot/tutorials/coding-agent/get-the-best-results)
- [Adding Custom Instructions](https://docs.github.com/en/copilot/how-tos/configure-custom-instructions/add-repository-instructions)
- [Creating Custom Agents](https://docs.github.com/en/copilot/how-tos/use-copilot-agents/coding-agent/create-custom-agents)
- [Customizing Development Environment](https://docs.github.com/en/copilot/customizing-copilot/customizing-the-development-environment-for-copilot-coding-agent)

## Summary

This repository now has comprehensive Copilot instructions that:
- ✅ Guide Copilot through common development tasks
- ✅ Enforce coding standards and conventions
- ✅ Provide domain-specific knowledge (SQL, manufacturing ERP)
- ✅ Speed up agent startup with pre-installed dependencies
- ✅ Reduce errors through clear examples and patterns

The instructions are organized logically and follow GitHub's recommended best practices for Copilot coding agent integration.
