Entering Unplanned Maintenance Calls




# Entering Unplanned Maintenance Calls

After entering UPM information to the database, you
can now generate and process maintenance calls for customers. You
must assign a unique identification number to each unplanned maintenance
call. If you established auto-numbering preferences for call numbers,
VISUAL generates the next number.

1. If you are licensed
   to use multiple sites, click the Site ID arrow and select the
   site in which you are entering the call. If you are licensed to
   use a single site, this field is unavailable.
2. If you want to modify
   or view an existing call, click the Call ID button.

For new calls, enter a unique ID in the
data field. The current User ID appears to show who entered the call.

The Call
Date defaults to the current system date and is not editable.

3. Click Equipment to select the piece of equipment
   for which you are generating the call. You cannot enter a new
   Equipment ID in this field. Enter equipment information using
   the Equipment Maintenance window, the companion window to the
   Unplanned Maintenance window.

After selecting a piece of equipment, VISUAL
auto-fills many of the data fields throughout the Unplanned Maintenance
Window, including Customer ID. For the most part, you cannot edit
equipment information in the Unplanned Maintenance window. To edit
equipment information, use the Equipment Maintenance window.

4. Specify the following
   information in the Call Status section:

Status - The status of
the call. Its a good idea to accept the default of Entered. If you
create a work order or customer order for the UPM call, VISUAL changes
the status automatically. Or, you can select,

Cancelled/Void if the UPM call has been
cancelled or voided; Closed, if the UPM call is closed and work is
complete; CO Created if VISUAL has created a customer order for the
UPM call; Entered if the UPM call has been entered into the database.
This is the default. Invoiced if VISUAL has invoiced the UPM call
and you are ready to receive a payment or voucher on it; WO Created
if VISUAL has successfully created a work order for the UPM call.

Closed
Date - The date on which the UPM call closed, if it is in fact
closed. Click the calendar button to change the Closed date if necessary.

Urgency
- Click the Urgency button to select an urgency code for the UPM call.

Escalation
- Click the Escalation button to select an escalation code for the
UPM call.

5. Enter necessary fault
   information in the Fault Data section. If you know the code you
   want to assign, select a Fault Code first and the Fault Type defaults
   to the fault type defined in the code.

Fault
Type - Click the Fault Type button
to select a fault type for the UPM call. You must select at least
a fault type for each UPM call. If you select a fault code for which
a calls exists with same fault type/code, VISUAL presents you with
a dialog box, asking if you want to view a list of those calls. Click
Yes or No as appropriate.

Fault
Code - Click the Fault Code button
to select a fault code for the UPM call. Because fault codes consist
of a Code ID and a Fault Type (see above), if youve already selected
a fault type, the fault codes you can select from are limited to those
codes in which the selected fault type is a component.

6. If applicable, enter
   necessary remedy information in the Remedy Data section. If you
   know the code you want to assign, select a Remedy Code first and
   the Remedy Type defaults to the remedy type defined in the code.

Remedy
Type - Click the Remedy Type button
to select a remedy type for the UPM call. You must select at least
a remedy type for each UPM call. If you select a remedy code for which
a calls exists with same remedy type/code, VISUAL presents you with
a dialog box, asking if you want to view a list of those calls. Click
Yes or No as appropriate.

Remedy
Code - Click the Remedy Code button
to select a remedy code for the UPM call. Because remedy codes consist
of a Code ID and a Remedy Type (see above), if youve already selected
a remedy type, the remedy codes you can select from are limited to
those codes in which the selected remedy type is a component.

7. View and verify equipment
   details in the Equipment Details tab. After selecting a piece
   of equipment, many of the fields are populated with the equipments
   default information:

Customer ID
- The customer associated to the piece of equipment from Equipment
Maintenance. Each equipment profile must have a Customer ID.

Part
ID - The part master associated with the equipment from the
Equipment Maintenance window. When you process a work order for a
UPM call, VISUAL, if the piece of equipment has a Part ID associated
to it, creates the work order with a header card for this material.
There may not be a value in this read-only data field; only if youve
associated a Part ID to a piece of equipment will an ID appear. Because
it is not a required field in Equipment Maintenance, this field may
be empty.

Mfg
WO - The Work Order ID you have associated to the piece of
equipment from Equipment Maintenance. Because it is not a required
field in Equipment Maintenance, this field may be empty.

Serial
Number - If there is one, the serial number for the equipment
from Equipment Maintenance.

Mfg
Date - The date of manufacture of the equipment from Equipment
Maintenance.

Type
- The equipment type from Equipment Maintenance.

Model
- The equipment model from Equipment Maintenance.

Area
- The area where maintenance in performed on the equipment.

Branch
- The branch where maintenance in performed on the equipment.

Internal - The Internal
option button is selected if the equipment is an internal piece of
equipment.

External
- The External option button is selected if the equipment is an external
piece of equipment.

If there is a picture of the equipment,
click the Picture button on the main toolbar.

8. Click
   the Equipment Maintenance tab to view
   and verify more equipment information.

Maintenance
ID - The Maintenance ID of the equipment from Equipment Maintenance.

Machine
ID - The Machine ID of the equipment from Equipment Maintenance.

Class
- The equipment class from Equipment Maintenance: Labor Only, None,
Parts and Labor, and Parts Only

Contract
No - The Contract number from Equipment Maintenance.

Date
From/To - The
starting/ending date of coverage on the equipment. This is from Equipment
Maintenance.

Hours
From/To
- The starting and ending hours during the days within the coverage
period. This is from Equipment Maintenance.

Period
(Months) - The period of coverage on the equipment. This is
from Equipment Maintenance.

9. Click
   the Work Order Details tab and specify engineering
   information before you create the work order for the UPM call.

10. If you want to create
    a new work order for the current call, enter a unique ID in the
    WO Base ID data field. If you want to select an existing work
    order (doing so allows you to view the order in the Manufacturing
    Window by clicking the WO Base ID button again, after the WO Base
    ID appears), click the WO Base ID button and select the work order
    from the service calls table. Only work orders created using the
    Unplanned Maintenance window appear in the service calls table.

If you enter a unique ID, VISUAL asks you
if you want to create the new work order after you tab out of the
field, regardless of there being enough work order detail to save
the work order. If you are using auto-numbering, let the next available
number be selected for you.

If you choose to create the work order without
having entered all for the required information, VISUAL prompts you
to choose more work order settings. Dont stop at this point. Continue
to enter at least the required information. At any time, you can process
a work order by clicking the Process WO button on the main toolbar.
If required fields are still empty, you are told what information
is missing. For example, the dialog box below asks you to enter a
Task Time, a required field.

11. Enter a task time in hours for the work order. Task time
    is an estimation of how long it will take you to complete the
    task. This is a required field; only number values are valid.

12. Enter a travel time in hours for the UPM call.
    Travel time is how long it takes you to arrive at an external
    location to complete a UPM call. This is not a required field.
13. If different than the
    displaying date, select a new Requested
    Date by clicking the calendar icon or manually entering a date.
    A requested date is the date on which the service call work order
    was requested. The requested date defaults to your current system
    date. This is a required field. After processing the work order,
    you cannot edit this field.

If different than the displaying date, select
a new Confirmed
Date by clicking the calendar icon or manually entering a date. A
confirmed date is the date on which the service call work order was
confirmed. The confirmed date defaults to your current system date.
This is a required field. After processing the work order, you cannot
edit this field.

14. Select an Engineer ID
    for the work order by clicking the Engineer ID button. If the equipment has a
    default Engineer ID, VISUAL auto-fills this field when you select
    an Equipment ID. To select a different Engineer ID, click the
    Engineer ID button.

The Select Resource for Equip ID: (current
piece of equipment) dialog box appears.

The equipment Type, Model, Area, and Branch
appear in the fields at the top of the dialog box. Click any of the
buttons to view a searchable table of all current Types, Models, Area,
and Branches. Fault Type and Fault Code do not appear unless you have
already selected a a type and code for the current work order. You
can click the Fault Type and Fault Code button to view a searchable
table of all current fault types and fault codes.

15. If no Engineer IDs appear
    in the table, click the Search button
    to view all eligible IDs.

Highlight a line and click Ok
or double-click the line. The dialog box closes and VISUAL returns
you to the Unplanned Maintenance window.

16. If the repair is standard,
    click the Std Repair button. A UPM Standard
    Repair searchable table appears. Select the appropriate standard
    repair. Before you can select a standard repair, you must enter
    standard repair types. See the section, "Defining Standard
    Repair Types" for more information.
17. If you want to view
    all occurrences of the Engineer ID in an existing schedule, select
    a Schedule
    ID from the list box and click the View Schedule
    button.

A table appears containing all work orders
in the selected schedule that use the Resource ID.

If you want to view a work order in the
Manufacturing Window, from the Info menu select View
Selected Work Order or press Shift+F9.

18. You can now process
    the work order even though you may choose to enter more information.
    If so, read the following sections for more on specifying information
    not necessary to the work order, but useful in the interest of
    maintaining a complete and well-ordered database.
19. Click Save
    on the main toolbar to process the work order and save the UPM
    call. You can also click the Process Work Order button to process
    the work order. Continue reading for more on specifying address,
    contact and billing information.
20. Click
    the Address tab.

The default address of the customer for
whom you are entering this UPM call displays in the field. This address
is from Customer Maintenance.

Click the Address button on the main toolbar to select a
different customer address.

The Addresses(Current Customer) dialog
box appears.

21. Either double-click
    an address or highlight a line and click Ok.
    Click Use Default to revert to the customers
    default address.

The customer address appears in the appropriate
fields.

22. Click the
    Contact tab
    and specify the
    contact for this unplanned maintenance call. By default, the primary
    contact information for the customer is displayed. You can specify
    a different contact. You can select a contact with an ID or enter
    a standalone contact for this transaction only.

* To
  select a contact with a registered Contact ID, use one of these
  methods:

Select
an alternate contact -
Click the Contact browse button and select a
contact from the browse table showing contacts assigned to the customer.
Select the Use Selected Contact toolbar
button.

Select
a contact from all contacts -
Click the Contact browse button and then click
the Associate existing contact toolbar
button. Select a contact from the Contacts dialog and click
Ok.
In the Contacts for Customer dialog select the contact and then click
the Use Selected Contact toolbar button.

Specify
a new contact in the Contacts for Customer dialog - Click the Contact
browse
button. Click the Add New Contact
button
and specify contact information in the General tab and Address tab
fields. Click the Save toolbar button.

You
can also assign contacts to customers in the Contact Maintenance window.

* To specify a standalone
  contact, specify the contact information in the fields on the
  Contact tab. If contact information is already displayed in the
  tab, you can edit the existing information to create a standalone
  contact. When you edit the information, the Contact ID field is
  cleared. The edits that you make in the Contact tab do not update
  contact information in your Contact table. Standalone contact
  information is saved with the transaction only and is not added
  to your Contacts table. If you anticipate using this standalone
  contact again, Infor recommends creating a contact with a Contact
  ID.

Specify
this information:

Contact/ID
Name - Enter
the contacts full name and review the ID number. A contact without
an ID number does not display in Contact Maintenance.

Position
- The contacts position or title in the company.

Salutation
- Enter the salutation that you want to use for the vendor contact.
This field is a pull down box of the most popular salutations.

Phone/Ext
- Enter
the telephone number, with area code and extension, for the contact.
This may be a direct line to the contact, or a generic company line.

Fax
- Enter the area code and Fax number.

Mobile
- Enter the contact's mobile phone number.

E-Mail
- Enter the appropriate
vendor E-Mail address.

Standalone
contacts are not added to the Email Documents list for the vendor.
Only contacts with IDs can be added to the Email Documents list.

If
you do not want to assign a contact to this order, click the
Use
No contact toolbar
button.

23. Click
    the Billing tab to enter customer order
    and invoice information for a work order. For every work order,
    you have the option of creating a customer order and an invoice.
    After (or before) processing a work order, enter a Customer Order
    ID and an Invoice ID. When VISUAL has created the order, use the
    Billing function of the Unplanned Maintenance window to generate
    a customer order and/or an invoice.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Unplanned_Maintenance.md) User-defined Help