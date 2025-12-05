# Entering Prepayments

Prepayments are customer payments received before invoices are issued. Record them in A/R so they can be applied to future invoices.

Steps to record a prepayment:

1. Open `Invoice Entry` (or the `Receive Payment` equivalent in your installation) and create a new record for the customer.
2. Select the `Customer ID` and set the transaction type to `Prepayment` or use the payment/receipt function as appropriate.
3. Enter the payment amount, payment method (check, ACH, credit card), and any reference number.
4. Save the receipt. The system should create an unapplied payment or credit balance for the customer.

Applying a prepayment to an invoice:

1. When creating or editing an invoice, use the `Apply Payment` or `Payments` function to allocate the unapplied prepayment to the invoice.
2. Verify the applied amount reduces the `Balance Due` and updates `Paid to Date`.

Notes:

- Some installations track prepayments as separate receipt records rather than invoice line items; follow your organization's policy.
- Maintain a running report of unapplied payments to prevent aging issues.

Index: `../../Accounts_Receivable_INDEX.md`
