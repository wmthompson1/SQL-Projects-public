Setting Up Progress Billing Events




# Setting Up Progress Billing Events

Use Progress Billing Entry to specify how and when
VISUAL generates invoices for a specific customer.

1. Select Sales,
   Progress Billing Entry.
2. If you are licensed
   to use multiple sites, click the Site ID
   arrow and select the site in which you created the customer order.
   If you are licensed to use a single site, this field is unavailable.
3. In the Order
   ID field, click the browse button and select the order to progress
   bill.
4. Select the customer
   order line to associate with an event, then select Edit,
   Billing Events.
5. Click Insert.
6. Specify information
   in these fields:

Description
Specify a description for the event in the Description field.

Billing Specify
the amount to bill the customer when the event happens. This is the
amount that is billed to the customer when the event happens. You
can specify the billing value as a dollar amount or a percentage of
the entire customer order by selecting the appropriate radio button.

Revenue Specify
the amount of revenue to recognize when the event happens. This is
the amount of the billing value that is realized revenue for your
company. You can specify the revenue value as a dollar amount or a
percentage of the billing value by selecting the appropriate radio
button.

If you do not specify a value in the Revenue
field, it is assumed that the entire billing amount for the event
is unrealized revenue.

Account ID Specify
an account for unrealized revenue.

If you do not specify an account in this
field, the account defaults to the G/L Interface table.

7. Specify a date in the
   Event Date field OR a Milestone ID in the Milestone ID field.

You can trigger the progress billing by
either event date or milestone, but you CANNOT have both in one event.

See [Creating
Milestones](Creating_Milestones.htm).

8. Click Save.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Progress_Billing_Entry.htm) User-defined Help