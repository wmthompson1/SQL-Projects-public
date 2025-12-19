What is the Work Order Requirement Report?




# What is the Work Order Requirement Report?

This report summarizes un-purchased or unissued materials
required by a work order, and is especially useful for managing non-inventory
materials.

For each selected work order, the following is shown:

* Work Order ID
* Want Date
* Part ID and Description
* Desired Quantity
* Status

For each material requirement on a work order, the following is
shown:

* Sequence Number/Piece Number
* Part ID and Description
* Calculated Quantity (quantity
  required into operation)
* Material Required Date
* Issued Quantity
* Remaining Quantity = Calculated
  Quantity - Issued Quantity

## Options:

### Base ID Range

This allows you to choose the range of work orders to print, based
on Starting and Ending Base ID.

### Date Range

This allows you to specify the range of work order Want Dates or
material Required Dates to print, depending upon your selection of
Sequence.

### Material Required

If Unissued Material Required is selected, then all requirements
where the current issued quantity is less than the quantity required
will be printed.

If Unpurchased Material Required is selected, then all requirements
that do not have linked purchase orders will be printed. This is useful
for managing non-inventory part purchases, or any purchases that are
directly to a job.

### Include Material with Part IDs

If this box is not checked, only non-inventory materials (those
without Part IDs) are reported on. This allows you to manage those
materials that are special to a particular job, since the Material
Planning Window can be used for all materials with Part IDs.

### Sequencing

You can sequence the report by the Want Date of work orders, or
by the Required Date of material requirements on the work orders.

## QRP Files

VMWRQRP1.QRP

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](VMWRQRPTfrmWorkOrderReqReport.md) Printing

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Work_Order_Requirement_Report.md) User-defined Help