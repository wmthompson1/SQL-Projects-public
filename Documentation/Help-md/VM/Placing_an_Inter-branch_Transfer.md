Placing an Inter-branch Transfer




# Placing an Inter-branch Transfer

You can use inter-branch transfers to meet demand. For example,
if one of your warehouses has supply of a part that another warehouse
needs to meet work order demand, you can transfer it.

If you are licensed to use multiple sites, you can transfer materials
between warehouses in different sites provided that both sites belong
to the same accounting entity. If you are licensed to use a single
site, you can transfer materials between any two warehouses.

Before you can transfer materials to a job or to inventory, you
must set up these locations in the warehouses participating in the
transfer:

* In the warehouse from which
  you are shipping the materials, you must create a location that
  has the same ID as the warehouse ID. For example, warehouse MMC-MAIN,
  must have a location MMC-MAIN.
* In the warehouse receiving
  the materials, you must have a transit location.

To place a transfer:

1. To transfer materials
   specifically for one or more jobs, select the lines containing
   the demand work order operations for the jobs and select Edit, Transfer to Jobs.

To transfer materials to inventory, select
Edit, Transfer to Inventory.

If you selected demand lines before accessing
the dialog box, the demand lines are displayed in the table.

The total Required Quantity for any work
order operations you selected is displayed in the Reqd Qty field.

If you have allocated supply to the work
order, the Net Qty Required value in the line item table at the top
is different than the one shown in the Material Planning line item
table. The Required Qty is the original material required value from
the work order minus the quantity of the linked allocations.

In the table, the quantity you have allocated
to the work order material requirement is shown in the Allocated Qty
column.

2. Specify this information:

Addl Quantity
To order a quantity in addition to the required quantity, specify
the quantity in the Addl Qty field.

If you change the Order Quantity, VISUAL
automatically adjusts the Additional Quantity. If you are linking
this IBT to jobs, the Order Quantity cannot be less than the Required
Quantity for the jobs you selected.

IBT ID To specify
your own IBT ID, specify the ID in the IBT ID field. Leave the field
blank to use the auto-numbering scheme set up in Inter Branch Transfer
Entry to generate an ID.

From Whse ID
Click the browse button and select the warehouse is transferring supply
to the order. If you are licensed to use multiple sites, the browse
table shows only those warehouses that belong to the same entity as
the To Whse ID.

To Whse ID The
warehouse ID specified on the demand line in the Material Planning
Window is inserted.

Desired Ship Date
Specify the date that the warehouse in the From Whse ID field should
ship the parts.

Desired Recv Date
Specify the date that the warehouse in the To Whse ID field should
receive the parts. The current date is inserted by default.

Transit Days
Specify the number of days it takes for the shipment to travel from
the warehouse in the From Whse ID field to the warehouse in the To
Whse ID field.

Status Specify
the status of the new transfer. You can click Firm or Release.

3. Specify requirement
   linking.

If you are transferring to jobs, you can
link the transfer directly to the work order requirements. This earmarks
the transfer for the job, and enables automatic issuing of the material
when it is received.

If you selected Transfer to Jobs, the Link
to Each Requirement box is checked by default. If you do not want
to link transfers to jobs, clear this box.

If you are unsure of which jobs may already
have linked IBTs, you can select each work order requirement from
the table. Any existing linked IBTs for this requirement is shown
in the table at the bottom of the dialog box.

Additionally, the Total Quantity Required
and Total Quantity Issued for the requirement is displayed. This allows
you to assess what quantities have already been transferred to the
job, and which are still needed.

If you selected Transfer to Inventory, the
Link to Each Requirement option does not apply.

4. To place the transfer,
   click Order.

The new IBT is created. The IBT has a separate
line item for each work order requirement and an extra line for any
additional quantity. If transferring to inventory, the IBT contains
a single line item for the total Order Quantity.

You can view and modify the new IBT by selecting
the line with the IBT and selecting Info, Display Supply Order.