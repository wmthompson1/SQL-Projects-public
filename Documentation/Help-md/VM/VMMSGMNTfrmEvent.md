Setting New Events




# Setting New Events

An "event" is a point in time at which a
specified action occurs to a document. Message Maintenance helps you
keep track of events. For example, you can set Message Maintenance
to alert you when the status of a customer order changes. You can
set up and change the preferences by which Message Maintenance processes
the events.

First, complete the information in the Event section of the window.

1. Enter an Event ID, or leave the field blank for the system
   to generate one automatically.

The Event ID must be a unique numeric value.

2. Select the event class
   from the Class drop down box.

The class is the action performed on the
selected document that triggers the event.

You can select the following classes:

Status change
- The STATUS value of the document has changed. For example, a customer
order may change from Firm to Released.

Line item change
- Data on a line item of the document has changed.

Operation change
- Data on an operation of the work order or master has changed.

Requirement change
- Data on a requirement of the work order or master has changed.

Update - An update
of an existing record having the primary key of the event entry has
occurred.

Insert - A new
record having the primary key of the event entry has been inserted.

Delete - An existing
record having the primary key of the event entry has been deleted.

Query - Based
on a user-defined query.

Deadline Event
- Based on a user-defined query executed on a specific date.

Recurring Event
- Based on a user-defined query executed on a specific date and then
once a day from that time onwards.

3. Select the appropriate
   action from the Action drop down box.

This is the action that Message Maintenance
executes when an event is triggered.

You can select the following actions:

E-mail - VISUAL
sends an email to the specified recipients. It is MAPI compliant only.

Hold - VISUAL
holds the event for manual processing. You can then open the Process
Events dialog box to process events with a Hold status.

Print - VISUAL
sends a message to the printer set up as the recipient. When Print
is chosen, the recipient field is disabled.

Popup - VISUAL
displays a pop up message on the specified recipients screen.

Execute - VISUAL
executes a predefined query set up using the Message tab.

4. Select the appropriate
   status from the Status drop down box.

This is the status you want to set for the
event you are creating.

You can select the following status conditions:

Active - This
is a currently active event. VISUAL processes Active events when they
are triggered.

Completed - This
is an event that has met the conditions you specify in the Frequency
section, but VISUAL has not processed.

Suspend - This
status temporarily suspends the event trigger.

Canceled - This
status permanently cancels the event. Choose Canceled over deleting
the event to keep a record of the event.

Now complete the information in the Document
section.

5. Select the document
   type from the Type drop down menu. This is the type of document
   that you want VISUAL to monitor for changes.

You can select the following document types:

* All
* Customer Order
* Purchase Order
* Work Order
* Engineering
  Master
* Shipment
* Service Dispatch
* Receipt
* A/R Invoice
* A/P Invoice
* Quotation
* Part
* Engineering
  Change
* Requisition

6. If appropriate, enter
   a document ID in the Base
   ID field.

For example, enter a Base ID for a work
order, or an ID for customer orders and purchase orders.

7. For engineering masters,
   quote masters, and work orders only, enter a Lot
   ID and a Split ID in
   the Lot ID and Split ID fields.

This further limits the triggering to specific
documents.

Now complete the information in the Frequency
section.

8. Select the appropriate
   Frequency radio button.

The Frequency is the number of times VISUAL
processes an event after it has triggered.

You can select the following:

Permanent
- Select this to process the event each time it is triggered.

Repeat xx Times - Select
this to process the event a specified number of times. Enter a value
in the number of times field.

Do Until xx - Select
this to process the event each time it is triggered until the specified
date. Enter the date in the date field, or use the calendar button
to select a date.

For deadline events, the Do Until button
is grayed out, but the date represents the deadline date for the event.

Enter information in the Message section.

9. Enter the appropriate
   information in the following fields:

Sender
- Enter the user who created the event.

Recipient
- Enter the mail recipient who is to receive the message. You can
click the browse button to the right of the field to select a user
from your mail application. To send inter-office email and Internet
email, separate each name with a semi-colon.

Subject
- Enter the subject of the message. This appears on the pop up, email
message, or printed document. This field is optional.

10. Select
    the Message
    tab and enter a descriptive message for the triggered event.

You can also use this tab to execute a query,
which performs an action on the database. The message may contain
placeholders or tokens.

11. Click
    the Data tab and enter or paste binary
    data, pictures, bitmaps, or text documents, for example.

You can click the Picture button and select an object from the Set
Picture/Object dialog box.

12. Click
    the Query
    tab and enter a valid SQL query that you can use as a triggering
    test.
13. Click
    the Tokens
    tab and enter a query that is executed to fill in the placeholder
    tokens that may have occurred in the descriptive messages.

The supported tokens are:

* %TRIGGER\_DATE
  - Date event was triggered.
* %TRIGGER\_DATETIME
  - Date and time the event was triggered.
* %
  TRIGGER\_TIME - Time the event was triggered.
* %USER
  - User ID that triggered the event.
* %ID
  - Document ID that triggered the event.
* %TYPE
  - Document type that triggered the event.
* %BASE\_ID
  - Document base ID that triggered the event.
* %LOT\_ID
  - Document lot ID that triggered the event.
* %SPLIT\_ID
  - Document split ID that triggered the event.
* %EVENT
  - Event ID that was triggered.

The supported Placeholders are:

* %1,%2,%3 and
  so on.
* %1L, %2L, %3L
  and so on.
* The %<number>L
  placeholder is for binary data or long descriptions.

Here is an example using the Message, Query,
and Token tabs. You may enter the following message in the Message
tab:

A new customer order %ID Customer ID %1
PO# %2 Ship Date %3 has been created. Please have it shipped.

%1 indicates the first value from the query
below, %2 the second value, and %3 the third value.

An example of a query setup using the Tokens tab that provides data for the placeholders
for the above message.

select customer\_id, customer\_po\_ref, desired\_ship\_date
from customer\_order where ID=%ID

The results output may look like this:

A new customer order 1234 Customer ID 4567
Ship Date 06/03/2001 has been created. Please have it shipped.

14. Click the Save
    button to save the new event.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Message_Maintenance.htm) User-defined Help