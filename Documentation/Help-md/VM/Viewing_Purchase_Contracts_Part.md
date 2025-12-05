Viewing Purchase Contracts




# Viewing Purchase Contracts

Use the Purchase Contracts dialog box to view contracts created
in Part Maintenance. You can also view the contracts created in Outside
Service Maintenance or Vendor RFQ Entry. Most of the information in
the window is read-only; you can edit the description, status, and
status reason fields.

You can also print a Purchase Contracts List and a Purchase Contract
Usage report from the Purchase Contract dialog box.

1. Select Maintain,
   Purchase Contract.
2. Click the Contract
   ID button to select the contract to view.

The system displays the following information
in the header area:

Description
Specify a description for the contract.

Vendor ID The
system displays the ID of the vendor with whom you are entering the
contract.

Vendor Contract ID
The system displays the supplier contract ID you specified on the
Vendor RFQ header or the Quote Entry window. If you did not specify
a contract ID, the system creates one.

Status Click
the arrow and specify the contracts status. You can select from Open,
Closed, or Cancelled/Void.

Status Reason
Click the browse button and select a reason for the status. Set
up reason codes in Application Global Maintenance.

The system displays the following information
in the line item table:

Ln # The system
displays a number for the contract line.

Vendor CLIN
The system displays the supplier contract line item number you specified
in the Enter Vendor Quote dialog box.

Part ID If the
quote is for a part, the system displays the part ID.

Service ID If
the quote is for a service, the system displays the service ID

Description
The system displays the description of the part or service.

Effective Date
The system displays the effective date you specified in the Enter
Vendor Quote dialog box.

Expiration Date
The system displays the expiration date that you specified in the
Enter Vendor Quote dialog box.

Vendor Part ID
The system displays the vendors part ID for the part on the line.

Vendor Service ID
The system displays the vendors service ID for the service on the
line.

3. Click Save.

The system uses the pricing you specified in the Enter Vendor Quote
dialog box as the pricing in the contract.

## Printing a Purchase Contracts List

Print a Purchase Contracts List report to view the contracts you
have made with vendors.

1. Select File,
   Print Purchase Contracts List.
2. Specify the following
   parameters for the report:

Starting Date and Ending
Date fields To view contracts created during a certain time
frame, specify a starting date and ending date in the starting date
and ending date fields.

Start Vendor ID and End
Vendor ID fields If you would like to view contracts for
certain vendors, select the Vendor ID option in the Sequence section,
then specify a Start Vendor ID and an End Vendor ID. The system will
export contracts for the vendor IDs specified in the Start Vendor
ID and End Vendor ID fields, along with all vendor IDs that occur
alphabetically between the start vendor ID and end vendor ID.

You can use the Date fields and Vendor ID
fields in conjunction with each other to view contracts made with
certain vendors over a particular period of time.

Orders If you
want to view the currently selected contract only, select the Current
Contract option. If you select this option, the system deactivates
the Vendor ID fields and the Status fields. Select All Contracts to
view any contract that fits the parameters you specify.

Sequence Select
the sort order for the report. Select Contract ID to sort the report
by contract ID. Select Vendor ID to sort the report by vendor.

Status Select
the status of the contracts to view in the report. Choose one or more
of the following statuses: Open, Closed, Cancelled. If you selected
the Current Contract option in the Orders section, the system deactivates
the Status selections.

Type Select
the type of report to export. Select Standard to view the Contract
ID, Vendor Contract ID, Description, Vendor ID, Vendor Name, Status,
and Create Date in the report. Select Detail to view all of the information
in the Standard report, plus the RFQ line number, part or service
ID, item description, contract effective date, contract expiration
date, vendor CLIN, vendor part ID, vendor service ID, purchase UOM,
currency ID, and the quantity and pricing breakdown.

3. Select the output options
   for the report.
4. Click Ok.

## Printing the Purchase Contract Usage Report

Print the Purchase Contract Usage Report to view the purchase orders
that reference vendor contracts. To run the report:

1. Select File,
   Print Purchase Contract Usage Report.
2. Specify the following
   information:

Starting and Ending Contract
ID Select the range of contracts to view in the report. To
view only one contract, specify the same contract ID in the Starting
Contract ID and Ending Contract ID fields.

Sequence Select
the sort order for the report. You can select By Vendor ID, By Part
ID, or By Contract ID.

3. Specify the output for
   the report.
4. Click Ok.

The report lists the vendor ID, vendor name, order ID, order date,
buyer, currency ID, line #, service or part ID, description, vendor
part ID, contract ID, contract line #, vendor contract ID, vendor
CLIN, quantity, unit of measure, unit price, min charge, fixed charge,
and received date.