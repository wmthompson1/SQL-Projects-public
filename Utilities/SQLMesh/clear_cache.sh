#!/usr/bin/env bash
# clear_cache.sh - Clears SQLMesh cache and state, then optionally rebuilds
#
# SYNOPSIS
#     ./clear_cache.sh [--skip-rebuild] [--target-path PATH]
#
# DESCRIPTION
#     This script automates clearing SQLMesh's cached state (.cache folder and db.db file)
#     and optionally triggers a clean rebuild with `sqlmesh plan --auto-apply`.
#     
#     Use this when pulling updated models that have schema changes (renamed columns, etc.)
#     to force SQLMesh to rebuild from scratch with the correct column definitions.
#
# OPTIONS
#     --skip-rebuild      Only clears cache without running sqlmesh plan
#     --target-path PATH  Path to SQLMesh project directory (defaults to script directory)
#
# EXAMPLES
#     ./clear_cache.sh
#     # Clears cache and rebuilds automatically
#
#     ./clear_cache.sh --skip-rebuild
#     # Only clears cache without rebuilding
#
#     ./clear_cache.sh --target-path "/opt/projects/SQL-Projects/Utilities/SQLMesh"
#     # Clears cache in specified directory and rebuilds
#
# AUTHOR
#     GitHub Copilot
# VERSION
#     1.0
# CREATED
#     2026-02-05

set -e  # Exit on error

# Parse arguments
SKIP_REBUILD=false
TARGET_PATH="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

while [[ $# -gt 0 ]]; do
    case $1 in
        --skip-rebuild)
            SKIP_REBUILD=true
            shift
            ;;
        --target-path)
            TARGET_PATH="$2"
            shift 2
            ;;
        -h|--help)
            grep '^#' "$0" | sed 's/^# //' | sed 's/^#//'
            exit 0
            ;;
        *)
            echo "Unknown option: $1"
            echo "Use --help for usage information"
            exit 1
            ;;
    esac
done

# Colors
CYAN='\033[0;36m'
YELLOW='\033[1;33m'
GREEN='\033[0;32m'
GRAY='\033[0;90m'
RED='\033[0;31m'
NC='\033[0m' # No Color

echo -e "${CYAN}🧹 SQLMesh Cache Cleaner${NC}"
echo "============================================================"

# Validate target path
if [ ! -d "$TARGET_PATH" ]; then
    echo -e "${RED}Error: Target path does not exist: $TARGET_PATH${NC}"
    exit 1
fi

# Change to target directory
cd "$TARGET_PATH"
echo -e "${YELLOW}📂 Working directory: $TARGET_PATH${NC}"

# Check for config.yaml to confirm this is a SQLMesh project
if [ ! -f "config.yaml" ]; then
    echo -e "${YELLOW}Warning: No config.yaml found - this may not be a SQLMesh project directory${NC}"
    read -p "Continue anyway? (y/N) " -n 1 -r
    echo
    if [[ ! $REPLY =~ ^[Yy]$ ]]; then
        echo -e "${YELLOW}Aborted by user${NC}"
        exit 0
    fi
fi

# Clear .cache directory
if [ -d ".cache" ]; then
    echo -e "${YELLOW}🗑️  Removing .cache directory...${NC}"
    rm -rf .cache
    echo -e "${GREEN}   ✅ Removed .cache${NC}"
else
    echo -e "${GRAY}   ℹ️  .cache directory not found (already clean)${NC}"
fi

# Clear db.db file
if [ -f "db.db" ]; then
    echo -e "${YELLOW}🗑️  Removing db.db file...${NC}"
    rm -f db.db
    echo -e "${GREEN}   ✅ Removed db.db${NC}"
else
    echo -e "${GRAY}   ℹ️  db.db file not found (already clean)${NC}"
fi

# Note about local.db
if [ -f "local.db" ]; then
    echo -e "${GRAY}   ℹ️  local.db found (this is the SQLMesh state DB, keeping it)${NC}"
    echo -e "${GRAY}      If you want to clear local.db too, delete it manually${NC}"
fi

echo ""
echo -e "${GREEN}✅ Cache cleared successfully!${NC}"

# Rebuild if not skipped
if [ "$SKIP_REBUILD" = false ]; then
    echo ""
    echo -e "${CYAN}🔨 Rebuilding SQLMesh models...${NC}"
    echo -e "${GRAY}   Running: sqlmesh plan --auto-apply${NC}"
    echo ""
    
    # Check if sqlmesh is available
    if ! command -v sqlmesh &> /dev/null; then
        echo -e "${YELLOW}Warning: sqlmesh command not found. Please install SQLMesh or run manually:${NC}"
        echo -e "${YELLOW}   pip install sqlmesh${NC}"
        echo -e "${YELLOW}   sqlmesh plan --auto-apply${NC}"
        exit 0
    fi
    
    # Run sqlmesh plan
    if sqlmesh plan --auto-apply; then
        echo ""
        echo -e "${GREEN}✅ SQLMesh rebuild completed successfully!${NC}"
    else
        EXIT_CODE=$?
        echo -e "${YELLOW}Warning: SQLMesh plan returned exit code: $EXIT_CODE${NC}"
        echo -e "${YELLOW}You may need to review the output above for errors.${NC}"
    fi
else
    echo ""
    echo -e "${GRAY}ℹ️  Rebuild skipped (remove --skip-rebuild flag to rebuild)${NC}"
    echo -e "${GRAY}   To rebuild manually, run:${NC}"
    echo -e "${YELLOW}   sqlmesh plan --auto-apply${NC}"
fi

echo ""
echo "============================================================"
echo -e "${GREEN}✨ Done!${NC}"
