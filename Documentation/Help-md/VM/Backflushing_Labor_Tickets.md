Working with Backflushing




# Working with Backflushing

Backflushing is the process that automatically creates
labor tickets and material issue transactions.

To backflush labor transactions, set up auto-reporting resources.
When you use auto-reporting resources in work orders, labor that is
reported on subsequent operations causes the completion of prior operations
that use auto-reporting resources. For example, a work order has three
operations. Operation 10 and operation 20 use auto-reporting resources.
Operation 30 does not use an auto-reporting resource. If a quantity
of 2 is completed on operation 30, then a quantity of 2 is automatically
completed on operation 20 and operation 10. If operation 20 and operation
10 required setup, the setup is also complete.

Use Shop Resource Maintenance to set up auto-reporting resources.
Use Site Maintenance to set up these behaviors:

* Whether labor tickets are
  created for auto-reporting resources
* Whether receiving a work
  order triggers backflush
* Whether subordinate legs
  are backflushed

To backflush material requirement issues, set up auto-issue. Use
Part Maintenance to designate the parts that are auto-issued. Use
Part Maintenance or Warehouse Maintenance to set up auto-issue warehouse
locations. Use Site Maintenance to set up when auto-issues are made.

You can use labor auto-reporting and material auto-issue independently
of each other or together.

See these topics:

[Backflushing Limitations](Backflushing_Limitations.htm)

[Setting Up Labor Backflush](Setting_Up_Labor_Backflush.htm)

[Backflush Settings
and Behavior](Backflush_Settings_and_Behavior.htm)

[Understanding
How VISUAL Backflushes](Understanding_How_VISUAL_Backflushes.htm)

[Auto-issue Parts](Auto-issue_Parts.htm)

[Using
Labor Backflush with Auto-issue Parts](Using_Labor_Backflush_with_Auto-issue_Parts.htm)

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Labor_Ticket_Entry.htm) User-defined Help