User Group Maintenance




# Creating Approval Groups

You use approval groups in Purchase Requisition Entry, ECN Maintenance,
and Workflow. For Purchase Requisition Entry, you can specify up to
four approval groups to evaluate and approve requisitions. For ECN
Maintenance, you can set up authorization, implementation, approval,
and distribution teams. For Workflows, you can set up groups that
must approve steps in a workflow.

If you have more than one site, approval groups are defined by site.
When you select a site from the Site ID drop-down menu, the User ID
browse table is filtered by the site you select.

To create a group:

1. Select Security,
   Profile/User/Group Security.
2. In the Security by section,
   select Group. When you select the Group
   option, the system displays the Group tab and deactivates the
   other tabs.
3. In the Group ID field,
   specify a user ID. In the field to the right of the Profile ID
   field, specify a description of the group.
4. Click the Language
   ID arrow and select the language that the group uses.
5. If you are licensed
   to use multiple sites, click the Site ID
   arrow and select the site to use. If you are licensed to use a
   single site, this field is unavailable.
6. If the group is a requisition
   approval group, select the appropriate Approval
   check box. You can set up the names for the requisition approval
   groups in Application Global Maintenance. You can override the
   default and select a different team in Purchase Requisition Entry.
   You can select more than one Approval check box for the group.
7. If you would like to
   use the group as a default ECN team, select the appropriate check
   box. If you select one of these boxes, then the system inserts
   the team in ECN Maintenance. You can override the default and
   select a different team in ECN Maintenance. You can select more
   than one check box for the group.
8. If you would like to
   use the group as the default Workflow approval team, select the
   WorkFlow Default Group check box.
9. Select the Group
   Signoff check box if any one member of the group can sign
   off for the entire group. When you generate tasks for the group,
   each member of the group receives the task. When one member completes
   the task, the system marks the task for all group members complete.

If you select the Group Signoff check box,
only one member of the group has to complete the task assigned to
the group.  For example, say ECN123 is assigned to the ECN Implementation
Team, which is made up of User1, User2, User3, and User4. When you
select the Group Signoff checkbox, only one of the users in the group
needs to complete the task related to ECN123. When one user in the
group marks the task Complete, the system marks the task complete
for the other users.

Clear the check box if each member of the
group has to complete assigned tasks, or if you want to enable the
Sigoff function for only certain group members. When you clear the
check box, the system activates the User Signoff check box.

10. Add members to the group.
    Click the Insert Row button, then double-click
    the User ID browse button. Select a user from the browse table,
    then click Ok.

If you are licensed to use multiple sites,
only users assigned to the site in the Site ID field are shown in
the browse table.

11. Specify this information
    for the users:

Leader If the
user is a the groups leader, select the Leader check box. Each group
can have only one leader. The leader can view the team members tasks
in Tasks Maintenance.

User Signoff
If you have cleared the Group Signoff check box, the system activates
the User Signoff check box. When you select the User Signoff check
box for more than one user, one of the selected users can complete
the assigned task on behalf of the other selected users. For example,
say ECN123 is assigned to the ECN Implementation Team, which is made
up of User1, User2, User3, and User4. You have selected User Signoff
for User 1, User2, and User3. If User2 completes the task, the system
marks User1s and User3s task complete. User4s task, however, remains
open until User4 marks the task complete. The group does not complete
the task until User4 and one of User1, User2, and User3 marks the
task as complete.

12. Click Save.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User-defined_Help_Files_-_Security.md) User-defined Help