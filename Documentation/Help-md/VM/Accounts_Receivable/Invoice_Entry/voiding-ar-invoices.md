# Voiding A/R Invoices

Voiding an invoice removes it from active receivables while preserving audit history. Follow your accounting policy when voiding.

Typical steps:

1. Locate the invoice in `Invoice Entry` or via the A/R inquiry screen.
2. Verify the invoice has not been posted to a closed period and that there are no payments applied; if payments exist, resolve or reverse them first.
3. Use the `Void` action or set the invoice status to `Voided` depending on your system's UI.
4. Save the transaction; the system should record the void with a timestamp and user who performed the action.

Audit implications and notes:

- Voiding preserves an audit trail; do not delete invoices unless explicitly authorized.
- If the invoice was posted and affected GL, reversing journal entries or a corrective posting may be required.
- Document the reason for voiding in the invoice `Notes` field for future review.

Index: `../../Accounts_Receivable_INDEX.md`
