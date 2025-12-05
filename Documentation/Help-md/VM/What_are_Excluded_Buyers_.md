What are Excluded Buyers?




# What are Excluded Buyers?

To prevent certain buyers from being used on purchasing documents
for certain vendors, use the Excluded Buyers dialog box. For example,
if you would like to prevent the buyer JED from being specified in
the Buyer ID field on a purchase order from the vendor BOSSEL, you
use the Excluded Buyers dialog box to set up the limitation.

When you add a buyer to the excluded buyers list for a vendor, the
buyer cannot be specified in the Buyer ID field on any of these documents
for the vendor:

* Purchase Requisitions
* Purchase Orders, including
  purchase order placed through the Material Planning Window and
  Manufacturing Window
* Vendor RFQs

In addition, an excluded buyer should not be used as the default
Buyer ID in Vendor Maintenance.

When you set up the excluded buyer list, the buyers you specify
are prohibited from being specified on vendor documents in all sites.

You can specify an additional level of buyer security on a site-by-site
basis. Use the Vendor Exclusion Mode section on the Defaults tab in
Site Maintenance to choose the level of security. You can select these
options:

Exclude buyers from vendors If this
option is clicked, then excluded buyers can create purchasing documents
for their excluded vendors only if the excluded buyers specify an
eligible buyer in the Buyer ID field.

Exclude buyers and users from using excluded
vendors If this option is clicked, then excluded buyers cannot
use the excluded vendors on any document, even if they do not specify
themselves in the Buyer ID field. Excluded buyers can edit certain
information in the purchasing documents. If the Read only mode for
excluded vendor documents check box is selected, then excluded buyers
can only view purchasing documents for their excluded vendors. They
cannot edit them.