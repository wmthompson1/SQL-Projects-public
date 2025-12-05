Specifying Log File Settings for the Concurrent Scheduler




# Specifying Log File Settings for the Concurrent Scheduler

Use the Log Settings tab to select the information to write to log files
during the scheduling process. Log files are stored in the same directory
as the VISUAL executables. After you run the scheduler, the log files
are generated when you close the Concurrent Scheduler window.

1. Select Scheduling,
   Global Scheduler.
2. Perform one of these steps:
3. To specify tenant-level
   preferences, do not select a schedule. Select Options,
   Preferences.... In the Title bar, Preferences
   - \*\*Tenant\*\* is displayed.
4. To specify site-level
   preferences, select a schedule for the site. Select Options,
   Preferences.... In the Title bar, Preferences - plus the name
   of the site you selected is displayed.
5. To specify schedule-level
   preferences, select the schedule. Select Options,
   Schedule Preferences.... In the Title bar,
   Preferences - plus the ID of the site and the schedule are displayed.

3. To log information, select
   check boxes. This table shows the check boxes that you can select,
   the log file that is generated when you select the check box, and
   a description of the log file:

| Check box | Log file | Description |
| Standard Logging | vmglbsch.log | Shows details of the scheduling process, including the duration of each step in the process, the number of schedules that were processed, and the number of operations and work orders that were scheduled. |
| Schedule Configuration | vmglbcfg.log | Shows the configuration settings that were used during scheduling. |
| Part Netting | mnetting.log | Shows netting information for each part/warehouse combination. The netting information includes the available quantity, quantity allocated to demand orders, expected supply, and expected supply that has been committed to demand orders. |
| Database Statistics | SqlStats.log | Shows the SQL statements that were executed during the scheduling process. |
| Debug Traces | SchTrace.log | Shows the number of forward and backward passes that were made to schedule each work order. |