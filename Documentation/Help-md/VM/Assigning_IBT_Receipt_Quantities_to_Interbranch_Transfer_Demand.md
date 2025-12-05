Assigning IBT Receipt Quantities to Interbranch Transfer Demand




# Assigning IBT Receipt Quantities to Interbranch Transfer Demand

1. If it is not already
   open, select Interbranch Transfer Receipts
   Entry from the Infor VISUAL Tools menu. The Interbranch
   Transfer Receipts window appears.
2. Click the IBT
   ID button to select the IBT you want to receive.
3. In the Receive Quantity
   column, enter what portion of the total IBT Order Quantity you
   want to receive. By default, the entire Order Quantity appears
   in this column. See "Receiving Interbranch Transfer Entries"
   for more information.

Besides being the receipt quantity, this
quantity is now what is available to you to assign to demand.

4. From the Edit menu,
   select Assign Receipt Quantity to Demand Links.
   The Assign to Demand dialog box appears.

The following fields
appear in the header section:

Order Quantity
- The order quantity of the current IBT.

Total Received Quantity
- The quantity of the current IBT that you have received into inventory.
Unless this IBT has remained open due to a prior receipt of partial
quantities, this value should be zero.

Allocated Quantity
- The quantity of supply that you allocated to the IBT during the
creation of the IBT from a source of supply using the Assign
Supply to IBT Line option in the IBT Entry window. For example,
if you allocated full supply to this IBT from a purchase order, this
value is equal to the IBT Order Quantity.

Fulfilled Quantity
- The portion of the quantity that you have allocated to demand successfully
used in order fulfillment.

Fulfill Overage Quantity
- The quantity, if the receive quantity that you assigned to a link
results in the link received quantity being greater than the link
allocated quantity.

Demand Overage Quantity
- The quantity, if the receive quantity that you assign to a link
plus the link issued quantity exceeds the link allocated quantity.

Receive Quantity
- The quantity of the IBT line that you are receiving. The quantity
you entered in Step 3 appears here.

Remaining Quantity to
Assign - The portion of the received quantity that you can
allocate to demand. When this value equals zero, you cannot use this
IBT to make any further allocations to demand without editing the
original Receipt Quantity.

5. Click the Insert
   button to begin adding demand link information.
6. From the Type
   list box, select WH.
7. Double-click <Demand
   Base ID> or <Seq #/Line #>
   to search for interbranch transfers with the same Part ID as the
   current IBT receipt line.
8. Configure a search using
   the options in the header section and then click the Apply
   button.

Depending on how you configured you search
and if any interbranch transfers currently exist for the part, the
appropriate lines appear.

9. Select the line to which
   you want to establish a demand link and click the Ok
   button.

The selected interbranch transfer line information
appears in the Assign to Demand dialog box line item table.

10. In the Assign
    Quantity column, enter what portion of the IBT receipt
    line's Remaining Quantity to Assign
    you want to allocate to this interbranch transfer.

This quantity cannot be greater than the
Remaining Quantity to Assign of the IBT
receipt quantity or the Unallocated Requirement
Quantity of the interbranch transfer line.

11. Click the Ok
    button to commit the allocation of supply from the IBT receipt
    quantity to the interbranch transfer line.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Interbranch_Transfer_Receipt_Entry.htm) User-defined Help