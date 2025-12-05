Using Labor Backflush with Auto-issue Parts




# Using Labor Backflush with Auto-issue Parts

Keep these behaviors in mind when you use backflush
and auto-issue parts on the same work order:

* Materials are issued to
  requirements with auto-issue parts even if you do not generate
  labor tickets during backflush.
* Labor is backflushed based
  on the quantity that is specified in the transaction that generates
  the backflush. For example, if a user enters a labor ticket for
  a quantity of 2 on the last operation of a work order, a quantity
  of 2 is backflushed. Materials are auto-issued based on the Auto
  Issue Method that is specified in Site Maintenance.
* If you auto-generate labor
  during receipt transactions and close a customer order short,
  then the quantities of material requirement that are issued depend
  upon the Auto Issue Method that you use. If you use the Based
  on Full Remaining Req Qty on Run Complete method or the Based
  on full Requirement Qty on First Labor Ticket method, then the
  full quantity of material requirement is issued. If you use the
  Based on Operation Qty Complete method, then a prorated quantity
  is issued.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](Backflushing_Labor_Tickets.htm)
Working with Backflushing

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](Auto-issue_Parts.htm)
Auto-issue Parts