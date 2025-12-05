Approving Tasks




# Approving Tasks

To approve a task:

1. Select Eng/Mfg,
   Task Maintenance or Purchasing,
   Task Maintenance.
2. Change the status of
   the task to Approved.

For ECNs and purchase requisitions, the actions that happen next
depend on whether you are the last person in the group required to
approve a task, whether you generate all tasks simultaneously or generate
tasks in sequence, and whether your tasks is the last task in the
sequence:

* If you are not the last
  member of the group that needs to approve a task, then the completion
  meter for the task on the ECN or purchase requisition is updated.
* If you are the last member
  of the group that needs to approve a task, then the completion
  meter for the task on the ECN or purchase requisition is updated
  to 100%. If you cleared the Generate All Tasks Simultaneously
  check box, then the next task in the sequence is generated. For
  example, if you approve an Authorization task for an ECN, then
  the Implementation task is generated. If you selected the Generate
  All Tasks Simultaneously check box, then the next task becomes
  available for status changes. For ECNs, specify whether tasks
  are generated simultaneously in Site Maintenance. For purchase
  requisitions, specify whether tasks are generated simultaneously
  in Accounting Entity Maintenance.
* If you are the last member
  of the group that needs to approve a task, and the task is the
  last task that must be completed, then these actions occur:
* For purchase
  requisitions, the status of the requisition is changed to Approved.
* For ECNs,
  the status of the ECN is changed to Completed, provided that the
  site is not integrated to IQM. If the site is integrated to IQM,
  then you must select the External Tasks Complete check box to
  complete the ECN.

For workflow tasks, the actions that happen next depend on whether
you are the last person required to approve the task.

* If you are not the last
  person required to approve the task, then the Workflow Tracker
  is updated to indicate that you have completed the task.
* If you are the last person
  required to approve the task, then the Workflow Tracker is updated
  to indicate that you have completed the task, and the next step
  of the workflow begins.