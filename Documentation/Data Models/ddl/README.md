Data Models (DDL) — Receivables-related tables

This folder contains initial DDL templates for tables referenced by `Receivables.sql`.

Purpose:
- Capture minimal column definitions (types and keys) for onboarding, documentation, and downstream data model work.
- Provide a starting point for generating full DDLs that can be validated against production.

Notes and assumptions:
- Column selections and types are inferred from usage in `Receivables.sql` (packlist id, invoice ids, dates, amounts, join keys).
- Many production columns, constraints, indexes and types are guessed; these templates must be validated and adjusted against the source database.
- Some original column names include non-breaking spaces and special characters; column names here are normalized to safe SQL identifiers.

Next steps:
1. Review each DDL with the DBAs and replace guessed types with authoritative types.
2. Add indexes and constraints (FKs) after confirming cardinality and performance needs.
3. Add a script to compare these DDLs to the live schema (or pull schema via `INFORMATION_SCHEMA`).

If you want, I can generate a script to pull the actual schema from the `LIVE` and `LIVEAccounting` databases (requires connection).
