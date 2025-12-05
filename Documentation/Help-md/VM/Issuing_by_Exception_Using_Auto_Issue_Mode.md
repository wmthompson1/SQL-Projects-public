Issuing by Exception Using Auto Issue Mode




# Issuing by Exception Using Auto Issue Mode

You can issue material requirement quantities from
warehouse locations to released work orders using auto issue mode.
Depending on the [Issue
Negative settings specified in Site Maintenance](Specifying_Information_on_the_General_Tab_site.htm), you can issue
materials even though the specified warehouse location might not contain
sufficient quantities. The ability to issue materials beyond the current
on hand level allows you to immediately issue materials that may
have just arrived to the appropriate work order. You can continue
production and formally enter the receipt and issue transactions later.

If the work order requires piece-tracked parts or traced parts,
then you cannot use Auto Issue mode. You can use the Work Order Materials
Issue table or the Inventory Transaction window to issue traced parts.
You must use the Inventory Transaction window to issue piece-tracked
parts.

1. Select Inventory,
   Inventory Transaction Entry.
2. If you are licensed
   to use multiple sites, click the Site ID arrow and select the
   site for the transaction. If you are licensed to use a single
   site, this field is unavailable.
3. Select Edit,
   Issue or Return by Exception.
4. Click the Work
   Order ID browse button and select the work order to which
   to issue materials.
5. If the work order has
   legs, you can issue material requirements to a particular leg.
   Click the Sub ID arrow and select the
   ID of the leg. To issue materials to all legs, select All.
6. To issue materials to
   a particular resource, click the Resource ID
   arrow and select the ID of the resource.
7. Click Issue
   All.
8. To review the transactions
   before performing them, select the Preview
   transactions before Saving check box. If you clear this
   check box, the transactions are saved when you click Ok.
9. Select one of these
   options:

Issue up to inventory
balance of part To issue materials up to the quantity on
hand, click this option. The warehouses used in the transaction depend
upon the information defined for the material requirement and on the
part master.

If a warehouse and location is defined on
the material requirement card, then that location is used first when
issuing materials to the requirement. If the warehouse location cannot
fully supply the requirement, then your other warehouses are examined
for inventory beginning with the first warehouse alphanumerically.

If no warehouse is defined on the material
requirement card, but the part has a primary warehouse and location,
then the primary warehouse location is used first when issuing materials
to the requirement. If the warehouse location cannot fully supply
the requirement, then your other warehouses are examined for inventory
beginning with the first warehouse alphanumerically.

If warehouse information is not defined
on the material requirement card and the part has no primary warehouse
and location, then your warehouses are examined for inventory beginning
with the first warehouse alphanumerically.

When you click this option, you can issue
up to the quantity of part you have on hand. You cannot create negative
inventory transactions.

Ignore inventory balance
of part This option is available only if the Warehouse check
box is selected in the Issue Negative section of Site Maintenance.

To issue materials regardless of the quantity
on hand, click this option. Clicking this option could result in negative
inventory balances.

If a warehouse and location is defined on
the material requirement card, then that location is used first when
issuing materials to the requirement. If the warehouse location cannot
fully supply the requirement, then your other warehouses are examined
for inventory beginning with the first warehouse alphanumerically.

If no warehouse is defined on the material
requirement card, but the part has a primary warehouse and location,
then the primary warehouse location is used first when issuing materials
to the requirement. If the warehouse location cannot fully supply
the requirement, then your other warehouses are examined for inventory
beginning with the first warehouse alphanumerically.

If warehouse information is not defined
on the material requirement card and the part has no primary warehouse
and location, then your warehouses are examined for inventory beginning
with the first warehouse alphanumerically.

If you have insufficient quantities on hand,
then inventory in warehouse locations is driven negative. If a location
is specified on a material requirement, then that location is driven
negative. If a location is not specified on a material requirement,
then the primary location is driven negative. If a location is not
defined on the material requirement and no primary location has been
specified for the part, then the first alphanumeric location is driven
negative.

Prompt with inventory
locations To specify from which locations you are issuing
quantities, click this option. When you click Ok,
a dialog is displayed. The ID of the part you are issuing is displayed
in the dialog title bar. A list of the warehouse locations that store
the part are displayed. Specify the quantity to issue from each location,
then click Ok. If you are issuing more than one part ID, then the
dialog box is displayed again for the next part.

Issue up to primary location
quantity To issue up to the quantity of part stored in the
primary warehouse location, click this option.

Issue from primary location
- ignore quantity This option is available only if the Warehouse
check box is selected in the Issue Negative section of Site Maintenance.

To issue all required quantities from the
primary warehouse location, click this option. This may result in
a negative inventory balance in the primary location.

9. After clicking the appropriate
   option, click Ok.
10. If you selected the
    Preview transactions before Saving check
    box, a list of the quantities to be from each warehouse is displayed.
    Click Save to issue the quantities.
    Click Cancel if you do not want to issue
    the quantities.

If you cleared the Preview
transactions before Saving check box, then the inventory transactions
are generated when you click Ok.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Inventory_Transaction_Entry.htm) User-defined Help