Service Planning Window Table




# Service Planning Window Table

Depending on your table preferences the following
columns may be available:

* [Service
  Part ID](javascript:TextPopup(this))

  A unique identifier for the service part.
* [Date
  Required](javascript:TextPopup(this))

  Desired ship date for the customer order. Scheduled release
  date for the work order operation requiring the part, as determined
  in the production schedule by the Global Scheduler. If this
  work order has not been scheduled, this field will read Not
  Sched. Run the Global Scheduler, or use Schedule Current
  Work Order in the Manufacturing Window.
* [Total
  Qty Required](javascript:TextPopup(this))

  The total quantity received to date for this order.
* [Total
  Qty Dispatched](javascript:TextPopup(this))

  Specify the total quantity of the dispatched item. A numeric
  entry is required. The default is zero.
* Qty Completed
* Qty Required
* [Stat](javascript:TextPopup(this))

  Allows you to indicate the status of the service.
* [Open
  Vendor ID](javascript:TextPopup(this))

  This is the operation vendor number associated with the
  service.
* Peg to
* Qty Ordered
* Qty Received
* [Net
  Qty Due](javascript:TextPopup(this))

  Specify the net quantity due.
* [Net
  Qty Dispatched](javascript:TextPopup(this))

  Specify the net quantity dispatched.
* [Due
  Date](javascript:TextPopup(this))

  The date the order is due.
* [Rls
  Date](javascript:TextPopup(this))

  The date the order was released.
* [Due Vendor
  ID](javascript:void(0);)
* [Order
  ID](javascript:TextPopup(this))

  Each order must have an Order ID to identify it. You can
  enter this ID manually. However, if you have the Auto Numbering
  feature enabled, you need not enter a value here. Simply press
  the <TAB> key. The system will automatically use and
  display the next available Order ID.
* [Issue
  Late](javascript:TextPopup(this))

  If you issue a service late to a work order, the number
  of work days it is late appears.
* [Ord
  Late](javascript:TextPopup(this))

  If you order a service late to a work order, the number
  of work days it is late appears.
* [Rls
  Late](javascript:TextPopup(this))

  If you release a service late to a work order, the number
  of work days it is late appears.
* [Sugg
  Rls Late](javascript:TextPopup(this))

  If service is late, the date VISUAL calculates that you
  should release the order.
* [Ord
  Project Early](javascript:TextPopup(this))

  If you expect to complete an order early, the number of
  days you project it to be early appears.
* [Ord
  Proj Late](javascript:TextPopup(this))

  If you expect to complete an order late, the number of days
  you project it to be late appears.
* [Rls
  Near](javascript:TextPopup(this))

  The date you should release the order near.
* [Sugg
  Rls Near](javascript:TextPopup(this))

  The date VISUAL calculates that you should release the order
  near.
* [Exception](javascript:TextPopup(this))

  Specifies the dispatch state.
* [Suggested
  Release](javascript:TextPopup(this))

  The date VISUAL calculates that you should release the order.
* [Sched
  Start](javascript:TextPopup(this))

  This is the date on which the first operation of the work
  order would start. You may wish to focus on the difference
  between this date and the release date to get a feel for the
  days delay before work would be started.
* [Sched
  Finish](javascript:TextPopup(this))

  This is the date on which the work order is
  scheduled to finish. If youre checking against a specified
  Want Date, compare whether this date is on or before it. If
  not, the check shows that the date cant be met with the schedule
  as it stands. You may want to run the check against an Infinite
  schedule to see where the overload resources are.

  If youre checking to determine a lead time, you can subtract
  this date from the Release Date to get a lead time.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Outside_Service_Planning_Window.htm) User-defined Help