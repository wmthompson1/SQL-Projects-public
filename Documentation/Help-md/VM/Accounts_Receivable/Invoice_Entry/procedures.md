# Procedures

This page summarizes common Invoice Entry workflows and best-practice steps.

## Typical workflow

1. Navigate to `Invoice Entry` (see Accessing A/R Invoice Entry).
2. Create a new invoice header: set `Site ID`, `Customer ID`, (optional) `Salesrep ID`, and `Invoice Total`.
3. Add detail lines for items, services, or charges so that the sum of line amounts equals the `Invoice Total`.
4. Review calculated fields (`Paid to Date`, `Balance Due`), and apply any prepayments or credit memos if required.
5. Save the invoice. If printing is required, mark `Printed` or print the invoice (which may lock further edits).
6. Post the invoice to ledger if your workflow requires immediate posting (see `Posting Invoices`).

## Best practices

- Validate the `Customer ID` and billing address before posting.
- Use the `Comment` or `Notes` field for business context (e.g., contract number, PO number).
- When working with batches of invoices, use consistent batch naming and reconcile batch totals to GL periodically.

## Troubleshooting

- If the invoice won't save, verify required fields are populated and line totals equal the invoice total.
- If taxes or discounts calculate incorrectly, check customer tax settings and discount codes before posting.

Index: `../../Accounts_Receivable_INDEX.md`
