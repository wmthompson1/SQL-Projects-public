Setting Up Buffers for the CCR




# Setting Up Buffers for the CCR

After
you have decided which resources to declare as CCRs, you must set
up appropriate buffers. When you are making decisions regarding appropriate
buffer sizes, you must consider the following:

* The placement of the CCR
  within your manufacturing routing: is the CCR at the beginning,
  middle, or end of our production process.
* Make your buffers generous
  in size (compared to the time to do the work) so that you can
  protect your delivery dates from unforeseen events and your CCR
  from starvation. However, you should not make buffer sizes so
  large that your delivery dates are delayed. The buffer sizes dictate
  the lead times you quote to your customers and the amount of work-in-process
  you have.

To set up buffers for your resources:

1. Select Scheduling,
   DBR Maintenance.
2. If you are licensed
   to use multiple sites, click the Site ID arrow
   and select the site to use. If you are licensed to use a single
   site, this field is unavailable.
3. Click the Insert
   toolbar button.
4. Specify this information:

CCR ID 
Double-click the CCR ID button, and
select the resource that is the CCR.

Rank  Specify
the rank of this CCR. If you have multiple CCRs, the DBR scheduler
processes the CCRs in order of rank, starting with the lowest ranked
CCR. For example, a CCR with a rank of 1 would be processed before
a CCR with a rank of 2.

Active 
If this resource is an active CCR, select this check box. If this
resource is not currently the CCR, clear the check box. If you clear
the check box, you cannot create a schedule for the resource.

Is a Group If
the selected resource is a resource group, this check box is selected.

Shipping Buffer  Specify the default shipping buffer
in hours for this CCR. The shipping buffer is the amount of time it
takes to complete a work order after the materials pass through the
CCR. The consumption of the shipping buffer begins after the CCR operation
is complete and ends when the work order header is closed. The shipping
buffer is used to protect your delivery date.

CCR Buffer Specify the default CCR buffer in hours.
The CCR buffer is the amount of time it takes to complete all operations
preceding the CCR in a work order. This is the amount of time between
the issue of materials to the work order and the start of the CCR
operation. Enter the number of hours you want to use for a CCR buffer
for orders that pass through this resource. The CCR buffer help to
ensure that the CCR is used at full capacity.

Assembly Buffer  Specify the default assembly buffer
in hours. The assembly buffer is used when parts that have passed
through the CCR are combined with parts that have not passed through
the CCR. The assembly buffer is the amount of time between the issue
of raw materials to the point where CCR parts are combined with non-CCR
parts. The assembly buffer is used in conjunction with the shipping
buffer to allow parts that do not use the CCR sufficient time to pass
through the work order.

Rod  Specify
the default rod value in hours. A rod is used when a CCR is used more
than once on a work order. parts move through a CCR more than once.
The rod is the minimum amount of time that passes between the CCR
operations.

Shipping buffer % check 
Specify how much of the shipping buffer to use when checking the validity
of the production schedule. When you build a production schedule,
this is the percentage of the shipping buffer that should remain after
the CCR operation is complete. If less than the percentage you specify
is remaining, then the work order may not be completed on time.

Emergency Zone % 
Specify the percentage that represents the top of the red zone. Specify
this value as a percentage of the total buffer consumed. For example,
if your shipping buffer is 40, and your red zone is 0 to 8 hours,
specify 80 in this field.

Yellow Zone 
Specify the percentage that represents the top of the yellow zone.
Specify this value as a percentage of the total buffer consumed. For
example, if your shipping buffer is 40, and the top of your yellow
zone is 24 hours, then specify 40 in this field.

Emerg. Stock % 
This serves as a default emergency stock percentage for parts for
which you do not enter a part specific Emergency Stock %.

MTS CCR Buffer
Specify the default CCR buffer for made-to-stock orders.

Collect Data for Intrusions
Specify which zone intrusions to track. Select one of these options:

A Select this option
to track intrusions into all zones.

Y Select this option
to track intrusions into the yellow and red zones.

E Select this option
to track intrusions into the red zone only.

5. Click the Save
   button.