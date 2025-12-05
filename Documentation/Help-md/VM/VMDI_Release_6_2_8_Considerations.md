VMDI Release 6.2.8 Considerations




# VMDI Release 6.2.8 Considerations

![IMPORTNT.gif](IMPORTNT.gif "IMPORTNT.gif") The following
information is provided for VMDI Customers, particularly those upgrading
their current installation to 6.2. As always, if you experience any
difficulty during an upgrade with your current EDI layouts, contact
Infor Global Solutions Customer Support for assistance.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](VMDI_Release_6_2_8_Considerations.htm#Fixed_File_Style) Fixed File Style

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](VMDI_Release_6_2_8_Considerations.htm#Delimited_File_Style) Delimited File Style

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](VMDI_Release_6_2_8_Considerations.htm#Accessibility_to_Buttons_and_Boxes) Buttons and Boxes

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](VMDI_Release_6_2_8_Considerations.htm#Regarding_ACK_Transactions) ACK Transactions

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](VMDI_Release_6_2_8_Considerations.htm#Regarding_CPO_transactions) CPO Transactions

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](VMDI_Release_6_2_8_Considerations.htm#Regarding_PLN_Transactions) PLN Transaction

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](VMDI_Release_6_2_8_Considerations.htm#Regarding_Log_Files) Log Files in General

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](VMDI_Release_6_2_8_Considerations.htm#Successful_Transactions_(Good)_Log_) Successful Transaction Log File

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](VMDI_Release_6_2_8_Considerations.htm#Autogenerate_Log) Autogenerate Log

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](VMDI_Release_6_2_8_Considerations.htm#The_PrintLogs_feature) Printing Logs

## Record and File Naming

The Multiple file type writes each record type to a separate file.
Header tab fields are imported or exported as records beginning with
the letters HDR the .VDI file name ends in the letter H (for example,
ACK0001H.VDI contains the HDR records exported for layout 0001). Header
Special Detail tab fields are records beginning with the letters SDL
- the .VDI file name ends in the letter D. The Line Item tab fields
are records beginning with the letters LIN - .VDI file name ends in
the letter L. The Sub Line Item tab fields are records beginning with
the letters SUB - .VDI file name ends in the letter S. The Additional
Line Item tab fields are records beginning with the letters ASL -
.VDI file name ends in the letter A.

## Tab Access

All 5 tabs listed above are available to the ASN key. The ACK, CPO,
and VPO keys only have access to the Header, Line Item, and Sub Line
Item tabs. The INV key only has access to the Header and Line Item
tabs. The PLN key only has access to the Header tab.

## Fixed File Style

This style indicates that the data in the .VDI file s will always
occupy the same "fixed" space for each field and record.
For example, if you have selected the Part ID in the Line Item tab
of your VMDIGEN layout, and the layout shows the Part ID as being
30 characters long at position 25, then each time the Part ID is exported
for the LIN records of this layout, it will begin at position 25 and
will take up 30 character positions. Typically, VMDIXCHG will blank
fill the unused portion of any Alphanumeric fields and zero fill the
unused portion of any Decimal or Number fields.

## Delimited File Style

If the user selects Delimited as the style, he/she needs to select
a delimiter method for the end of each record and also select the
character that will be used to separate each field in the record.
For example, if you have selected the Part ID in the Line Item tab
of your Delimited VMDIGEN layout, and you chose Newline as your record
type and Comma as your field delimiter, then your data would look
something like the following example:

LIN,02001,1,PRODUCT\_P,55

LIN,02001,2,PRODUCT\_Q,18

Immediately following the last bit of data in the Part ID field
would be a comma, followed by the start of the next field. At the
end of each record, a new line would be started for the next record.
In the example above, 02001 is the Customer Order ID, followed by
the Line Number, the Part ID, and the Quantity. The example uses Newline
as the record delimiter and so each LIN record appears on its own
line. The Delimited style does not blank-fill or zero-fill the unused
portion of any exported fields just the actual data is exported
(and it only expects to see the actual data in the VDI file to be
imported).

## Accessibility to buttons and boxes

The Direction Inbound radio button is inaccessible for keys of ASN,
ACK, INV, and VPO and the Outbound radio button is inaccessible for
keys of CPO, and PLN.

Several buttons and boxes are accessible only for CPO and PLN layouts.
As a result, those buttons and boxes are grayed out for all other
layouts. Inbound Rule buttons, delivery schedule allocation options,
and check boxes are available for CPO and PLN layouts. The Replace
function is only available for PLN layouts. The Replace function is
unavailable for CPO layouts in version 6.2.8 of VM. The Delete Unshipped
line and schedule check boxes, and special settings for CPO are available
only for CPO layouts.

## Regarding ACK transactions

Customer Order Acknowledgement Codes are included on every line
item (LIN record) of your ACK (855 Order Acknowledgement). A listing
of common CO Ack Codes is provided in Application Global. If the codes
your trading partner requires are not in the list, you may add them.
See below:

Select Maintenance>[Application
Global Maintenance](Adding_Customer_Order_Acknowledgment_Codes.htm)

Select Maintain>CO Acknowledgment Codes

Verify that codes you will need to send to your trading partner
are contained in the list and insert any codes that are not present

Save CO Acknowledgment Codes screen.

When your EDI order is saved or received via VMDIXCHG, all CO line
items for this customers orders will automatically have your default
code on them. For example, some clients use the IA code (Item Accepted),
some use AC (Item Accepted and Shipped), and others might use some
mutually-agreed upon code. You can add as many codes as you need.

* Select Customer
  Maintenance and choose your customer
* Click the E-Commerce tab
* Click the "Ack Codes"
  drop-down and select the default code you want sent out with your
  ACK line items
* Save the Customer

In Customer Order Entry, line items of customer orders will be defaulted
with a code of your choosing (see above). Prior to exporting your
ACK documents, you may find one of your line items needs a code other
than the default. For instance, you may have IA as your default, but
need to send IH (Item on Hold) for this one line item.

In that case, you can:

* Select Customer
  Order Entry and choose your order
* Highlight the line item
  and scroll over to the far right
* Click the Ack
  Code field and choose the code you want to use
* Save the order

## Regarding CPO transactions

Autogenerate - Select the Autogenerate
CO ID checkbox if you would like VISUAL to generate the Customer
Order ID for you. Once you mark the checkbox, you will need to enter
in the Prefix Token used in your VDI file.

During the exchange of EDI data, VISUAL replaces the token with
the actual generated customer order ID. The log created during the
autogenerate process is a copy of the actual CPO VDI file, except
the Autogenerate Tokens have been replaced with the actual customer
order Ids created in the system. The log is named CPO and the layout
(for example, the Autogenerate log for CPO layout 0025 would be called
CPO0025.AUTO). The log is overwritten each time this layout is run.

With Autogenerate selected, VISUAL generates unique Customer Order
Ids for incoming EDI customer orders. You cannot, however, use this
feature in situations where changes to the order may be received because
VISUAL has no way of matching the original order with the incoming
changes to the order. Use this feature for unique, discrete customer
orders that you are fairly sure will never change.

Delete Unshipped Quantities - Select the
Delete Unshipped Delivery Schedules checkbox
if you would like VISUAL to delete any unshipped delivery schedules
on an order before updating with updated data from a new .VDI file.
This feature is useful for customers whose trading partner insists
that they throw out "delete" any customer order delivery
schedule lines not shipped on an order prior to receiving in updates
for that order.

Inbound Rules - Select the appropriate
inbound rule from the Inbound Rule section.

During the import of data, VMDI checks the import file records to
see if duplicate data exists. Duplicate data has the same primary
key in the targeted VISUAL table.

In the case of CPO imports, a duplicate customer order has the same
Customer Order ID as an order that already exists in the VISUAL database.

Modify Duplicate If you choose this
inbound rule, the data in the .VDI file replaces the existing data
in VISUAL. This replacement of data includes default and null data.
For example, replacing a duplicate customer order line with one that
has a different Part ID may also replace the unit price if the new
Part ID has a different price than the old one.

Line Item Match Fields - If you have chosen
Update as your inbound rule, then you have the ability to choose how
VISUAL determines line item matches for your CPO layout. If you do
not choose any line item match fields, then VISUAL will update line
items based on a match of the Part ID. If you have multiple line items
on an order for the same Part ID, then only the first occurrence of
that part will ever be updated. You need to choose additional fields
to match on in order to avoid that problem. Some customers decide
to use the line item number as their match field. However, since many
EDI trading partners dont use the line item number in the incoming
data, other fields need to be used in order to determine the correct
line item for update. Even when some EDI trading partners send the
line item number, they dont always reference it on updates to those
orders.

To alleviate the problem with matching on the line item number,
choose other fields that will always be sent in the line item. You
want to choose a combination of fields that will determine a unique
line item in the order. If the combination you have chosen does not
determine unique line items, then you will need continue adding fields
to your match criteria until you find the right combination. For instance,
Part ID and EDI Release Number may determine a unique line item for
your order. If it does not, then maybe you could try adding the Shipto
ID field. Those are just examples you may use any number and combination
of line item fields you want.

Also, we recommend that you not
use the Desired Ship Date as part of your match criteria if you have
delivery schedules on your line items. VISUAL looks at the Desired
Ship Dates in all of the delivery schedules for the line item and
finds the earliest date. VISUAL then updates the Desired Ship Date
field on the line item with that date. The line item desired ship
date would fluctuate with your delivery schedules and it would be
very difficult to accurately and consistently update your line items.
If you are using delivery schedules, it is strongly
recommended that you NOT use Desired Ship Date as part of your match
criteria.

If you are not using delivery schedules, the Desired Ship Date is
fine to use as part of your match criteria.

## Regarding PLN Transactions

Inbound Rules - Select the appropriate
inbound rule from the Inbound Rule section.

During the import of data, VMDI checks the import file records to
see if duplicate data exists. Duplicate data has the same primary
keys in the targeted VISUAL table.

In the case of PLN imports, a duplicate forecast has the same Customer
ID, Forecast ID and Part ID as a forecast that already exists in the
VISUAL database.

Update If you choose this inbound rule,
then VISUAL will look at the 3-field key above and if it finds a match,
then it will update the forecast the data from the .VDI file. If the
same dates are found in forecast in the .VDI file as in VISUAL, then
those records will be updated; if new dates are found in the .VDI
file, then those records will be added.

Replace Duplicate If you choose this
inbound rule, and if VISUAL finds a match on the 3-field key it will
eliminate all of the records for that forecast from VISUAL and import
them from the .VDI file. As with the Reject inbound rule, no dates
are looked at by VISUAL. The only option that looks at and does anything
with the required date field is the Update inbound rule.

Regarding Log Files

Four different logs are generated by VMDIXCHG for various keys.
They are explained below:

Error log: This log is generated when
importing CPO, and PLN documents and is very useful when debugging
initial import problems. This log will only contain errors (CPO documents
rejected due to match criteria will not appear in this log). The log
is named for the key and layout (for example, the error log for CPO
layout 0001 would be called CPO0001.log). The log is overwritten each
time this layout is run. An example log is shown below:

<LogFile>

<LogFileHeader>

<LogFileType>

Error Log

</LogFileType>

<LogFileDate>

5/1/00 9:39:21:000000 AM

</LogFileDate>

<LayoutKey>

CPO

</LayoutKey>

<LayoutVersion>

0001

</LayoutVersion>

<Version>

0001

</Version>

</LogFileHeader>

<VMDIErrorLog3>

====================================

Data error encountered in column CUSTOMER\_ORDER.SHIP\_TO\_ADDR\_NO
during import

Record number: 2

CUSTOMER\_ORDER.ID=GE90C12064001

CUSTOMER\_ORDER.CUSTOMER\_ID=20000818

CUSTOMER\_ORDER.CUSTOMER\_PO\_REF=000000004200000

CUSTOMER\_ORDER.SHIP\_TO\_ADDR\_NO=?

CUSTOMER\_ORDER.ORDER\_DATE=

CUSTOMER\_ORDER.DESIRED\_SHIP\_DATE=

CUSTOMER\_ORDER.STATUS=

CUSTOMER\_ORDER.EDI\_FLAG=

CUSTOMER\_ORDER.ENTITY\_ID=

CUSTOMER\_ORDER.BACK\_ORDER=

CUSTOMER\_ORDER.POSTING\_CANDIDATE=

CUSTOMER\_ORDER.MARKED\_FOR\_PURGE=

CUSTOMER\_ORDER.SELL\_RATE=

CUSTOMER\_ORDER.BUY\_RATE=

CUSTOMER\_ORDER.CONTACT\_HONORIFIC=

CUSTOMER\_ORDER.CONTACT\_FIRST\_NAME=

CUSTOMER\_ORDER.CONTACT\_INITIAL=

CUSTOMER\_ORDER.CONTACT\_LAST\_NAME=

CUSTOMER\_ORDER.CONTACT\_SALUTATION=

CUSTOMER\_ORDER.CONTACT\_PHONE=

CUSTOMER\_ORDER.CONTACT\_FAX=

CUSTOMER\_ORDER.CONTACT\_POSITION=

CUSTOMER\_ORDER.FREE\_ON\_BOARD=

CUSTOMER\_ORDER.SHIP\_VIA=

CUSTOMER\_ORDER.SALESREP\_ID=

CUSTOMER\_ORDER.TERRITORY=

CUSTOMER\_ORDER.TERMS\_NET\_TYPE=

CUSTOMER\_ORDER.TERMS\_NET\_DAYS=

CUSTOMER\_ORDER.TERMS\_NET\_DATE=

CUSTOMER\_ORDER.TERMS\_DISC\_TYPE=

CUSTOMER\_ORDER.TERMS\_DISC\_DAYS=

CUSTOMER\_ORDER.TERMS\_DISC\_DATE=

CUSTOMER\_ORDER.TERMS\_DISC\_PERCENT=

CUSTOMER\_ORDER.TERMS\_DESCRIPTION=

CUSTOMER\_ORDER.DISCOUNT\_CODE=

CUSTOMER\_ORDER.SALES\_TAX\_GROUP\_ID=

CUSTOMER\_ORDER.FREIGHT\_TERMS=

CUSTOMER\_ORDER.CURRENCY\_ID=

CUSTOMER\_ORDER.CONTACT\_MOBILE=

CUSTOMER\_ORDER.CONTACT\_EMAIL=

CUSTOMER\_ORDER.EDI\_BLANKET\_FLAG=

CUSTOMER\_ORDER.EXCH\_RATE\_FIXED=

</VMDIErrorLog3>

<VMDIErrorLog3>

====================================

## Successful Transactions (Good) Log

This log is generated when importing CPO, and PLN documents and
lists every record imported for the run. This log will not contain
errors (they are in the error log). The log is named for the key and
layout (for example, the good log for CPO layout 0001 would be called
CPO0001G.log). The log is overwritten each time this layout is run.
An example log is shown below:

<LogFile>

<LogFileHeader>

<LogFileType>

Successful Transactions Log

</LogFileType>

<LogFileDate>

5/1/00 9:39:21:000000 AM

</LogFileDate>

<LayoutKey>

CPO

</LayoutKey>

<LayoutVersion>

0001

</LayoutVersion>

<Version>

0001

</Version>

</LogFileHeader>

<VMDIGoodLog>

++++++++++++++++++++++++++++++++++++++++

The following record was updated.

Record number: 1

CUSTOMER\_ORDER.ID=R 0702210

CUSTOMER\_ORDER.CUSTOMER\_ID=ABLMAN

CUSTOMER\_ORDER.CUSTOMER\_PO\_REF=UMWX73801

CUSTOMER\_ORDER.SHIP\_TO\_ADDR\_NO=1

CUSTOMER\_ORDER.FREE\_ON\_BOARD=NASHUA

CUSTOMER\_ORDER.SHIP\_VIA=FEDEX

CUSTOMER\_ORDER.ORDER\_DATE=12/15/00 12:00:00:000000 AM

CUSTOMER\_ORDER.DESIRED\_SHIP\_DATE=12/15/00 12:00:00:000000 AM

CUSTOMER\_ORDER.STATUS=R

CUSTOMER\_ORDER.EDI\_FLAG=Y

CUSTOMER\_ORDER.SHIPTO\_ID=CPO1

CUSTOMER\_ORDER.ENTITY\_ID=MMC

CUSTOMER\_ORDER.BACK\_ORDER=N

CUSTOMER\_ORDER.POSTING\_CANDIDATE=N

CUSTOMER\_ORDER.MARKED\_FOR\_PURGE=N

CUSTOMER\_ORDER.SELL\_RATE=1.0

CUSTOMER\_ORDER.BUY\_RATE=1.0

CUSTOMER\_ORDER.CONTACT\_HONORIFIC=Mr.

CUSTOMER\_ORDER.CONTACT\_FIRST\_NAME=David

CUSTOMER\_ORDER.CONTACT\_INITIAL=J.

CUSTOMER\_ORDER.CONTACT\_LAST\_NAME=Brown

CUSTOMER\_ORDER.CONTACT\_SALUTATION=Dear Mr. Brown:

CUSTOMER\_ORDER.CONTACT\_PHONE=[617] 444-7000

CUSTOMER\_ORDER.CONTACT\_FAX=[617] 444-7011

CUSTOMER\_ORDER.CONTACT\_POSITION=General Manager

CUSTOMER\_ORDER.SALESREP\_ID=MARK

CUSTOMER\_ORDER.TERRITORY=NEW ENGLAND

CUSTOMER\_ORDER.TERMS\_NET\_TYPE=A

CUSTOMER\_ORDER.TERMS\_NET\_DAYS=30

CUSTOMER\_ORDER.TERMS\_NET\_DATE=

CUSTOMER\_ORDER.TERMS\_DISC\_TYPE=A

CUSTOMER\_ORDER.TERMS\_DISC\_DAYS=10

CUSTOMER\_ORDER.TERMS\_DISC\_DATE=

CUSTOMER\_ORDER.TERMS\_DISC\_PERCENT=2.0

CUSTOMER\_ORDER.TERMS\_DESCRIPTION=

CUSTOMER\_ORDER.DISCOUNT\_CODE=WHOLESALE

CUSTOMER\_ORDER.SALES\_TAX\_GROUP\_ID=MA

CUSTOMER\_ORDER.FREIGHT\_TERMS=P

CUSTOMER\_ORDER.CURRENCY\_ID=(USD) $

CUSTOMER\_ORDER.CONTACT\_MOBILE=

CUSTOMER\_ORDER.CONTACT\_EMAIL=

CUSTOMER\_ORDER.EDI\_BLANKET\_FLAG=N

CUSTOMER\_ORDER.EXCH\_RATE\_FIXED=N

CUSTOMER\_ORDER.SEND\_ACK=Y

</VMDIGoodLog>

<VMDIGoodLog>

++++++++++++++++++++++++++++++++++++++++

The following record was updated.

Record number: 1

CUST\_ORDER\_BINARY.BITS=R 0701743 00000701743 NEW CRIB #: 40CR93

CUST\_ORDER\_BINARY.BITS\_LENGTH=41

</VMDIGoodLog>

<VMDIGoodLog>

++++++++++++++++++++++++++++++++++++++++

The following record was updated.

Record number: 1

Cust Order Line No 1 for Cust Order ID R 0702210 was updated.

CUST\_ORDER\_LINE.LINE\_NO=1

CUST\_ORDER\_LINE.PART\_ID=0038860967

CUST\_ORDER\_LINE.UNIT\_PRICE=2.5

CUST\_ORDER\_LINE.USER\_ORDER\_QTY=190.0

CUST\_ORDER\_LINE.SELLING\_UM=10X10\_SHT

CUST\_ORDER\_LINE.DESIRED\_SHIP\_DATE=11/22/99 12:00:00:000000 AM

CUST\_ORDER\_LINE.MISC\_REFERENCE=0038860967

CUST\_ORDER\_LINE.SHIPTO\_ID=

CUST\_ORDER\_LINE.LINE\_STATUS=A

CUST\_ORDER\_LINE.ORDER\_QTY=190.0

CUST\_ORDER\_LINE.PRODUCT\_CODE=

CUST\_ORDER\_LINE.COMMODITY\_CODE=STEEL

CUST\_ORDER\_LINE.TRADE\_DISC\_PERCENT=15.0

CUST\_ORDER\_LINE.GL\_REVENUE\_ACCT\_ID=

CUST\_ORDER\_LINE.COMMISSION\_PCT=15.0

CUST\_ORDER\_LINE.ACK\_ID=

CUST\_ORDER\_LINE.SEND\_ACK=

</VMDIGoodLog>

<VMDIGoodLog>

++++++++++++++++++++++++++++++++++++++++

The following record was updated.

Record number: 1

CUST\_LINE\_BINARY.BITS=D

CUST\_LINE\_BINARY.BITS\_LENGTH=2

</VMDIGoodLog>

<VMDIGoodLog>

++++++++++++++++++++++++++++++++++++++++

Insert/Update Log: This log is generated when importing CPO, and
PLN documents and lists every imported or updated document from the
run. This log will not contain errors (they are in the error log).
The log also shows any records deleted by the user having marked the
"Delete unshipped Quantities" checkbox. The log is named
for the key and layout (for example, the insert/update log for CPO
layout 0555 would be called CPO0555IN.log). The log is overwritten
each time this layout is run. An example log is shown below

<LogFile>

<LogFileHeader>

<LogFileType>

Insert Update Log

</LogFileType>

<LogFileDate>

4/12/00 2:30:18:000000 PM

</LogFileDate>

<LayoutKey>

CPO

</LayoutKey>

<LayoutVersion>

0555

</LayoutVersion>

<Version>

0555

</Version>

</LogFileHeader>

<VMDIInsertLog>

====================================

Customer Order Z05550010
inserted

</VMDIInsertLog>

<VMDIInsertLog>

====================================

Customer Order Z05550011
inserted

</VMDIInsertLog>

<VMDIInsertLog>

====================================

Customer Order Z05550012
inserted

</VMDIInsertLog>

<VMDIInsertLog>

====================================

Customer Order Z05550013
inserted

</VMDIInsertLog>

<VMDIInsertLog>

====================================

Customer Order Z05550014
inserted

</VMDIInsertLog>

</LogFile>

## Autogenerate Log

This log is generated when importing CPO documents with the Autogenerate
feature of VMDIGEN. This log is a copy of the actual CPO VDI file,
except the Autogenerate Tokens have been replaced with the actual
customer order Ids created in the system. The log is named CPO and
the layout (for example, the Autogenerate log for CPO layout 0025
would be called CPO0025.AUTO). The log is overwritten each time this
layout is run. An example VDI file and log are shown below. Notice
how the token AUTO is replaced with the actual customer order ID and
that the number is incremented for second order (02006 for first order
and 02007 for second):

Original CPO0025.VDI file imported into VISUAL

HDRAUTO1 02613 2433139123 0000212000041320000414RY

LINAUTO1 1001305218 000000000670000 20000414 071503500892

LINAUTO1 2001307441 000000000260000 20000414 614759003900

LINAUTO1 3001307455 000000000030000 20000414 614759003955

LINAUTO1 4001312658 000000000030000 20000414 071503594525

LINAUTO1 5001312665 000000000050000 20000414 071503500090

LINAUTO1 6001312672 000000000010000 20000414 614759000985

LINAUTO1 7001312679 000000000140000 20000414 071503500953

HDRAUTO2 02613 2433139124 0000212000041520000416RY

LINAUTO2 1001305218 000000000670000 20000414 071503500892

LINAUTO2 2001307441 000000000260000 20000414 614759003900

LINAUTO2 3001307455 000000000030000 20000414 614759003955

LINAUTO2 4001312658 000000000030000 20000414 071503594525

LINAUTO2 5001312665 000000000050000 20000414 071503500090

LINAUTO2 6001312672 000000000010000 20000414 614759000985

LINAUTO2 7001312679 000000000140000 20000414

## Autogenerate log created for CPO0025.VDI file

HDR02006 02613 2433139123 0000212000041320000414RY

LIN02006 1001305218 000000000670000 20000414 071503500892

LIN02006 2001307441 000000000260000 20000414 614759003900

LIN02006 3001307455 000000000030000 20000414 614759003955

LIN02006 4001312658 000000000030000 20000414 071503594525

LIN02006 5001312665 000000000050000 20000414 071503500090

LIN02006 6001312672 000000000010000 20000414 614759000985

LIN02006 7001312679 000000000140000 20000414 071503500953

HDR02007 02613 2433139124 0000212000041520000416RY

LIN02007 1001305218 000000000670000 20000414 071503500892

LIN02007 2001307441 000000000260000 20000414 614759003900

LIN02007 3001307455 000000000030000 20000414 614759003955

LIN02007 4001312658 000000000030000 20000414 071503594525

LIN02007 5001312665 000000000050000 20000414 071503500090

LIN02007 6001312672 000000000010000 20000414 614759000985

LIN02007 7001312679 000000000140000 20000414

## The PrintLogs feature

The File>Print Logs feature of VMDIXCHG allows you to print any
.LOG file created in VISUAL.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Data_Interchange.htm) User-defined Help