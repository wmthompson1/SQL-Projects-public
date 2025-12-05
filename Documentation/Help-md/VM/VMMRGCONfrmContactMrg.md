Merging Contacts




# Merging Contacts

**Caution:**
The Contact Merge Utility permanently changes the contact information
in your database. Make a backup of your database first.

Use the Contact Merge Utility to consolidate multiple contact entries
into one, and record those merges in a log file. By combining contacts
that are essentially the same, except for small variations like a
different e-mail address, you simplify the maintenance of your contact
list.

When you run the Contact Merge Utility all transactions of a duplicate
contact are applied to the parent contact and then the Duplicate Contact
IDs are removed from the database and replaced with your specified
Parent Contact ID. Optionally, you can update transactions with the
parent contacts name, position, and phone number, or append the parent
contact with specifications from the duplicate contact.

If you use CRM, you can only merge CRM contacts with a parent contact
that has a CRM Contact ID. You can only merge VISUAL contacts with
a parent contact that has a VISUAL Contact ID. If a parent contact
has both a VISUAL Contact ID and a CRM Contact ID, then any contact
can be merged with it.

In VISUAL the Parent Contact ID replaces the duplicate Contact ID
on these transactions: Customer Order Entry, Equipment Maintenance,
Inter Branch Transfer Entry, Inter Branch Transfer Receipt Entry,
Inter Branch Transfer Shipping Entry, Purchase Requisition Entry,
Purchase Order Entry, Estimating Window, Vendor RFQ Entry, Unplanned
Maintenance, Notation, Specification, Customer Contact, and Vendor
Contact.

In CRM the Parent Contact ID replaces the duplicate Contact ID on
these transactions: Addresses, Calendar, Contract, Custom, Doc Sent,
History, Opportunity, Service Order, Task, Calendar Contact, Contract
Contact, Opportunity Contact, Quote Contact, Event Attendee, Specification
and Account Contact.

To merge contacts using the Contact Merge Utility:

1. Navigate to the installation
   directory of Infor VISUAL and double-click the file VMMRGCON.EXE.
   If the default VISUAL installation directory is used, the Contact
   Merge Utility launches from C:\Infor\VISUAL\VISUAL MFG.

2. Select the parent contact
   from the contact
   table and click **Select
   Parent**.

Only
one parent is allowed in the parent contact
table.

3. Select one or more duplicate
   contacts from the contact table and click **Add Duplicate**.

The
selected contact is added to the duplicate
contact table. Delete the duplicate contact(s) by selecting the
contact(s) to be removed from the duplicate contact table and click
**Remove Duplicate**.

If
the duplicate contact has a VISUAL Contact ID then the parent contact
must also have a VISUAL Contact ID. Likewise, if the duplicate contact
has a VISUAL CRM Contact ID then the parent contact must also have
a VISUAL CRM Contact ID.

*Add
information about what duplicates can be merged with which parent.
(If the duplicate has a CRM Contact ID, then it can be merged with
a parent with a CRM Contact ID; if the duplicate has a VISUAL Contact
ID, it can be merged with a parent with a VISUAL Contact ID).*

4. To update the duplicate
   contact on transactions with only the Parent Contact ID, clear
   the **Update
   details of transactional records with parent contact information**
   check box. To update the duplicate contact with additional parent
   contact information such as: first name, initial, last name, honorific,
   position, phone, fax, mobile phone and e-mail, select this check
   box.

5. To retain only the parent
   contact specifications clear the **Concatenate duplicate contact(s)
   specifications on to the parent contact** check
   box. To append the duplicate contact specifications to the parent
   contact specifications, select this check box.

6. Click the **Log File**
   tab and specify the log file information:

**File Path**
Designate the file path directory for the Contact Merge Utility
log file. Click the File Path browse button to open the VISUAL standard
explorer window and search for the directory to specify where the
merge log will reside, or manually enter the file path. The file path
is saved to the local preference file VMMRGCON.INI with a variable
name of Log File Directory.

**File
Name** - Specify the name of the contact merge log
file where all contact merge processing entries are logged. The file
name is saved to the local preference file VMMRGCON.INI key with a
variable name of Log File Name.

7. Click the Merge tab to confirm your selections for the
   parent contact and duplicate contact(s).
8. Click **Start**. The
   contacts are merged and the results are written to the log file.
   The parent contact is updated with the customer or vendor associations
   of the duplicate contact(s).

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](VMMRGCONWhat.htm)
What is the Contact Merge Utility?

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](VMMRGCONInterfaceOvrvw.htm)
Navigating in the Contact Merge Utility

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](VMMRGCONContactTableSort.htm)
Sorting the contact table in the Contact Merge Utility