Entering Engineering Change Control Information




# Entering Engineering Change Control Information

Engineering Change Control is a mechanism to control
the process of changing engineering masters and work orders. You can
use Engineering Change Control for:

* Notifying production and
  engineering of pending changes.
* Tracking approvals needed
  to make changes.
* Preventing specific transactions
  to in-process work orders during pending changes.
* Auditing changes.
* Applying changes made to
  a master, to some or all work orders of the same part.

1. Select Engineering
   Change Control from the File
   menu, then Engineering Change Notices from the pop out menu.

The Engineering Change Control window appears.

2. Enter the Engineering
   Change Notice ID in the ECN ID field.

The Engineering Change Notice ID is a unique
identifier assigned to each change notification. An entry is required.

3. Select a status for
   the engineering change notice from the Status drop down menu.
   Select from:

Pending - Indicates
that the ECN is active and all notification and information mechanisms
report the ECN, depending on the transaction taking place.

Complete - Indicates
that the ECN is complete, all changes have been made and approved.
No notifications are given for a complete ECN. In effect, it is a
historical entry and becomes the audit trail.

Canceled - Indicates
that the ECN has been canceled. Canceled ECNs may be deleted or marked
as canceled to keep the comments made to it as history, even though
the changes were never carried out.

4. Enter the date the engineering
   change notice was created in the Created field. You can also use
   the calendar to select a date.
5. Enter the date the engineering
   change notice was modified in the Modified field. You can also
   use the calendar to select a date.
6. Enter the originator
   of the engineering change notice.

This is a semicolon-separated list of individuals,
the department, or other identifying code that indicates who originated
the ECN and who is responsible for it. The owner (user ID that created
the ECN) and any user IDs in this list are the only users who have
permission to modify the master or work order that is the subject
of the ECN. The system determines which users are permitted for modifying
the master or work order.

7. Enter any other engineering
   change notices associated with this engineering change notice
   in the Assoc ECN field.
8. Enter the subject of
   the ECN in the Subject field.

The subject is an optional short note that
helps to identify the ECN descriptively. It may also list document
numbers that are calling for these changes.

9. Enter the person, department,
   or other identifying code that indicates who has granted the authorization
   for the changes being made.

There are four supported authorization fields.
Note that authorizations are there to be used procedurally. There
is no automatic action taken by the system as a function of the contents
of these fields.

10. Enter the four Date
    fields to enter the dates on which the authorization is fulfilled.
    You can also use the Calendar to select a date.
11. Click the Notes
    button and enter any pertinent information on the engineering
    change notice.
12. Click the Details
    button to view information about the engineering change notice:

Entry # - This
table contains one line for each entry. Each line, if system generated,
is directly associated with a given object in the master or work order.

Ref - Sub ID,
Operation Seq #, and Required piece # together identify the object
within the master or work order that has been modified.

Action - This
is the action being performed on the ECN ID. The action status is
furnished below:

A=Added, E=Edited, D=Deleted (or X if it
is a manual entry).

Child Notify -
If checked, the system notifies users entering transactions related
to the master, work order, or part in question, if the relationship
is immediately subordinate to the modified record. For instance, if
this ECN record references a sub ID (one leg of the master or work
order), the operations, and materials of that leg would behave as
if they, too, were subject to the ECN.

If set off, the system only recognizes pending
changes if the transaction affects a specific record of this list.
For instance, if an operation has been affected, labor ticket entry
would notify and prevent changes for a labor ticket of the same operation.
Material issues would not be prevented. Default value is off.

Lock - If set
on, the system notifies any user attempting a transaction against
this record that an engineering change is pending. The user is not
permitted to override the notification.

If set off, the notification may by overridden
and is reported as a warning. The default is to lock.

Comments - Up
to 250 characters of comment information specific to this change.

13. Click the Save
    button.

VISUAL saves the engineering change notice.

![btn_mini.gif](btn_mini.gif "btn_mini.gif") Activating
an Engineering Change Control Notice for a Work Order

![btn_mini.gif](btn_mini.gif "btn_mini.gif") Activating
an Engineering Change Control Notice for a Master

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](Applying_Change_Notices_to_Work_Orders.md) Applying Change Notices to Work Orders

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Manufacturing_Window.md) User-defined Help