Adding Properties to Steps




# Adding Properties to Steps

To add properties to a step:

1. Right-click the step
   that you want to add or edit properties.

A menu appears.

2. Select Properties

The Step Properties dialog box appears.

|  |  |
| --- | --- |
| IMPORTNT.gif | The following read-only information appears in the dialog box status section: Status, Started on, Last notified, and Completed. For more information on status fields, refer to [Viewing Status Information](Viewing_Status_Information.md). |

3. In the Label field,
   enter a name for the step. You may want to consider using a name
   indicative of what you are attempting to accomplish on this step.
4. If you want the workflow
   re-evaluated each time a document (for example, a Purchase Order
   or Purchase Requisition) is saved, select a re-evaluation method
   from the Re-evaluation list. You can select one of the following:

Never - The workflow
is never re-evaluated.

and restart workflow
here - When re-evaluating, all previously completed steps in
the workflow is undone and the workflow is restarted at the current
step.

This function is necessary if the information
in a workflow document (for example, a customer order) changes frequently.

and continue where left
off - The workflow is re-started from the "start"
step and checks the properties of each rule and step in the workflow
to make sure conditions have not changed since the last time the document
was saved. If a condition has changed, the workflow proceeds down
the appropriate path.

When re-evaluating a workflow, the evaluation
sequence in the Rule Properties dialog box is checked.

For more information on evaluations, refer
to [Working with Evaluations](Working_with_Evaluation_Sequences.md).

|  |  |
| --- | --- |
| IMPORTNT.gif | You must consider all possible conditions or the workflow may not complete the intended business process. |

5. If this is the step
   on which you want to start the workflow, select the Start
   Workflow Here check box.
6. If you want the system
   to evaluate this step periodically, select the Evaluate on Timer
   check box. The system evaluates the step based on the interval
   you set in [Preference
   Maintenance](VMPRFMNTfrmPreferenceMaintenance.md). For example, if you specified 15 in Preferences
   Maintenance, the system would evaluate the step every 15 minutes.

To set up the interval to use in Preferences
Maintenance:

1. Select Admin,
   Preferences Maintenance.
2. If the Preferences table does not
   contain a Workflow section and DetectMinutes entry, click Insert Row and specify the following settings:

Section Workflow

Entry DetectMinutes

Value Enter the
frequency in minutes with which the system should evaluate the work
flow step. You can specify a value between 1 and 60.

3. Click Save.

7. Clear the check box
   if you want to check to see what the step needs to be when the
   user saves the type of document governed by the workflow.
8. In the Notifications
   section, enter the following:

E-mail Address
- Click the E-mail Address button and select
the address of the person to whom you want to send an e-mail notification.
You can also enter an e-mail address using your keyboard.

E-mail Subject
- VISUAL populates the subject line of the notification e-mail with
the Workflow ID ($WrkID) and Step number ($WrkStep).

For example, Workflow
Notification 9030/ Step 3.

If you want to change the format of the
subject line, click in the E-mail Subject field and enter the information
you want to appear.

E-mail Body -
The body space of the notification e-mail is populated with the following
information:

Workflow Type ($WrkType)

Workflow Name ($WrkName)

Workflow ID ($WrkID)

Workflow Step ($WrkStep)

For example, Workflow
$WrkType / $WrkName / $WrkID is at step $WrkStep.

E-mail Attachments
- If you want to attach a document to your e-mail, click the Attachments button to open the Email Attachments
dialog box where you can select a file.

|  |  |
| --- | --- |
| IMPORTNT.gif | The VE Programs Link and Documents buttons are reserved for future use. |

Execute Command
- If you want Workflow to open a program file (for example, an Excel
spreadsheet) when the notification takes place, click the Execute
Command button and select the action you want to take place
from the dialog box.

If you want Workflow to open a VISUAL executable
and sign in with the user's ID and password, enter the following:

${VE:program}

where program is the name of the executable
you would like to open. For example, if you would like to open Customer
Order Entry, enter the following:

${VE.VMORDENT.EXE}

9. You can use workflow
   rules to identify errors in a process. For example, if you require
   an expiration date on all quotes, you can set up a workflow rule
   that tests for the existence of an expiration date. See [Working
   with Rules](Working_with_Rules.md).

Use the VE Program Action area to specify
the actions that occur when the rule that is immediately before the
step is used to identify an error, and the error conditions have been
met.

Return error
Select this check box to indicate that an error has occurred. When
an error occurs, the user cannot save the document that triggered
the error.

Stop here if error
If you selected the Return error check
box, select the Stop here if error check box to stop the workflow.
Clear the Stop here if error check box to
continue the workflow.

Return message
If you selected the Return error check
box, select this check box to display a message in the error dialog.
Specify the text in the Message field. If you selected the Return
error check box, we recommend that you also select the Return message check box and specify text. If
you do not select the Return message check
box, then <null> is displayed in the error dialog.

10. If you want to attach
    any VISUAL documents to this step, click the Document
    Reference button and select the documents you want. For
    more information on document references, refer to [Referencing
    Documents](Referencing_Documents_Workflow.md).
11. Click Ok.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Workflow.md) User-defined Help