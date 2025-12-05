Setting Up Free Work Order Buffers




# Setting Up Free Work Order Buffers

Use free work order buffers to establish the shipping buffer to
use for work orders that do not use the capacity constrained resource.
In Easy Lean operations, this is the only work order buffer you set
up. In DBR operations, you set up the free work order buffers in addition
to the CCR buffers.

Free work orders only use the shipping buffer. Other buffers are
not used.

You must set up the free work order buffer before you can run the
DBR scheduler.

To set up the free work order buffer:

1. Select Scheduling,
   DBR Maintenance.
2. In the Site
   ID field, specify the site whose free work order buffers
   you are setting up. This field is available only if you are licensed
   to use multiple sites. If you are licensed to use a single site,
   this field is unavailable.
3. In the upper table,
   specify this information for the free work order:

Shipping Buffer 
Specify the size of the shipping buffer in hours. For the free work
order, the shipping buffer is a generous estimate of the time between
the release of raw materials to the work order to order completion.

Shipping Buf % Check 
Specify how much of the shipping buffer to use when checking the validity
of the production schedule. When you build a production schedule,
this is the percentage of the shipping buffer that should remain after
the CCR operation is complete. If less than the percentage you specify
is remaining, then the work order may not be completed on time.

Emerg Zone 
Specify the percentage that represents the top of the red zone. Specify
this value as a percentage of the total buffer consumed. For example,
if your shipping buffer is 40, and your red zone is 0 to 8 hours,
specify 80 in this field.

Yellow Zone 
Specify the percentage that represents the top of the yellow zone.
Specify this value as a percentage of the total buffer consumed. For
example, if your shipping buffer is 40, and the top of your yellow
zone is 24 hours, then specify 40 in this field.

Emerg Stock % 
Specify the default emergency stock percentage for stocked parts.
You can override this value in Part Maintenance. The emergency stock
percentage is multiplied by the replenishment level to determine the
red zone for the part. If the quantity of the part falls into the
red zone, then you must expedite the purchase or manufacture of additional
parts.

Collect Data for Intrusions 
Specify which zone intrusions to track. You can review these intrusions
in Buffer Maintenance. Select one of these options:

A Select this option
to track intrusions into all zones.

Y Select this option
to track intrusions into the yellow and red zones.

E Select this option
to track intrusions into the red zone only.

4. Click the Save
   button.