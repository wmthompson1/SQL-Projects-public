Adding Operations to a Quick Quote




# Adding Operations to a Quick Quote

To add an operation to the master:

1. Select Sales,
   Estimating Window.
2. Open the master in Quick
   Quote.
3. Click the Insert
   button under the first table.
4. Specify this information:

Op # An operation
number is inserted by default. You can override this value. The operation
number indicates the order of the operations.

Operation Type
Optionally, specify an operation type. If you set up operation types,
then most of the information in the operation table is inserted by
default. Set up operation types in Shop Resource Maintenance.

Resource ID
Specify the resource used for this operation.

Bid Rate Category
If a bid rate category is defined for this resource, then the category
ID is displayed. To specify a different bid rate, click the Bid Rate
Category browse button and select a different bid rate. Bid rate categories
are primarily used in conjunction with developing quotes outside of
VISUAL. You can use bid rate categories to establish costs based on
standards that you set up instead of based on the cost specified for
the resource in VISUAL.

Setup Hours
Specify the number of hours it takes to set up this resource for the
operation. This field does not apply to services.

Run Type Specify
how the run is measured. For internal resources, specify one of these
options:

HRS/PC The run
is measured as the number of hours required to make one unit.

PCS/HR The run
is measured as the number of units made per hour.

MIN/PC The run
is measured as the number of minutes required to make one unit.

PCS/MIN The run
is measured as the number of units made per minute.

HRS/LOAD The run
is measured as the number of hours required to make one load of parts.

LOADS/HR The run
is measured as the number of loads made per hour.

For services, specify one of these options:

DAYS/PC The run
is measured as the number of days required to make one unit.

PCS/DAY The run
is measured as the number of units made per day.

DAYS/LOAD The run
is measured as the number of days required to make one load of parts.

LOADS/DAY The run
is measured as the number of loads made per day.

Run Specify
the run quantity. This field is used in conjunction with the Run Type
field. For example, if you specified a run type of PCS/HR and you
specified 10 in the Run field, then this operation can produce 10
units per hour.

Load Size If
you specified HRS/LOAD, LOADS/HR, DAYS/LOAD, or LOADS/DAY as the run
type, specify the size of the load. This field is used in conjunction
with the Run and Run Type fields. For example, if you specified a
run of 2 and a run type of LOADS/HR, and you specify a load size of
10, then this operation can produce 20 units per hour. Or, if you
specified a run of 2 and a run type of HRS/LOAD, and you specify a
load size of 10, then this operation can produce 5 units per hour
(load size divided by number of hours).

Move Hrs Specify
the number of hours that must pass at the end of this operation before
the next operation can begin.

Service ID If
you specified a resource ID with the type Contractor, specify the
service ID.

Transit Days
Specify this information for services. Specify the total number of
days this service operation takes.

Drawing ID Specify
the ID of the drawing that depicts this operation.

Rev Specify
the revision level of the drawing ID.

Scrap or Yield
If this operation produces waste, specify the percentage. You can
specify this percentage as yield or as scrap. Yield is the percentage
of completed quantity produced. Scrap is the percentage of waste produced.

Scrap % Yield %
Specify the percentage scrap or yield produced in this operation.

Scrap Units
If this operation produces a fixed amount of scrap, specify the scrap
quantity.

Min Move Qty
Specify the minimum quantity that must be completed before the next
operation begins. If you specify a value in this field, operations
can be scheduled concurrently.

Setup Resource ID
Information is displayed in this field only if you selected an operation
type. You cannot specify information in this field. If a set up resource
is used concurrent with the resource specified in the Resource ID
field, then the ID of the set up resource is displayed. If multiple
set up resources are used, then Multiple is displayed in this field.

Run Resource ID
Information is displayed in this field only if you selected an operation
type. You cannot specify information in this field. If a run resource
is used concurrent with the resource specified in the Resource ID
field, then the ID of the run resource is displayed. If multiple run
resources are used, then Multiple is displayed in this field.

Setup cost per hour
Specify the hourly rate incurred to set up this resource. This field
is used in conjunction with the Setup Hrs field on the Setup/Run tab.
The value you specify in this field is multiplied by the value you
specify in the Setup Hrs field to calculate the base cost for set
up.

Setup burden %
To calculate burden costs for set up as a percentage of the total
set up cost, specify a value in this field. To calculate burden costs
for setup, this formula is used:

(Setup Hrs X Setup cost per hr X Setup burden%)/100

Setup burden/hr
To calculate burden costs for set up based on an hourly rate, specify
a value in this field. To calculate burden costs for setup, the value
you specify in the Setup hrs field on the Setup/Run tab is multiplied
by the value you specify in this field.

Run cost per hour
To specify run costs based on an hourly rate, specify the rate in
this field. Specify the cost incurred per hour of the production run.

Run cost per unit
To specify run costs based on a per unit rate, specify the rate
in this field. The value you specify in this field is charged for
each unit produced.

Run burden %
To calculate burden costs for the production run as a percentage of
the total production run cost, specify a value in this field.

Run burden/hr
To calculate burden costs for the production run based on an hourly
rate, specify a value in this field.

Run burden/unit
To calculate burden costs for the production run based on an a per
unit rate, specify a value in this field.

Fixed Burden
To specify a flat burden cost regardless of the quantity produced
in the production run, specify a value in this field.

Service base chg
Specify the base charge for this service. The base charge is a one-time
cost charged by the vendor for the use of the service.

Service min chg
Specify the minimum amount that the vendor charges for use of this
service.

Text Specify
specification text for this operation.

5. Click Save
   under the operations table.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Estimating_Window.htm) User-defined Help