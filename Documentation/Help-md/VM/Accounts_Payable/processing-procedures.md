# Accounts Payable Processing Procedures

This document outlines the high-level A/P process and key controls.

Process flow:

1. **Receive invoice or invoice-from-receipt** — vendor invoice arrives or AP creates voucher from PO receipt.
2. **Three-way match** — match invoice to PO and receipt where required to validate quantities and prices.
3. **Approve voucher** — route for approval per amount thresholds and segregation of duties.
4. **Generate payment** — create payment proposals and process check/ACH runs for approved vouchers.
5. **Post and reconcile** — post voucher and payment transactions to GL and reconcile control accounts.

Key controls:

- Segregation of duties: separate invoice entry, approval, and payment creation roles.
- Matching tolerances: set tolerances to allow automated matching within thresholds.
- Vendor master controls: restrict who can add or change vendor banking details.

Index: `../Accounts_Payable_INDEX.md`
