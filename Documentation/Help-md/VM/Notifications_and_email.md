Notifications and Email




# Notifications and Email

You can email information about transactions directly to customer
contacts, vendor contacts, and internal contacts. You can send emails
in two ways: through notifications or manually.

When you set up notifications, notification emails can be sent automatically
or delayed to be sent on demand using a Manual Override option when
certain business events occur, such as the creation of a customer
order. Emails are sent to the contact specified on the customer order
or purchase order and to the internal contacts that you associate
with the customer or vendor in Customer Maintenance and Vendor Maintenance.

To manually send emails, select the Email option when you generate
reports. To specify who receives the email, use the Email Documents
dialog in Customer Maintenance and Vendor Maintenance. When you manually
send emails, the report that you generate is included in the email
as an attachment. Depending on the report you are sending, you can
also send documents

This table shows the key differences between sending email notifications
and sending an email manually:

|  |  |  |
| --- | --- | --- |
|  | **Notifications** | **Manual email** |
| When is the email generated? | After you set up notifications, the email can be sent automatically or manually in response to override prompt when one of these business events occurs:   * A   customer order is created * A   customer order is edited * A   shipment is sent * A   payment for an invoice is created (sent to internal contacts   only) * A   purchase order is created * A   purchase order is edited * A   purchase is received * A payment   for an invoice is created (sent to internal contacts only)   In addition, a notification email is generated on demand when you click Send Notification icon for relevant document. | The email is generated when you run a report with the Email output option. |
| What is sent? | An email acknowledging that a business event, such as the creation of a customer order, has occurred. Use Notification Maintenance to specify the content of the email. You can use placeholder tokens to include information from the database, such as the amount of the order. | An email with a copy of the report attached. |
| Who receives the email? | For sales transactions, the customer contact specified on the order. The internal contacts that you specify for the customer receive a copy of the email. The email is not directly addressed to internal contacts. Set up internal contacts for a customer in Customer Maintenance.    For purchasing transactions, the vendor contact specified on the order. The internal contacts that you specify for the vendor receive a copy of the email. The email is not directly addressed to internal contacts. Set up internal vendor for a customer in Vendor Maintenance. | For sales documents, the contacts that you specify in the Email Documents dialog in Customer Maintenance. In Customer Order Entry, the contact specified on the order can also receive the email.    For purchasing documents, the contacts that you specify in the Email Documents dialog in Vendor Maintenance. In Purchase Order Entry, the contact specified on the order can also receive the email. |
| How do I create the subject, header, body, and footer of the email? | Specify the content of the email in Notification Maintenance. You can use placeholder tokens to include information, such as the amount of the order, in the email. | For Accounts Receivable Invoices, you can specify the content of the email in  Notification Maintenance.    In all other instances, you must specify the content of the email manually. In report dialogs, select the **Preview** check box to edit the email before you send it. If you do not select the **Preview** check box, the report is attached to a blank email and sent. |
| Are documents that I have attached to a transaction also sent? For example, if I attach a document to a customer order, is that document attached to the email? | No. Documents attached to sales or purchasing transactions are not sent. | Not automatically. If you preview the email before you send it, you can attach additional documents. |
| Where can I see a record of the emails that have been sent. | In Customer Order Entry and Purchase Order Entry, use the Notification History dialog to review a list of notifications that have been sent for a transaction. | A record of the emails is not kept in VISUAL, but the email attachments are stored in the directory that you specify in Document Maintenance. You can set up a different directory for each site. If you do not set up directories, then the email attachments are stored in the same directory as your VISUAL executables. |
| Where can I see a record of the delayed notification emails that are pending. | In Customer Order Entry, Shipments, Cash Application, Purchase Order Entry, Purchase Receipt Entry and Payment Entry, use the Notification Pending dialog to review a list of notifications that are relevant but have not yet been sent at least once for a transaction. | Pending Email is not applicable. |