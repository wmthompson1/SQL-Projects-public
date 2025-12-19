Working with Tasks




# Working with Tasks

The Task List Notification dialog box allows you to
identify a group of users responsible for approving the activity before
the workflow proceeds to the next step.

For each member of the Task List Notification, Workflow generates
a task notification in the VISUAL Task Maintenance window, Outlook,
or both. For more information, refer to the [Setting
Workflow Preferences](VMWRKFLOPrefsProp.md) section.

|  |  |
| --- | --- |
| IMPORTNT.gif | To use VISUAL Task Maintenance in a workflow, you must add a user to the Assign To field in Workflow Properties dialog box. |

To set up a task list:

1. In the Rule Properties
   dialog box, click the Tasks button.

The Task List Notification dialog box appears.

2. Click the Insert
   button.

The User/Group ID arrow appears.

3. Click the arrow and
   select a user or User Group.

   |  |  |
   | --- | --- |
   | IMPORTNT.gif | When you select a group, all members of that group appear on separate lines in the Task List Notification dialog box. |

4. For each user you want
   to allow sign off privileges, select the Signoff
   check box. You can select as many users as you want to have signoff
   privileges.

When you select the Signoff check box, VISUAL
creates a task for each user.

5. For the user you want
   to be leader, select the Leader check
   box.

   |  |  |
   | --- | --- |
   | IMPORTNT.gif | You can only have one leader within your user list: if you change the leader, VISUAL Workflow automatically clears the original leaders check box. |

6. In the Task Specification
   field, enter a description of the task you want this step to represent.

The description you enter in this field
also appears in the Specification column in Task Maintenance.

7. When you have finished
   adding users to this steps task list, click the Save
   button.

## Deleting Users from Task Lists

To remove users from a task list:

1. From the Rule dialog
   box, click the Approvals button.
2. Click the row header
   for the user you want to remove.

The row appears highlighted.

3. Click the Delete
   button.

VISUAL clears the name from the User Task
list.

4. Click the Save
   button.

## Workflow and Outlook Tasks

To receive workflow tasks from another user, you must grant that
user permission to write to your Outlook Tasks folder.

To grant permission:

1. In Microsoft Outlook,
   display Tasks.
2. Right-click the Tasks
   folder and select Properties.
3. Click the Permissions
   tab.
4. Click Add....
5. Specify the user who
   should have write-access to your Tasks folder.
6. In the Write section,
   select the Create Items and Edit
   Own check boxes. See the Outlook online help for information
   about other permission levels.
7. Click Ok.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Workflow.md) User-defined Help