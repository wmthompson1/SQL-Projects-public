Initializing a Physical Inventory Count




# Initializing a Physical Inventory Count

Use the following procedure to start a physical count:

1. Select Initialize
   Physical Count from the File menu.

The Initialize Physical Count dialog box
appears.

2. If you are licensed
   to use multiple sites, click the Site ID arrow and select the
   site to use. If you are licensed to use a single site, this field
   is unavailable.
3. Enter a Count ID and
   Description.

Each physical count is keyed by a Count
ID. Although you can only have one count in progress, you can choose
to save the results of a count, so there may be any number of existing
Count IDs. You must enter a unique one. You may want to incorporate
the date and warehouse name into the Count ID to assure it is unique.

For each count, you can also enter a description
that appears during the count and is printed on reports.

4. Select the warehouse
   from the drop down menu.

Physical inventory counts are performed
by warehouse. You must enter the Warehouse ID for the one you are
counting, or select it from the drop down menu.

5. Enter the number of
   tags you want in each grouping in the Tags per Group field.

Tags are used to record inventory counts,
to mark actual stock to show that it has been counted, and to indicate
the count for auditors.

VISUAL creates one tag for each Part ID/Location
ID in the warehouse. If a part has 3 defined locations, VISUAL creates
a tag for each location. You can also create blank tags.

The Tags per Group field allows you to break
the printing of tags into separate groups. This allows you to distribute
tags to different counters, and generally makes it easier to manage
large numbers of tags. Each group prints on its own set of pages,
with an identifying group number.

For example, if there are 250 tags and you
specify 100 tags per group, Group 001 contains 100 tags, Group 002
contains 100, and Group 003 contains the remaining 50 tags.

6. Enter Starting and Ending
   Tag Numbers.

Each tag is identified by a seven-digit
number, with leading zeros shown. This number uniquely identifies
the tag, and is not the same as the Part ID or location.

Starting Tag Number defaults to 0000001.
You can enter the ending tag number as well. If you enter an ending
number that does not allow enough tags to be created, it is automatically
increased. If you enter an ending number that produces more tags than
are needed, the extra numbers are printed as blank tags.

This feature is most useful when creating
blank tags only (see "Using Blank Tags" below). When creating
regular tags, you can just set the ending number to the starting number,
and enough tags are automatically created.

You can also specify a number of extra blank
tags to be printed. This provides extra tags to cover misplaced ones,
or items that may not be currently entered into the inventory system.

7. If you are performing
   a cycle count, enter this information in the Cycle Counting section:

Enable Cycle Counting
To perform a cycle count, select the Enable Cycle Counting check
box.

Product Code
To perform cycle count on parts with a specific product code, click
the arrow and select the code to use.

Commodity Code
To perform cycle count on parts with a specific commodity code,
click the arrow and select the code to use.

ABC Code To
count parts based on an ABC Code, specify the code to count in the
ABC Code field.

Number of Parts To Count
To count a specific number of parts of each ABC Code, specify the
quantity of parts in the Number of Parts To Count field.

Percent of A, B,
and C Parts To count specific quantities of ABC Code parts,
specify the percentage of each ABC Code to count. The percentage must
total 100.

See these topics for information about cycle
counting:

8. For information
   about how parts are evaluated for including in a cycle count,
   see [Physical Inventory
   Cycle Counts](Physical_Inventory_Cycle_Counts.htm).
9. To specify
   the parts and warehouses that use cycle counting, see [Cycle
   Count Setup](Cycle_Counts.htm).
10. To identify
    A, B, and C parts, see [Using
    ABC Analysis](Using_ABC_Analysis.htm).
11. Select Lock each location
    and Lock all part inventory to prevent transactions from occurring
    against the parts currently under evaluation in physical inventory.
12. Select Create tags in
    Location/Part order if you dont want VISUAL to run a cycle count.

VISUAL now runs the inventory count for
a specific group rather than all parts. Notice that Extra blank tags
per part becomes inactive when you select Create tags in Location/Part
order.

10. Specify the Adjustment
    Account.

During the End Physical Count phase, you
have the option of adjusting inventory levels based on the counts.
This ultimately results in general ledger entries when you process
the Part Adjustment Journal in the Costing Utilities. Normally, the
Adjustments to Inventory default account is debited or credited based
on any overages or underage. If you want to specify an override asset
account, enter its Account ID here.

11. If you use User Dimensions,
    specify the dimension IDs to use when the physical count does
    not match the quantity recorded in VISUAL. Use the Deficit area
    to specify dimension IDs to use when the physical count is less
    than the quantity recorded. Use the Overstock area to specify
    dimension IDs to use when the physical count exceeds the quantity
    recorded.

When you enter counts, the dimension codes
you specified during initialization are inserted after you specify
a quantity. You can override the codes.

If you generate inventory adjustments when
you close the physical count, the dimension IDs you specified are
used for the inventory adjust in and adjust out transactions. The
Deficit IDs are used for the adjust in transactions. The Overstock
IDs are used for the adjust out transactions.

11. Click Ok
    to initialize the count.

VISUAL creates a database entry for each
tag at this point. This may take a few minutes, depending on the number
of parts and locations, and the speed of your system.

Depending upon the layout of your warehouse,
and the location numbering scheme, you may determine one of the following
options to be easier than the other:

1. Writing in Location ID
   and Part ID for each tag, and typing it in during the Enter Count
   phase.
2. If option B is preferable
   to you, then check the Create Blank Tags Only check box. VISUAL
   prints the specified numbering and grouping of blank tags. You
   then print tags and enter the Part ID, Location ID, and quantity
   as you perform the count.

If you prefer option A, leave the Create
Blank Tags Only check box unchecked. VISUAL then prints tags with
Part ID and Location ID. You can still use blank tags as you need
them.

You can create blank tags also, if you select
the option in the dialog box. There are other options to check whether
to lock each location and all part inventory.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Physical_Inventory_Count.htm) User-defined Help