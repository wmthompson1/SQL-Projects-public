Material Requirements




# Material Requirements

Material Requirements define a need for a specified
amount of material at a certain work order operation.

Material requirements are always associated with an individual operation
of a master/work order. This allows "just-in-time" material
planning of required materials. The setup and run times for all preceding
operations define a lead-time for the material requirement. The material
needs to be available at a time specified by the work order release
date plus this implied lead-time.

Since one operation can have any number of material requirements,
VISUAL assigns a piece number to each requirement on the same operation.
Therefore, Infor VISUAL material requirement is fully specified by
the following pieces of information:

Base ID - Identifies the master or work
order.

Lot/Eng ID - Identifies the work order
lot, or revision of the master.

Split ID - Identifies sub-lot produced
by a lot split

Sub ID- Identifies the leg that the operation
is on (legs are discussed shortly)

Operation Seq. No. - Identifies the operation
the material is required on

Piece No. - Identifies the requirement
among the others for the same operation

VISUAL supports four types of material requirements:

Purchased Inventory Material - These are
parts that have standard part masters, which you specify in Part Maintenance,
and are obtained though Purchase Order Entry and received through
Purchase Receipt Entry. Specify this type of requirement by Part ID.

Purchased Non-Inventory Material - VISUAL
allows you to specify requirements for materials that do not have
part masters. This is particularly important in a job-shop environment,
where there are likely to be many onetime material purchases, and
is useful anytime you need to use a special material on a job. This
capability is also useful in the quotation process, when there may
be new materials involved that do not yet have part masters.

For inventory part requirements, much of the information VISUAL
needs is obtained from the part master maintained in Part Maintenance.
When a non-inventory material is required, VISUAL makes special provision
to obtain the necessary information. For example, standard costs are
normally obtained from the part master. Because no part master exists
for a non-inventory part, you can specify the costs directly in the
Manufacturing Window material requirement.

Fabricated Inventory Material - These
parts are also maintained in Part Maintenance, but they also have
an associated engineering master of their own. VISUAL treats material
requirements for purchased and fabricated parts in exactly the same
way. After they are received into inventory, through a purchase receipt
or finished goods receipt, they are both available for work orders.
Specify this type of requirement by Part ID.

Fabricated Sub-Assembly - From a material
requirement standpoint, these act like other requirements they are
associated with an operation, and a specified quantity is required
for that operation. However, rather than maintain a separate engineering
master and work order for the assembly, the operations and material
requirements for the subassembly are included in same structure as
primary operations. This allows these items to be engineered, scheduled,
and managed one unit, while maintaining definition of independent
subassemblies.<

The strings of subassembly operations are often called "legs."
In the graphical viewing mode of the Manufacturing Window, they appear
as offshoots of the operation where they are required. In text mode,
they appear indented beneath their parent operations. These legs have
their own header, referred to as a "leg/detail." Its function
is very similar to that of a standard material requirement.

The operations on a subassembly leg are identical to those on the
primary assembly, and can have material requirements of their own,
including other subassemblies. This means an indented structure can
be built to any level.

## Using Fabricated Parts vs. Legs

It is up to you to decide when to use a separate part for a fabricated
material requirement, and when to use a leg. To help you make this
decision, we provide some information on the benefits and drawbacks
of each.

### Advantages of Using Legs

When subassemblies are built in a one-to-one relationship with a
main assembly, using legs greatly simplifies the inventory management,
material planning, and scheduling processes. You do not have to schedule
independent work orders, nor are you required to manage the allocation
and issuing of the subassembly to the main one. All material requirements
at all levels appear as material requirements of the entire product.

Additionally, the Global Scheduler automatically schedules all levels
of subassemblies independently, but in such a way that a required
assembly is always ready for a parent operation.

Neither of these facts prevent you from managing production of the
subassembly independently of the main one. Indeed, the key benefit
to legs is the ability to unify inventory management and scheduling
while maximizing your ability to manufacture concurrently.

### Disadvantages of Using Legs

The parts produced by a leg are wholly owned by the parent work
order. There are no explicit inventory transactions performed for
the receipt of these parts as finished, and their subsequent issue
to the parent operation. Although they can be released, started, and
completed independently of the main work order, the material cannot
be managed independently.

This may present an issue in situations where you wish to swap subassemblies
between work orders, or "steal" the assembly from one work
order to finish another, later work order. When using legs, you would
have to perform significant manual adjustments to perform the transfer.

VISUAL allows you to use the Part ID of a fabricated part to refer
to the leg. This means you can indicate the construction of a leg
that is also a separate fabricated part in its own right. This allows
you to have stockable subassemblies that can be placed as separate
work orders. To do this, you have to maintain the
leg and the separate engineering master independently.

## Material Requirement Quantities

Determining the quantity of material that VISUAL actually has to
issue to fulfill a material requirement is not always as simple as
considering the quantity required and the desired quantity from the
work order. You must also consider multiple levels of fixed and variable
scrap and unit of measure changes. Enter the following information
to specify and determine the quantity of a material requirement:

Quantity Per - This is the number of pieces
or amount of material required for each unit of incoming material
on the operation. You can specify this in terms of the Start Quantity
for the operation, or the End Quantity. This choice depends upon whether
the scrap/yield events for the operation occur before or after the
new material is used.

Fixed Quantity - This is a one time quantity
of the required material that is used regardless of the work order
quantity. As with operation scrap, this could account for material
needed for setup or testing.

Scrap % - This is the variable scrap factor
for the required material, which you specify as a percentage of the
Quantity Per.

Usage UOM - You can specify a unit of
measure for use in the operation that is different from the materials
stocking unit of measure. In this case, you must specify a conversion
factor in the units database.

Dimensions - You can also specify a formula
to compute a quantity. This is useful where the actual quantity is
the result of multiple dimensions that produce a result. For example,
the area of sheet metal required might depend upon length and width
of a part. This is most useful when used in conjunction with work
order variables, which allow you to specify variable quantities that
are used throughout the work order in calculating required quantities.

It may be somewhat confusing that scrap factors are defined for
the operation and the material requirement. Keep in mind that the
material requirement scrap represents a loss of the "pure"
raw material as it is used in the operation, while operation scrap
represents a loss of the intermediate material in process. A specified
material scrap increases the amount of the material required for the
operation, while a specified operation scrap decreases the amount
of the material that flows to the next operation.

If you specify the Quantity Per in terms of the Start Quantity,
then the required quantity is calculated as follows:

Required Qty = Main Quantity + (Main Quantity x Scrap) + Fixed Quantity

or

Required Qty = [Operation Start/End Quantity x Quantity Per x (Dimensions)]
+ [(Operation Start/End Quantity x Quantity Per x (Dimensions)) x
Scrap %/100] + Fixed Quantity of Scrap

If the Quantity Per is specified in terms of End Quantity, the equation
is identical just replace Start Quantity with End Quantity.

Note that if you specify dimensions, they are multiplied by the
base Quantity Per. Often, when you use dimensions, you specify a Quantity
Per of one, and let the dimensions specify the actual quantity. As
an example, consider the fabrication of a solid door, that has work
order variables of LENGTH and WIDTH. A material requirement might
be for a certain square footage of sheet metal. You specify a Quantity
Per of 1, and dimensions of [LENGTH]\*[WIDTH] (length times width).
If you needed two such sheets, the Quantity Per would be 2. Or you
could keep Quantity Per as 1, and place the 2 (the actual Quantity
needed) within the dimensions field z [LENGTH]\*[WIDTH] .

If the usage unit of measure is different from the stock unit of
measure, it is then applied to this quantity to get the amount that
must be issued to the work order.

This final quantity required is sometimes referred to as the "calculated
quantity" or "calc qty." This is the amount that shows
up as demand in the Material Planning Window, and the amount that
must actually be issued to the work order to meet the requirement.
The calculated quantity is always in terms of the stock unit of measure.

As an alternative, consider the following step-by-step description
of arriving at the calculated quantity:

1. Figure out the Start
   Quantity for this operation, based on required quantity of next
   operation.
2. If the Quantity Per
   is based on End Quantity, apply operation scrap factors.
3. Multiply Quantity Per
   by the resulting quantity to get a base amount required.
4. Multiply that result
   by any dimensions specified.
5. Add quantity to make
   up for fixed and variable material scrap.
6. Apply unit of measure
   conversion to get to the stock unit of measure.

In summary, the actual quantity of material required to fulfill
a work order material requirement depends upon the fixed and variable
scrap of the current operation, and all subsequent operations as well.
It is important that you understand how each factor affects the determination
of calculated quantity.

## Standard Material Unit Costs

Costs for materials are estimated by multiplying calculated quantity
by the standard unit cost for the material. The following unit costs
apply:

### Unit Cost Description

Material Unit Cost - Purchased material
unit cost, or material component of fabricated material cost.

Fixed Cost - Onetime charge for material
acquisition, such as a vendor setup charge.

Labor Unit Cost - Labor component of fabricated
material requirement cost.

Burden Unit Cost - Burden component of
fabricated material requirement cost.

Service Unit Cost- Service component of
fabricated material requirement cost.

Burden per Unit - Burden associated with
material handling, per unit.

Burden Percent - Burden associated with
material handling, as percent of total material cost.

### Where Does VISUAL Get Costs and Burdens From?

For Standard Costing When you specify
the Part ID for a material requirement, VISUAL copies the standard
rates into the requirement from the part master. Although you can
override the rates at this point, VISUAL only uses them to provide
cost estimations for the material requirement. VISUAL always takes
standard costs from part masters.

For Actual Costing The material requirement
card issue burden values override the part card issue burden values
when setting the "actual burden for the work order issue transactions.
VISUAL always takes actual costs from PO/Invoice prices.

## Material Requirement Costs

Material requirements contribute to work order
costs in the following way:

Purchased Parts (Inventory or Non-Inventory)
- Purchased material contributes to work order cost in two categories
only: Material and Burden. Material costs are incurred for the fixed
and variable purchase price of the material. Burden cost is incurred
for the issue burden, if any, associated with the material. Do not
confuse this burden with the Burden cost of a fabricated material
requirement.

Fabricated Parts - The Costing Between
Levels switch in Application Global Maintenance determines how fabricated
requirements contribute to the parent work order cost. If you specify
Keep Separate Costs, the four cost categories of the required fabricated
part contribute to the four categories in the requiring work order.
If you specify Fold to Material Cost, all four cost categories of
the required fabricated part are rolled into the Material cost of
the requiring work order.

## Material Planning

Use the Material Planning Window to plan material supply to meet
expected demands. The following information you can specify for a
material requirement affects the material plan:

Operation Start Date - The Global Scheduler
determines the start date for the operation that requires the material.
The operations Start Date defines the date that the material must
be available to the operation.

Material Lead Time - Both fabricated and
purchased parts have a Lead Time specified in their part master, maintained
in Part Maintenance. VISUAL uses this in planning work orders and
purchase orders for required material. You must place work orders
and purchase orders this far in advance of the operation start date
in order to be available in time.

Note that VISUAL displays the lead time for a fabricated part in
its part master not by accumulating its setup and run times.

Calculated Quantity Required - As mentioned
above, this quantity specifies that actual amount of material that
needs to be acquired to meet the material requirement demand.

## Material Actuals

This section covers information associated with an actual material
requirement on a work order. The following additional information
is associated with such a requirement:

Status - Material requirements have their
own private status; they can be released or unreleased independently.
A requirement is automatically closed when VISUAL issues all required
material. The system maintains the close date of a requirement.

Required Date - The Required Date of the
material requirement is always equal to the scheduled start date for
the operation, as assigned by the Global Scheduler.

Issued Quantity - The current quantity
of material that has actually been issued to meet the requirement.
This also implies a Quantity Due the outstanding required quantity
not yet issued.

Inventory Issue Transactions - Inventory
Issue Transactions that issue and/or return material for the requirement
are permanently linked to the requirement and can be viewed if needed.

Linked Purchases - It is possible to link
a material purchase directly to the material requirement it will meet.
This simplifies the management of this type of order.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Manufacturing_Window.htm) User-defined Help