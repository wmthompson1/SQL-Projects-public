# Posting Invoices

Posting moves invoice amounts to the General Ledger and updates customer balances. Understand your posting policy (immediate vs batched).

Common posting approaches:

- **Single invoice posting**: Post an individual invoice when it is complete and approved.
- **Batch posting**: Collect invoices into a batch (e.g., by date or operator) and post the batch to GL in one operation. Batch posting simplifies reconciliation.

Steps to post:

1. Verify all invoices in the batch are complete and balances are correct.
2. Run pre-post checks/reports (trial balance, batch totals) to confirm totals match expectations.
3. Execute the `Post` or `Post Batch` action. Note the posting date and period — do not post to a closed accounting period.
4. After posting, verify GL entries and customer balances via A/R and GL inquiry screens.

Rollback and adjustments:

- If an invoice was posted in error, follow your month-end reversal or corrective posting procedure; some systems allow a post-reversal feature, others require manual adjusting entries.

Index: `../../Accounts_Receivable_INDEX.md`
