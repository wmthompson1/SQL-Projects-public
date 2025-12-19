Generating Deadline & Recurring Events




# Generating Deadline & Recurring Events

You can set Message Maintenance to alert you when
a deadline for a certain event has arrived. You can also set Message
Maintenance to alert you of recurring events.

## The following is an example of a deadline event for a customer order.

1. First set up the event.

Enter or select
the following information from the Event Maintenance window:

1. * Class: Deadline event
   * Action: Popup
   * Status: Active
   * Type: Customer order
   * Base ID: CO-001

The Do Until field
in the Frequency section is now grayed out, but the date field allows
an entry.

2. Enter a deadline date
   in the Do Until field.
3. Under the Message Tab
   enter:

Customer order %ID Desired ship date %1 needs
immediate attention as of %2.

4. Under the Query Tab
   enter:

select id from customer\_order where id=%BASE\_ID

and status not in(C,X)

and desired\_ship\_date<=SYSDATE INTO %BASE\_ID

5. Under the Tokens Tab
   enter:

select desired\_ship\_date,SYSDATETIME from
customer\_order

where id=%BASE\_ID

6. Click the Save
   button to save the event.
7. Now go to Customer Order
   entry and create order CO-001, with the Desired ship date set
   to the deadline date.

Enter any part, quantity, vendor, and price.

8. Save the customer order.
9. Now return to Message
   Maintenance and select Process Events
   from the File menu.
10. Click the Generate
    Deadline/Recurring Events button.

VISUAL produces the proper message for the
deadline event. If the system date is after the desired ship date,
the system automatically generates the proper message every time you
log on to VISUAL.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Message_Maintenance.md) User-defined Help