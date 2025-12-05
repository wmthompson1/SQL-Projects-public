Manufacturing Window Concepts




# Manufacturing Window Concepts

<!-- Short Navigation TOC: insert for quick navigation -->
## Short Navigation TOC

- [Manufacturing Window — overview](#manufacturing-window)
  - [Understanding the Manufacturing Window Display](#understanding-the-manufacturing-window-display) — `Manufacturing_Window_Viewing_Options.md`
    - [Selecting Views](Documentation/Help-md/VM/Manufacturing_Window_Viewing_Options.md#selecting-views)
    - [Graphical View → Graphical Options](Documentation/Help-md/VM/Manufacturing_Window_Viewing_Options.md#selecting-graphical-view)
    - [Text View / Two-window Views](Documentation/Help-md/VM/Manufacturing_Window_Viewing_Options.md#selecting-text-view)
    - [Selecting Objects / Size & Color Preferences](Documentation/Help-md/VM/Manufacturing_Window_Viewing_Options.md#selecting-objects)
      - [Graphical view card layout and navigation](Documentation/Help-md/VM/Manufacturing_Window_Viewing_Options.md#selecting-graphical-view)
      - [Two-window material panel behavior](Documentation/Help-md/VM/Manufacturing_Window_Viewing_Options.md#selecting-two-window-views)
  - [Manufacturing Window Concepts](#manufacturing-window-concepts) — `Manufacturing_Window_Concepts.md`
    - [Engineering Masters](Documentation/Help-md/VM/Manufacturing_Window_Concepts.md#engineering-masters)
    - [Quote Masters](Documentation/Help-md/VM/Manufacturing_Window_Concepts.md#quote-masters)
    - [Work Orders](Documentation/Help-md/VM/Manufacturing_Window_Concepts.md#work-orders)
  - [The Master / Work Order & Starting the Window](Documentation/Help-md/VM/Starting_the_Manufacturing_Window.md)
  - [Operations](Documentation/Help-md/VM/Adding_Operations_to_a_Quick_Quote.md)
    - [Operation fields: Resource, Run Type, Setup/Run Time, Costs]
  - [Material Requirements](Documentation/Help-md/VM/Adding_Material_Requirements_to_an_Operation_in_Quick_Quote.md)
  - [Co-Products](Documentation/Help-md/VM/Allocating_Co-products_to_Demand.md)
  - [User-defined Help](Documentation/Help-md/VM/User_defined_Help_Files_Manufacturing_Window.md)

<!-- end TOC -->

The Manufacturing Window and the objects it maintains
are designed to achieve the following goals:

## Operations — Expanded (Level 4)

The Operations branch defines the discrete work steps in an engineering
master or work order. Key level-4 details and fields:

- **Resource Identification:** `Resource ID` (internal resource) and `Service ID` (subcontractor). Resource lookup pulls cost defaults from Shop Resource Maintenance.
- **Run Type & Measurement:** `Run Type` values (HRS/PC, PCS/HR, MIN/PC, PCS/MIN, HRS/LOAD, LOADS/HR, DAYS/PC, PCS/DAY, etc.) and how `Run` and `Load Size` interact to define throughput.
- **Setup & Run Time:** `Setup Hours`, `Run Time`, `Move Hrs`, and `Min Move Qty` that influence scheduling and concurrency.
- **Cost Structure:** `Setup cost/hour`, `Run cost/hour`, `Run cost/unit`, `Fixed Burden`, `Setup Burden/hr`, `Run Burden/unit`, `Burden %` — how these contribute to operation-level costing.
- **Scrap / Yield:** `Scrap %`, `Yield %`, and fixed `Scrap Units` handling for loss and effective quantity calculations.
- **Service/Transit Fields:** `Transit Days`, `Service base chg`, `Service min chg` for subcontracted operations.
- **Auxiliary Fields:** `Drawing ID`, `Rev`, `Text` (operation notes/specs), and `Setup Resource ID` / `Run Resource ID` when operation types supply defaults.

See also: [Adding Operations to a Quick Quote](Adding_Operations_to_a_Quick_Quote.md) and [Using the Manufacturing Window](Using_the_Manufacturing_Window.md).

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