# Viewing the Invoice Entry Tables

This page provides guidance on where to find invoice data for reporting and common fields to reference.

Common tables/objects (names vary by installation):

- `AR_INVOICE` / `RECEIVABLE` — invoice header fields (Invoice ID, Customer ID, Invoice Date, Invoice Total, Posted flag).
- `AR_INVOICE_LINE` / `RECEIVABLE_LINE` — invoice detail lines (Item code, quantity, unit price, line amount, distribution code).
- `AR_PAYMENTS` / `RECEIPT` — payment and unapplied payment records.

Reporting tips:

- Use `Invoice ID` and `Customer ID` as primary joins between header and line tables.
- Filter by `Posted` flag or posting date to include only ledger-impacting invoices.
- Export data for large-volume reporting instead of running live queries against production tables during peak hours.

Index: `../../Accounts_Receivable_INDEX.md`
