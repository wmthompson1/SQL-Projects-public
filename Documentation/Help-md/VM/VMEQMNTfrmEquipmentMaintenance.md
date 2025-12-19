Entering Customer Equipment Information



    

# Entering Customer Equipment Information

The Equipment Maintenance window is divided into two
sections: Header and Tabs. Click the appropriate button for more information
on entering equipment information.

## Entering Header Information

1. If you are licensed
   to use multiple sites, click the Site ID arrow and select the
   site to use. If you are licensed to use a single site, this field
   is unavailable.
2. Click the Equipment ID button
   and select an existing piece of equipment or enter a unique ID
   for this piece of equipment in the data field.
3. Click the Customer ID
   button and select the customer for whom you are entering equipment
   information.

If you know the Customers ID, enter it
in the field. If you enter an incorrect Customer ID, VISUAL returns
an error, informing you the customer does not exist.

Only customers you have added to your VISUAL
database are eligible for selection. For more information on adding
customers to your database, click [here](VMCUSMNTfrmCustomer.md).

The customers default shipping address
appears in the data field to the right.

4. From the Edit menu,
   select Set Address.

A dialog box containing all valid addresses
for the customer appears. Double-click the correct address line and
VISUAL loads it into the read-only address box to the right.

To revert to the customer's default address,
select Reset Address from the Edit menu.

5. Click the Type button and select
   an equipment type for this entry.

6. Click the Model button and select
   an equipment model for this entry.

If you select an equipment type, you may
not be able to select a model. Base the piece of customer equipment
on an existing equipment type or a specific model. If you select a
type with no corresponding model, you cannot choose a model without
changing the type.

## Entering Information on the Equipment Tab

The Equipment tab contains basic information about
the equipment.

1. Click the Equipment
   tab.
2. Click the Mfg Date calendar
   button or manually enter the date of manufacture for the equipment
   in the data field.
3. If applicable, click
   the Part ID button and select the appropriate
   part from the list.
4. If applicable, enter
   an engineering release number for this equipment in the List Rels field.
   An entry in this field is not necessary.

Every piece of equipment has a unique series
of engineering release numbers.

For existing Equipment IDs, click the List Rels button to select from a list of all
engineering releases.

The Engineering Releases for the Equipment
ID dialog box appears.

After you save an Equipment ID, VISUAL populates
the Release Date field with the appropriate date.

If you entered a new release number, click
the Calendar
button and select the appropriate date.

5. In the text box, enter
   a description
   if appropriate.
6. If this piece of equipment
   has a serial number,
   enter it in the Serial Number field. You do not need to enter
   a serial number, however serial numbers may help you differentiate
   between similar pieces of equipment.
7. Click the Area button to select
   the area for equipment maintenance. In order to view areas in
   this table, you must have previously entered Areas using the Maintenance
   menu option Service Area Maintenance.
8. Click the Branch button to
   select the branch for equipment maintenance. In order to view
   branches in this table, you must have previously entered branches
   using the Maintenance menu option Service Branch Maintenance.

If you already selected an Area,
only those Branches with the selected Area in their profile appear.

9. Click the Work Order button
   and select a work order for the piece of equipment.

If you already selected a
Part ID, you can only choose a work order with the same Part ID. You
must clear the Part ID field if you want to view all work orders in
the database. Although VISUAL treats this as the equipments default
Work Order ID, you can specify unique Work Order IDs when processing
UPM calls in Unplanned Maintenance. Use it to communicate to engineering
personnel an approximate work order model for the equipment.

10. From the Location section,
    select the appropriate option button for the maintenance location.

External - Maintenance on the equipment is performed
externally, or away from the site.

Internal - Maintenance on the equipment is performed
internally, or on-site.

## Entering Information on the Maintenance Tab

The Maintenance tab contains maintenance information
about the equipment.

1. In the Resource
   ID section, enter the following information:

Machine
ID - Click the Machine ID button
and select resource.

Engineer - Click
the Engineer button and select the resource who will perform the maintenance.

For external maintenance, this option in
unavailable; for internal maintenance, this field is required.

2. In the Misc. Details
   section enter the following information:

Maint.
ID - Enter a Maintenance ID or click the Maint
ID button to select an ID. In order to view Maintenance IDs,
you must have previously entered them using the Maintenance menu option,
Maintenance Type.

Class
- Click the Class arrow and select the class to which you want this
equipment to belong.

Contract
No - Enter a contract number. Contract numbers can be a maximum
of 15 alphanumeric characters in length.

3. In the Price List section,
   enter the following information:

Labor
- For the labor charges for this equipment, click the Labor
button and select the price list you want to use.

Parts
- For the parts charges for this equipment, click the Parts
button and select the price list you want to use.

4. Specify if parts, labor,
   or mileage are to be free of charge. If they are, select the appropriate
   check box.

Parts
- Select the Parts check box if the charges
for the parts are free.

Labor
- Select the Labor check box if the charges
for the labor are free.

Mileage
- Select the Mileage check box if the charges
for the mileage are free.

5. In the Coverage section,
   enter the following information:

Starting and Ending Dates
- Enter the starting and ending date for the coverage of this equipment.
For example, enter a weeka period of seven daysto start. Later,
when you specify a period of coverage, you can apply seven days as
a base unit to longer periods of time.

Coverage
- Click the Coverage button to select a
type of coverage. You must click the button to select a type. In order
to view types, however, you must have previously entered them using
the Maintenance menu option, Coverage Hours Maintenance.

Period
- Enter the period, in months, of coverage.

## Entering Information on the Profiles Tab

The Profiles
tab contains information about the existing planned maintenance for
this equipment. You cannot enter any information into the Profiles
tab. Within the Profiles tab line item field, are equipment profiles
for Equipment ID currently in the window. Establish these profiles
for scheduling purposes in the Planned Maintenance window. Click [here](Entering_Equipment_Profiles.md) for more information.

Equipment Maintenance uses Standard VE Engineering masters as templates
for creating work orders. You can attach multiple maintenance profiles
to a piece of equipment. A maintenance profile consists of an ID,
a VE Engineering Master, a frequency type, and a frequency number.

A typical profile may be:

For equipment AXBC, Profile 4 says do EM 4, weekly, every 2 weeks.

When you create the work order later, the VISUAL creates jobs based
on the given profile.rts

The Profiles tab displays profiles for the Equipment ID. Enter profiles
in [Planned Maintenance](Entering_Equipment_Profiles.md).

If a piece of equipment has a Part ID, you cannot select a Profile
ID unless an engineering master exists for the Part ID. The Equipment
Maintenance window stores and maintains its own engineering masters.
VE Engineering Masters do not apply when establishing profiles.

If any profiles exist for a piece of equipment, they appear in the
line item table.

## Entering Information on the Contact Tab

Use the Contact tab to enter information for customer contacts.
A contact is someone within the customer organization with whom you
would communicate the details of a maintenance operation. By default, the primary contact information
for the customer is displayed. You can specify a different contact.
You can select a contact with an ID or enter a standalone contact
for this transaction only.

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

* To
  specify a standalone contact, specify the contact information
  in the fields on the Contact tab. If contact information is already
  displayed in the tab, you can edit the existing information to
  create a standalone contact. When you edit the information, the
  Contact ID field is cleared. The edits that you make in the Contact
  tab do not update contact information in your Contact table. Standalone
  contact information is saved with the transaction only and is
  not added to your Contacts table. If you anticipate using this
  standalone contact again, Infor recommends creating a contact
  with a Contact ID.

Specify this information:

Contact
ID/Name - Enter
the contacts full name and review the ID number. A contact without
an ID number does not display in Contact Maintenance.

Position - Enter
the contacts position. For example, CEO.

Salutation - Enter
the salutation to use for this vendor contact. This field has a drop-down
menu populated with some of the most popular salutations.

Phone/Ext

Enter the telephone number, with area code and extension, for the
contact. This may be a direct line to the contact, or a generic company
line.

Fax
- Enter the
area code and Fax number.

Mobile
- Enter the
contacts area code and mobile phone number.

E-mail - Enter the appropriate vendor E-mail address.

Standalone
contacts are not added to the Email Documents list for the vendor.
Only contacts with IDs can be added to the Email Documents list.

If
you do not want to assign a contact to this order, click the
Use
No contact toolbar
button.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Equipment_Maintenance.md) User-defined Help