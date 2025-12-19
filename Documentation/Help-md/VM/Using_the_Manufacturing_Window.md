Using the Manufacturing Window




# Using the Manufacturing Window

To use the Manufacturing Window to maintain engineering
information:

1. Select the appropriate
   line item from the Estimating Window line item table.
2. Click the Engineering
   button.

The Manufacturing window opens. If there
is an Engineering Master associated with the line item, it automatically
appears in the window.

Remember, if you use the Engineering option
to edit an engineering master for an inventory part, you are editing
the standard master for the part. Any changes you make here affect
all work orders subsequently created for this part.

If you are using a Quote Master, it automatically
appears in the window. If this is a new quote master, a single header
appears. If you are licensed to use multiple sites, specify the site
in which you are preparing the quote.

There are two ways you can proceed:

* Manually add
  new operations and material requirements.
* Use Copy From
  to copy an existing engineering master, quote master, or work
  order master. This is useful if there is an existing master that
  is similar to the quote master you wish to create.

You do not have to specify all information
in a quote master. However, the following information is essential
to computing an accurate estimate of your costs:

* Operations

You should add all planned operations to
the quote master. For each operation, you should specify the following
information as accurately as possible:

Resource ID

Service ID (for a subcontractor resource)

Setup & Run Time
Information

Setup Hours

Run Time, Run Type, Load Size

Cost Information

Setup Cost/Hour, Run Cost/Hour, Run Cost/Unit,
Setup Burden/Hour, Run Burden/Hour, Run Burden/Unit, Setup Burden
Percent, Run Burden Percent, Fixed Burden.

When you enter a Resource ID, cost information
automatically appears from the defaults specified in Shop Resource
Maintenance for the Resource ID. You can override any of these fields
in the Operations dialog box.

Use the Operation Type capability of Shop
Resource Maintenance for quickly building quote masters. It allows
you to specify ALL of this information once and then given a reference
ID, which is the Resource ID. This allows you to build a library of
standard operations that you can reference when building a quote master
(you can also use operation types in engineering masters and work
orders).

* Material Requirements

Add all planned material requirements to the
appropriate operations. For each, the following information should
be specified as accurately as possible:

Part ID

Quantity Information

Qty Per

Fixed Quantity

Scrap %

Dimensions (if appropriate)

Usage U/M (if appropriate)

Cost Information

Material Unit Cost

Fixed Cost

Labor Unit Cost

Burden Unit Cost

Service Unit Cost

Burden per Unit

Burden Percent

Vendor Information

Vendor ID

Vendor Part ID

If the requirement is for an inventory part,
you must specify a Part ID. All costs default from those specified
in Part Maintenance. VISUAL uses the preferred vendor specified in
Part Maintenance when looking up price breaks. If you wish to explicitly
specify a different vendor, use the Vendor ID field.

Infor VISUAL allows material requirements
for parts that do not have an item master in your parts table. This
is important when defining quote masters; because you are building
a quote master, you may be specifying parts that are special to the
order, and are not in your part table. To do this, leave the Part
ID blank. Enter a description in the Specification area. You must
fill in all cost information manually.

When defining a non-inventory material requirement
in a quote master, you may specify quantity breaks by using the Quantity
Break Costs option located in the Quotes tab area of the Material
window. This uses the up-to-quantity method to assign not only unit
costs, but a fixed cost and minimum cost, as well. If vendor quotes
are available for the part, you can specify them here. The Estimating
Window uses the quantity break information when computing costs for
different lot sizes.

You may also specify the Vendor ID and Vendor
Part ID, if known.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Estimating_Window.md) User-defined Help