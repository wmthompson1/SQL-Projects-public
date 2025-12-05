Excluded Buyers and Vendor Documents




# Excluded Buyers and Vendor Documents

These applications are affected by your excluded buyer settings:

## Vendor Maintenance

If you select a default buyer who is on the vendors excluded buyer
list, a warning message is displayed to inform you that the selected
buyer cannot make purchases from the vendor. To choose a different
buyer, click the Yes button and then select a different buyer. To
retain the excluded buyer on the vendor record, click No. The buyer
will not be able to make purchases from this vendor until you remove
the buyer from the vendors excluded buyer list, remove the effective
date for the buyer in the Excluded Buyers dialog box, or change the
effective date in the Excluded Buyers dialog box to a date in the
future.

Excluded buyers can edit vendor records regardless of the Vendor
Exclusion Mode setting in Site Maintenance.

## Purchase Order Entry and Purchase Management Window

If you selected the Exclude buyers from vendors option in Site Maintenance,
then these conditions apply to purchase orders:

* If a buyer is excluded from
  using a particular vendor, you cannot specify the excluded buyer
  in the Buyer ID field if the vendor is specified in the Vendor
  ID field.
* If you create a new purchase
  order by clearing the purchase order ID field and then clicking
  the Save button, the buyer ID in the original order is cleared
  and the ID of the user currently signed into the database is inserted.
  If the current user is prohibited from purchasing from the vendor,
  a message is displayed. You can either change the buyer ID to
  a buyer who is not excluded from the vendor, or change the vendor
  ID to a vendor who is not excluded from the buyer.
* If you use the Copy Purchase
  Order function to copy a purchase order with an excluded buyer,
  the buyer ID is replaced with the currently signed in user on
  the new purchase order. If the currently signed in user is an
  excluded buyer, then the user is prohibited from copying the purchase
  order.
* Excluded buyers can create
  purchase orders for an excluded vendor only if they specify an
  accepted buyer ID on the purchase order. Excluded buyers can edit
  purchase orders, including adding lines and changing statuses.
* When generating a purchase
  order from a purchase requisition, only purchase requisitions
  for the currently signed in user are displayed in the Requisition
  ID browse. For example, if the currently signed in user is AL,
  then only approved purchase requisitions with the buyer ID AL
   or no buyer ID specified are displayed. The user can manually
  enter a requisition ID if the buyer on the requisition is different
  from the user ID. If a requisition with an excluded buyer is selected,
  then the purchase order cannot be generated.
* When generating a purchase
  order from a vendor RFQ, only vendor RFQs for the currently signed
  in user are displayed in the Vendor RFQ ID browse. For example,
  if the currently signed in user is AL, then only vendor RFQs with
  the buyer ID AL are displayed. The user can manually enter a RFQ
  ID if the buyer on the RFQ is different from the user ID. If a
  RFQ with an excluded buyer is selected, then the purchase order
  cannot be generated.

If you selected Exclude users and buyers from using excluded vendors,
then these conditions apply:

* The buyer cannot create
  a purchase order for an excluded vendor. This includes creating
  a purchase order through using the copy function and through deleting
  the order ID and clicking save. Excluded buyers also cannot create
  purchase orders from a purchase requisition or a vendor RFQ.
* Excluded buyers can edit
  certain information in an existing purchase order for an excluded
  vendor. Excluded buyers cannot edit the buyer, cannot change the
  status to firmed or released, cannot add order lines, cannot edit
  order quantities, and cannot add a delivery schedule. If the status
  of the order is Firmed, then the excluded buyer can change the
  vendor ID. If the excluded buyer does change the vendor ID, the
  buyer cannot change the vendor ID back to the original vendor.
  The buyer must select an eligible vendor.

If the Read only mode for excluded vendor documents check box is
selected, then the excluded buyers can only view the information.
No edits are allowed.

## Purchase Requisition Entry

Excluded buyers cannot be specified in the Buyer ID of purchase
requisitions for vendors that the buyers are not allowed to use. Excluded
buyers and excluded users can create purchase requisitions for vendors
they are not allowed to use only if the users specify an allowed buyer
in the Buyer ID field.

## Vendor RFQ Entry

If you selected the Exclude buyers from vendors option in Site Maintenance,
then these conditions apply to vendor RFQs:

* If a buyer is excluded from
  using a particular vendor, you cannot specify the excluded buyer
  in the Buyer ID field if the vendor is specified in the Vendor
  ID field.
* Excluded buyers can create
  vendor RFQs for an excluded vendor only if they specify an accepted
  buyer ID on the purchase order. Excluded buyers can edit purchase
  orders, including adding lines and changing statuses.

All of the conditions that apply if you select the Exclude buyers
from using excluded vendors option also apply if you select the Exclude
buyers and users from using excluded vendors option in Site Maintenance.
If you selected Exclude users and buyers from using excluded vendors,
then these additional conditions apply:

* If a user is excluded from
  using a particular vendor, the excluded user cannot create a vendor
  RFQ for the vendor. This includes creating a vendor RFQ through
  using the copy function.
* If the Read only mode for
  vendor documents check box is selected, then the excluded user
  cannot edit a vendor RFQ for an excluded vendor.

## Material Planning Window

An excluded buyer cannot purchase materials from an excluded vendor.
The excluded buyer also cannot firm or release a planned order for
an excluded vendor.

## Manufacturing Window

An excluded buyer cannot purchase material requirements from an
excluded vendor.