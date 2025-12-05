Manufacturing Window Concepts




# Manufacturing Window Concepts

The Manufacturing Window and the objects it maintains
are designed to achieve the following goals:

* Manufacture standard parts
  and custom products using the same flexible tool set. The Manufacturing
  Window provides a number of options for specifying fabrication
  masters for different levels that you can combine to meet your
  unique needs.
* Allow free modification
  of all aspects of a work order routing and bill of material as
  needed, even when it is for a standard part. You can modify VISUAL
  work orders locally without affecting the master, if one exists.
  VISUAL provides full security control for this feature.
* Allow the use of purchased
  parts that are special to an order without maintenance of a part
  master or assignment to a warehouse. You can specify one time
  material requirements for engineering masters or work orders,
  and purchase directly to the job.
* Support concurrent engineering
  and manufacturing. Work order release and status is by individual
  operation and material requirement, to maximize your ability to
  begin manufacturing on some components before engineering is complete
  for others.
* Allow "Just In Time"
  material planning, as well as other planning policies. VISUAL
  specifies material requirements at the operation where they are
  needed, rather than on a common bill of materials.
* To meet these goals, the
  Manufacturing Window maintains three types of objects, all very
  similar to one another:

## Engineering Masters

Engineering Masters define a process for use in the production of
a manufactured product. This includes the individual operations to
be performed, the materials they require, the effort required, and
the estimated cost of production.

Engineering masters are a combined bill of material and routing.
You develop engineering masters as the basis for work orders that
are released to build the parts in question. Each fabricated part
has a current engineering master, which you specify in Part Maintenance,
and a series of alternate engineering masters, which the system may
use when needed.

## Quote Masters

Quote Masters are identical to Engineering Masters, but are specifically
attached to quotation line items, and are primarily used to generate
estimated costs for quotations.

## Work Orders

Work orders define a manufacturing process that will actually occur,
or is occuring, to produce a given quantity of a product. Work orders
have all the features of masters, but also have additional attributes
to control and track the actual execution of a process. You can produce
work orders by copying an engineering master for a standard part,
by copying a quote master, or by creating a custom work order from
the ground up. The method you use depends on whether you are making
to stock, making to order, or engineering to order.

Work orders cause demand for shop resources that are planned by
the Global Scheduler. They also, along with customer orders, cause
demand for materials that are planned by the Material Planning Window.

The remainder of this section describes the structure of engineering
masters, quote masters, and work orders, and how they are used. The
structure of masters and work orders is covered from the top down,
moving from header information, to subassemblies, to individual operations
and material requirements.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Manufacturing_Window.htm) User-defined Help