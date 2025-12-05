Purchasing Transactions That Trigger Notifications




# Purchasing Transactions That Trigger Notifications

In Purchase Order Entry, you can specify which events trigger notifications
for the contact on the order and for internal employee contacts.

This table shows the sales events that trigger notifications:

|  |  |  |
| --- | --- | --- |
| **Business event** | **Notification recipients** | **Purchase Order Entry Setting** |
| Create a purchase order    Click Send Notification icon    Select Send Notification menu option | Purchase order vendor contact | Email on New Order check box in Send Notification to Order Contact section |
| Internal recipients specified for the transaction on the purchase order | Email on New Order check box in Send Internal Notifications section |
| Edit a purchase order    Click Send Notification icon    Select Send Notification menu option | Purchase order vendor contact | Email on Changed Order check box in Send Notification to Order Contact section |
| Internal recipients specified transaction on the purchase order | Email on Changed Order check box in Send Internal Notifications section |
| Receive a purchase order    Click Send Notification icon    Select Send Notification menu option | Purchase order vendor contact | Email on PO Receipt check box in Send Notification to Order Contact section |
| Internal recipients specified for transaction on the purchase order | Email on PO Receipt check box in Send Internal Notifications section |
| Send a payment    Click Send Notification icon    Select Send Notification menu option | Notifications are not sent to vendors for this event | n/a |
| Internal recipients specified for the transaction on the purchase order | Email on Invoice Paid check box in Send Internal Notifications section |

You can use Vendor Maintenance to set up default notification settings
for each vendor. You can specify default settings for the events that
trigger notifications. You can also build a list of employees who
should receive notifications when events occur for purchase orders
for the vendor.

You can use preference settings in Notification Maintenance to override
the automatic notification email and only send the notification when
you select Yes to a prompt to send the notification, or by clicking
the Send Notification icon or menu. option.