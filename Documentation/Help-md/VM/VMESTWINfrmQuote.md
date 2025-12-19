Entering a New Quotation



 
 
 
 
 
 
  
  
 
 
 
 
 
 
 
 
 

# Entering a New Quotation

When you first start the Estimating Window, the window
is blank except for the Quote Date. Under the Dates tab, the Expect
date defaults to the current date and the Win Probability percent
defaults to 100%.

To enter a new quotation:

1. If you are licensed
   to use multiple sites, click the Site ID arrow and select the
   site to use in the quote. If you are licensed to use a single
   site, this field is unavailable.
2. Modify the Quote Date, if necessary.

For example, if you know this quote will
go out tomorrow, you may wish to change the date to match the actual
delivery date.

3. Enter your own quotation
   number by typing a value into the Quote
   ID field. If you are using the auto numbering feature, Tab through
   this field.

The system assigns the number for you when
the quotation is generated.

4. Enter the Customer ID,
   or click the Customer ID button and select a customer from
   the Customers Table.

If this is a prospect and NOT an existing
customer, you can enter the Name in the Estimating Window, without
the Customer ID. This procedure does NOT add the prospect to the Customer
table. However, there will be a name associated with the quote.

If the customer does not exist in the database
and you want the prospect/customer added to the Customer table, you
must do this through Customer Maintenance.

If this customer does exist in the customer
table, most of the information in the top portion of the Estimating
Window appears automatically.

5. Modify or enter Address
   information.
6. Click the Contact
   tab to specify the contact information for the customer or prospect.
   You can enter
   contact information directly in the Contact tab fields.
   If you enter information
   directly in the Contact tab fields, the information is not stored
   in your Contacts table. Alternatively,
   you can click the Contact
   browse button,
   select the contact from the existing customer contacts, and then
   click the Use
   Selected Contact toolbar
   button. If the contact you want to use is not yet in the database,
   click [Add New Contact](VMCONMNTfrmContact.md).

If you do not want to assign a contact to
this estimate, click Use No Contact.

7. Click the Dates
   tab and enter the following estimate information:

Won/Lost
- When you generate a customer order from the quote or when the status
changes to Won, VISUAL automatically calculates the won date. However,
you must enter the Lost Date manually. This Won/Lost Date appears
in the Quoting History for a part. An entry is not required. A calendar
button is provided to select the date.

Expires
- The date on which the parts, jobs, and prices quoted to the customer
or prospect are no longer valid. The Quote Log report can sort by
this date, in order to allow management of the outstanding quotations
that need attention.

Follow-up
- The date on which a follow-up call to the customer is appropriate.
This date should be prior to the Expiration Date. You can also update
this date periodically to indicate the next date on which the quote
needs your attention. You can sort the Quote Log report by this date.

Expect
- The date on which the order is expected to come in from the customer.
This date is key to the Proforma Report, which projects revenue based
on expected date and probability of win. This date defaults to the
create date of the quote. An entry is required.

Printed
- The date on which the quote was printed.

Win
probability % - A percentage that reflects the probability
of the customer/prospect placing an order for the part product. The
Proforma Report uses this information to project revenue based on
a probability cutoff. A numeric entry between 0 and 100 is required;
defaults to 100%.

Quoted
Leadtime - The time quoted from placement of the order to delivery.
This field is informational only.

W/L Reason - Reason for winning or loosing the
quote.

8. Click the Other
   tab and enter the following information:

Sales
Rep - The Sales Representative from your company who is handling
this quotation. If you entered a Customer ID, the Sales Rep defaults
from the customers database entry. You can sort the Proforma Report
by Sales Rep. An entry is not required.

Territory
- The geographic territory handled by the Sales Rep. If you entered
a Customer ID, Territory defaults from the customers territory entry.
You can sort the Proforma Report by Territory. An entry is not required.

FOB
- Free on Board point that applies if the order is placed. This is
the point where title of goods passes from seller to buyer. This is
usually the city of the Purchase From or Ship To address, but could
also be an intermediate shipping point. If you entered a Customer
ID, the FOB defaults from the customers database entry. An entry
is not required.

Ship
via - The method by which you will ship the parts for this
quotation, should it become a customer order. An entry is not required.

Disc
code - Select an appropriate discount code that applies to
this quote.

Currency
ID - This drop down menu allows you to select the currency
on which this quote is based. This option only appears if you are
using the multi-currency feature of Infor VISUAL. If you enter a Customer
ID, this field defaults from the customers database entry and is
disabled. You cannot override this field for a database customer.
Specifying a Currency ID allows quoted prices to be viewed and printed
in the customer or prospects currency.

RMA ID If you
generated this quote from an evaluation RMA, the ID of the RMA is
inserted. This is a read-only field.

Entity The accounting
entity associated with the site ID you selected in the Site ID field
is displayed. This is a read-only field.

RMA ID If you
generated this quote from an evaluation RMA, the ID of the RMA is
inserted. This is a read-only field.

Terms
- Specifies the following sales terms that will apply if an order
is placed. Refer to [Adding
Terms](Entering_Information_in_Terms_Maintenance.md) for more information.

Create Quote Masters for MPC Line Items - If you
want VISUAL to create Quote Master for your MPC line Items, select
this check box.

Click the Insert
button to add a line to the quote.

Each separate part or job quoted is specified
by a line item in the table.

9. If you are licensed
   to use Project/A&D features, the system displays the Project
   tab. Use the Project tab to link the quote to an existing project.
   You can also begin the creation of a project in the Estimating
   Window. Click the Project Info button and select the project to
   associate with the quote. The system inserts the Project Type,
   the default WBS code, and the Project Warehouse from Project Maintenance.
   Refer to [Creating
   Quotes for Existing Projects](Creating_Quotes_for_Existing_Projects.md) and [Creating
   a Project from the Estimating Window](Creating_a_Project_from_the_Estimating_Window.md) for more information.
10. Enter the Part ID for
    the inventory part you are quoting. Double-click the column header
    to get a browse list of all parts.

Alternately, if a cross-reference has been
defined, you can enter Customer Part ID; the Part ID field automatically
fills in. Set up the cross-reference in Part Maintenance, using Unit
Prices by Customer from the Maintain menu.

11. If you are preparing
    an estimate for a piece tracked part, specify the required dimensions
    in the Length, Width, and Height fields. Specify the dimensions
    before specifying the quantities to quote.
12. Specify the quantity
    breaks for the quote.

If you are preparing an estimate for a standard
part, click in the Quote Quantities column. Click Insert,
then specify the quantities to quote.

If you are preparing an estimate for a piece
tracked part, click in the Quote Quantities column. Click Insert,
then specify the number of pieces to quote. When you specify a number
of pieces, the quantity is calculated for you provided that you specified
the dimensions of the piece.

The specified quantities appear in the Quantities
Quoted field separated by semicolons (;).Move to the Quantities Quoted
field.

13. Double-click the Cost
    From column header.

The Cost From dialog box appears.

14. Specify how to calculate
    costs.

Click the Part
option button if the quoted inventory part will be filled from inventory.
This uses the standard unit costs specified for the part in Part Maintenance.
VISUAL does not take lot sizes and material quantity breaks into account.

Click the Engineering
Master option button if the quoted inventory part will be made-to-order
for the customer. This uses the estimated costs specified in the operations
and material requirements of the Engineering Master for the specified
Part ID.

The Engineering ID defaults from Part Maintenance.
In general, this represents the latest revision of the part. If you
need to change it, you can select from the existing Engineering IDs
using the drop down box.

Click the Quote Master
option button if you are quoting a custom part, or a special version
of a standard part.

This allows you to create and manage a special
engineering master that is only used for this quote.

15. If this is a custom
    part, enter a description, commodity code, and product code.
16. Enter a Drawing ID and
    Revision number, if applicable.
17. If you licensed to use
    Projects/A&D modules, you can specify a WBS Code, WBS CLIN,
    and Proj Ref Seq No to link the line item to a WBS code within
    the project you specified on the Project tab. Refer to [Creating
    Quotes for Existing Projects](Creating_Quotes_for_Existing_Projects.md) and [Creating
    a Project from the Estimating Window](Creating_a_Project_from_the_Estimating_Window.md) for more information.
18. Click the Save
    button to save the initial quote information.

At this point, you will probably want to leave
the status set to In-house, to indicate that the quote is not finished.

There are two other important steps that
must be completed before the quote will be ready:

* If costs for
  a line item are coming from a quote master, you must create the
  quote master. If costs are coming from an engineering master,
  you may wish to view or modify it.
* You must prepare
  and review price information by setting markups and recalculating
  prices.

![btn_mini.gif](btn_mini.gif "btn_mini.gif") Setting
Terms

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Estimating_Window.md) User-defined Help