Deactivating Commodity Codes




# Deactivating Commodity Codes

If you no longer use a commodity code, you can deactivate
it. When a commodity code is deactivated, users cannot specify it on any
new records or transactions. Inactive commodity codes are not displayed
in commodity code drop-down lists or browse tables, and users cannot manually
specify an inactive commodity code in a Commodity Code field. Inactive
commodity codes used on existing records are not removed.

You can still select an inactive commodity code in reports that can
be filtered by commodity code.

It is possible to create a new transaction, such as a work order, with
an inactive commodity code. For example, if you create a new work order
from an engineering master that has an inactive commodity code, then the
new work order will also have the inactive commodity code. When you deactivate
a commodity code, you should review where the commodity code is used to
ensure that you do not inadvertently continue to use the code.

To deactivate a commodity code, the code must meet these criteria:

* The commodity code cannot be
  used on an active part.
* The commodity code cannot be
  used on an active service charge.

1. If you are licensed to use
   multiple sites, click the Site ID arrow
   and select \*\*Tenant\*\*. If you are licensed
   to use a single site, this field is unavailable.
2. Select Maintain,
   Commodity Codes.
3. Clear the Active
   check box.
4. Click Save.