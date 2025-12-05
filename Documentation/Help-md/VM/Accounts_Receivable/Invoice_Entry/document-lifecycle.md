# Document Lifecycle

This page describes the lifecycle of an invoice document from creation through archival.

1. **Draft / Created** — Invoice header and detail saved but not printed or posted. Editable.
2. **Printed** — Invoice printed for customer; some systems lock editing when `Printed` is flagged.
3. **Posted** — Invoice has been posted to GL and impacts accounting balances. Editing is typically restricted.
4. **Applied / Paid** — Payments and credit memos have been applied; balance may be reduced to zero.
5. **Voided / Reversed** — Invoice has been voided or a reversal entry has been made; audit trail preserved.
6. **Archived** — Older invoices may be archived for retention and removed from day-to-day inquiries.

Notes:

- Retain audit fields (created by, created date, last modified) to satisfy control and audit requirements.
- Use batch IDs and posting dates to map documents to accounting periods for reporting and close processes.

Index: `../../Accounts_Receivable_INDEX.md`
