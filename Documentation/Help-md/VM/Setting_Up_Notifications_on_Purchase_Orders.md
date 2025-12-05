Setting Up Notifications on Purchase Orders




# Setting Up Notifications on Purchase Orders

In Purchase Order Entry, you specify the vendor contact
who receives notifications. You can also override the default settings
that you set up for the vendor in Vendor Maintenance.

1. Select Purchasing,
   Purchase Order Entry.
2. To specify the vendor
   contact that receives notifications, click the Contact tab. If
   a primary contact has been specified for the vendor, the contacts
   information is displayed. You can select a different contact or
   enter a free form contact. Make sure that you specify an email
   address for the contact. If an email address has not been specified,
   then an email dialog is opened each time a triggering event occurs.
3. Click the Notifications
   tab. If you set up default settings for the vendor, the default
   settings are displayed.
4. To send notifications,
   select the Email Notification check
   box.
5. The Notify Me check
   box is available if these conditions are met:

* The user ID
  that you signed into VISUAL is specified in the User ID field
  for an employee in Employee Maintenance.
* The employee
  record associated with the user ID includes an email address.

Select the check box to receive internal
notifications. The email address specified for your employee ID in
Employee Maintenance is displayed.

6. In the Send Notification
   to Order Contact section, select the notifications to send to
   the vendor:

Email on New Order
Select this check box to email the vendor when a purchase order
is saved for the first time.

Note:
In terms of notification status, a purchase order is considered new
until the first email notification for the specified customer order
is sent.

Email on Changed Order
Select this check box to email the vendor when changes to a purchase
order are saved.

Email on PO Receipt
Select this check box to email the vendor when a shipment has been
received. If multiple purchase receipts are used to fulfill an order,
then emails are sent for each receipt.

Notifications Sent 
This check box contains a checked value if an email notification is
sent for the current purchase order at least once. This is a read-only
check box.

7. In the Send Internal
   Notifications section, use the check boxes to specify when employees
   receive notifications. In addition to the Email on New Order,
   Email on Changed Order, and Email on Shipment check boxes, you
   can select the Email on Invoice Payment to send a notification
   to an employee when payment for the purchase receipt is sent.
8. To edit the list of
   internal recipients that receive notifications for this order,
   select Edit, Notifications.
   The selections that you made on the Notifications tab are displayed.
9. To select the employees
   that receive notifications, click the Internal
   Employee browse button. One tab for each notification event
   is displayed. The tab is active only if you selected the corresponding
   check box in the Send Internal Notifications section.
10. Click the tab for the
    business event that you are setting up. A list of available employees
    is displayed. To be displayed in the list, the employees record
    in Employee Maintenance must meet these requirements:
11. An email address
    must be specified for the employee
12. The employee
    must be active

11. Select the employees
    to notify, then click the Add to Selected List
    button.
12. Click Ok.
13. Complete the order and
    then click the Save button.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](VMNFTMNTfrmNotification.htm)
Creating Email Templates for Notifications

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Concepts_Common_Features.htm)
User-defined Help