# Specifying A/R Invoices

If you decide not to use the invoice generation and printing option available in VISUAL, or you are invoicing for something (for example a storage charge) that is not shipped, you must manually specify the invoice in Accounts Receivable.

To specify an A/R invoice:

1. Open the Invoice Entry window as described in `Accessing A/R Invoice Entry`.
2. In the header portion of the Invoice Entry window, specify the following information:

- **Site ID**
	- If you are licensed to use multiple sites, click the Site ID arrow and select the site for which you are creating the A/R invoice. If you are licensed to a single site, this field is unavailable.

- **Invoice ID**
	- Specify an identification code for the new invoice. If you have enabled Auto Numbering, leave this field blank to allow the system to generate the next sequential Invoice ID.

- **Customer ID**
	- Specify or select the identification code for the Customer for whom you are creating the invoice. You can enter the Customer ID manually, or select one from the browse list by clicking the Customer ID button.
	- When you specify or select a valid Customer ID, the appropriate Sold To / Bill To information is populated automatically.

- **Salesrep ID**
	- Specify or select the ID for the Sales Representative responsible for the sale. This is used for commission generation and is optional.

- **Invoice Total**
	- Specify the total amount, in your Entity Currency, to apply to the current invoice. The sum of the detail line item amounts must equal this total.

Review the calculated fields shown in the header:

- **Paid to Date**
	- Displays any payments already received from the customer. The Invoice Total is added to this field for informational purposes.

- **Balance Due**
	- Calculated as `Invoice Total - Paid to Date`. When the Balance Due equals 0 the invoice is considered "Paid in Full".

- **Printed**
	- Select the Printed checkbox if you want to track the invoice as printed (Draft Mode). An invoice flagged as Printed cannot be edited.
	- When you print an invoice, or select Printed and save the record, the print date is inserted in the field to the right of the Printed checkbox.

- **Posted**
	- Indicates the invoice has been posted to the ledger. Posted invoices are generally not editable and affect GL balances.

When header values are complete, add or edit the invoice detail lines so that the line amounts sum to the Invoice Total, then save the invoice.

Index: `../../Accounts_Receivable_INDEX.md`
