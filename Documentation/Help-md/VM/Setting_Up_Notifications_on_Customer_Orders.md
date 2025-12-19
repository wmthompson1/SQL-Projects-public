Setting Up Notifications on Customer Orders




# Setting Up Notifications on Customer Orders

In Customer Order Entry, you specify the customer contact who receives
notifications. You can also override the default settings that you
set up for the customer in Customer Maintenance.

1. Select Sales,
   Customer Order Entry.
2. Select an existing order,
   or create a new order.
3. To specify the customer
   contact that receives notifications, click the Contact
   tab. If a primary contact has been specified for the customer,
   the contacts information is displayed. You can select a different
   contact or enter a free form contact. Make sure you specify an
   email address for the contact. If an email address has not been
   specified, then an email dialog is opened each time a triggering
   event occurs.
4. Click the Notifications
   tab. If you set up default settings for the customer, the default
   settings are displayed.
5. To send notifications,
   select the Email Notification check
   box.
6. The Notify Me check
   box is available if these conditions are met:

* The user ID
  that you signed into VISUAL is specified in the User ID field
  for an employee in Employee Maintenance.
* The employee
  record associated with the user ID includes an email address.

7. Select the check box
   to receive internal notifications. The email address specified
   for your employee ID in Employee Maintenance is displayed.
8. In the Send Notification
   to Order Contact section, select the notifications to send to
   the customer:

Email on New Order
Select this check box to email the customer when a customer order
is saved for the first time.

Note:
In terms of notification status, a customer order is considered new
until the first email notification for the specified customer order
is sent.

Email on Changed Order
Select this check box to email the customer when changes to a customer
order are saved.

Email on Shipment
Select this check box to email the customer when a shipment has
been made for the order. If multiple shipments are sent to fulfill
an order, then emails are sent for each shipment. If a packlist for
the order is edited, an update notification is sent.

Notifications Sent 
This check box contains a checked value if an email notification is
sent for the current customer order at least once. This is a read-only
check box.

9. In the Send Internal
   Notifications section, use the check boxes to specify when employees
   receive notifications. In addition to the Email on New Order,
   Email on Changed Order, and Email on Shipment check boxes, you
   can select the Email on Invoice Payment to send a notification
   to an employee when payment for the shipment is received.
10. To edit the list of
    internal recipients that receive notifications for this order,
    select Edit, Order
    Notifications. The selections that you made on the Notifications
    tab are displayed.
11. To select the employees
    that receive notifications, click the Internal
    Employee browse button. One tab for each notification event
    is displayed. The tab is active only if you selected the corresponding
    check box in the Send Internal Notifications section.
12. Click the tab for the
    business event that you are setting up. A list of available employees
    is displayed. To be displayed in the list, the employees record
    in Employee Maintenance must meet these requirements:
13. An email address
    must be specified for the employee
14. The employee
    must be active

13. Select the employees
    to notify, then click the Add to Selected List
    button.
14. Click Ok.
15. Complete the order and
    then click the Save button.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](VMNFTMNTfrmNotification.md)
Creating Email Templates for Notifications

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Concepts_Common_Features.md)
User-defined Help