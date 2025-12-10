# Payables Data Models

This folder contains exploratory queries and documentation for the Payables data model.

Files:

- `Payables_Data_Model1.sql` — Invoice-level extracts, aging summaries, payment remittance examples, and batching patterns for large joins.
- `Payables_Data_Model2.sql` — Receiver-to-PO reconciliation and supplier/receiver perspective queries (receiver grain analysis).
- `Payables_Data_Model3-6.sql` — Additional payables queries (historic and variations).
- `payables_invoice_voucher_flow.md` — Authoritative mapping and recommended joins: `RECEIVER_LINE` → `PAYABLE_LINE` → `PAYABLE`, DDL excerpts and caveats (invoice-number matching, AP_App note).
- `unmatched_receivers_report.sql` — Exception report (lists receiver rows without an associated payable) — (created by documentation team)

Notes:
- Prefer `PAYABLE_LINE`-based joins (using `RECEIVER_ID` + `RECEIVER_LINE_NO`) to link receivers to payables. Matching only by invoice number is less reliable; refer to `payables_invoice_voucher_flow.md` for guidance.
