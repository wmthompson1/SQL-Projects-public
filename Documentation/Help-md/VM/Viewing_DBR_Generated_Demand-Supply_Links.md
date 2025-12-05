Viewing DBR Generated Demand-Supply Links




# Viewing DBR Generated Demand-Supply Links

When you run the DBR scheduler, the scheduler creates demand and
supply links between your supply orders and your demand orders. Customer
orders are included in demand, provided that you have not selected
the Suppress C/O allocation links creation check box when you ran
the scheduler.

To view the links that the DBR scheduler created:

1. In the DBR Scheduler
   window, select the schedule to use.
2. Select File,
   Show DBR Created Links.
3. By default, all DBR
   created links are displayed in the table. To view links for a
   particular part, specify the ID in the Part ID field.
4. Specify how to sort
   the work orders in the table. Click one of these options:

DSL ID 
Click this option to sort the table by Supply Seq No. This is the
order in which the DBR scheduler built the links.

Demand ID Click
this option to sort the table by demand ID.

Supply ID Click
this option to sort the table by supply ID.

Part ID Click
this option to sort the table by part ID.

5. To change a DBR-created
   link to a user created link, select the line and click the Make User button. To undo this action, select
   the line and click Unmake User.
6. Click the Save
   button. Any links that you converted to user links are removed
   from the table.