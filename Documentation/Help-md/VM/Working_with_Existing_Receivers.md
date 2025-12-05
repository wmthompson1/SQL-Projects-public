Working with Existing Receivers




# Working with Existing Receivers

Unlike many other Infor VISUAL objects, you cannot
modify receivers. Each Save, Receive All, or Return operation creates
a new receiver. If you try to modify header information (for example,
FOB) on an existing receiver and click Save, you are prompted with
a dialog box.

The system interprets Save as an attempt to receive more goods (to
create a new receiver). If you enter new Quantity Received values
when an existing receiver is in the window, another VISUAL message
appears.

Click Yes to create a new receiver. Click
No to cancel the operation.

## Calling Up Existing Receivers

To open an existing receiver:

If you are licensed to use multiple sites, click the Site ID drop-down
button and select the site that owns the receiver. If you are licensed
to use a single site, this field is unavailable.

Click the Receiver ID browse button and select the receiver from
the Purchase Receipts table.

When you call up the receiver, the line item table displays the
current received balances, the default warehouse and location, and
0 quantities received. The table does NOT show the quantities received
or warehouse/locations received to for the Receiver ID. This means
you cannot use this screen as a viewer for the selected receiver.
Use Print Receiver to do this.

## There are several reasons you may want to call up an existing receiver:

* To print or view the receiver.
* The Print Current PO Receiver
  option in the Print Receiver dialog box allows you to print and
  view the currently selected receiver.
* As an alternate method of
  specifying the PO Order ID.
* By specifying Receiver ID,
  VISUAL automatically fills in the PO Order ID. This is convenient
  if you know a previous receipt date, because you can search the
  Purchase Receipts dialog box by date.
* To delete a receiver.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Purchase_Receipt_Entry.htm) User-defined Help