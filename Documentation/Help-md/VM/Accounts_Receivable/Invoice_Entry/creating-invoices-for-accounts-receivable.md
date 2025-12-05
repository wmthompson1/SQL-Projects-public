# Creating Invoices for Accounts Receivable

Use the Invoice Entry window to create a manual invoice when no shipment-based invoice is generated.

Steps:

1. Open `Invoice Entry` and create a new invoice header (see `Accessing A/R Invoice Entry`).
2. Select the `Customer ID` and confirm the Sold To/Bill To addresses.
3. Enter invoice detail lines for items, labor, freight, or miscellaneous charges. If using inventory items, reference the item code and quantity.
4. For non-shipped charges (storage, service fees), use the appropriate GL distribution or account code on the line.
5. Verify tax calculation and any discounts applicable to the customer.
6. Save the invoice. Optionally, print the invoice and then post according to your business process.

Notes:

- If Auto Numbering is enabled, leave `Invoice ID` blank and let the system assign the next number.
- Use internal references (PO number, contract) in the `Reference` or `Notes` fields to help reconcile later.
- Confirm GL distributions on each line if your organization posts distribution-level accounting entries.

Index: `../../Accounts_Receivable_INDEX.md`
