Receiving Serviced Materials




# Receiving Serviced Materials

|  |  |
| --- | --- |
| POSTIT.gif | The Transaction ID is assigned automatically by the system. DO NOT enter a Transaction ID when issuing material. If you do enter a Transaction ID, the system ignores it. |

To log service receipts:

1. If
   you are licensed to use multiple sites, click the Site ID drop-down
   arrow and select the site in which you are receiving serviced
   materials. If you are licensed to use a single site, this field
   is unavailable.
2. Enter the transaction
   date in the Transaction Date field.

This field defaults to the current date,
but you can change it if the actual receipt date is not the current
date.

3. If you do not know the
   Work Order, click the Work Order ID button.

A dialog box with a table of released service
work orders appears.

4. Enter the Work Order
   ID fields for the Work Order that is to receive the material.
   All released work orders appear.

When you select the Work Order ID, the Lot ID and
Split
ID appear automatically.

5. Enter the Operation
   Sequence No. for the Work Order operation that is to receive the
   material.

If you do not know the Sequence Number,
click the Oper Seq No button to call up
a table of sequence numbers for the selected work order. Only released
operations that use a subcontractor resource appear in this table.
Selecting from this table fills in the Oper Seq No. and Sub ID fields.

The Service ID specified for the operation
in the Manufacturing Window appears in the Service ID field.

6. If necessary, change
   the Service ID to the one that was actually used. Click the Service
   ID button to call up a table of available Service IDs.
7. Enter a Service Part ID.
8. If you do not know the
   Vendor ID, click the Vendor ID button to browse the list of Vendors.

The Vendors dialog box appears.

9. If necessary, change
   the Vendor ID.

Vendor
Service ID appears when you enter a Vendor ID.

You enter Vendor Service IDs for selected
vendors in Service Maintenance by selecting Vendors Supplying This
Service or Vendor services supplied from the Maintain menu.

10. Enter the quantity received
    (good) and quantity
    received (deviated).

The Unit
Cost defaults from the estimated unit cost you specified with the
operation.

11. If the actual cost is
    different from estimated, modify the unit cost field accordingly.
12. Enter any description
    or comment to accompany this transaction in the Description field.
13. Click the Save
    button to create a new receipt transaction.

## Saving this information has the following effects:

* Quantity Completed for the
  operation is updated to account for the new quantity reported.
  This updates the completion meters in the Manufacturing Window
  (the bars that show the percentage of an operation that is complete).
* If Quantity Completed for
  the operation now meets or exceeds the required quantity, VISUAL
  automatically closes the operation.
* VISUAL creates a new service
  receipt transaction with a system-assigned Transaction ID. You
  can view and edit this transaction (see below). The Costing utilities
  use these transactions in computing actual work order costs.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Outside_Service_Receipt_Entry.htm) User-defined Help