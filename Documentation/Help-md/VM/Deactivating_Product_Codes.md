Deactivating Product Codes




# Deactivating Product Codes

If you no longer use a product code, you can deactivate
it. When a product code is deactivated, users cannot specify it on
any new records or transactions. Inactive product codes are not displayed
in product code drop-down lists or browse tables, and users cannot
manually specify an inactive product code in a Product Code field.
Inactive product codes used on existing records are not removed.

You can still select an inactive product code in reports that can
be filtered by product code.

It is possible to create a new transaction, such as a work order,
sales order, or purchase order, with an inactive product code. For
example, if you create a new work order from an engineering master
that has an inactive product code, then the new work order will also
have the inactive product code. When you deactivate a product code,
you should review where the product code is used to ensure that you
do not inadvertently continue to use the code.

To deactivate a product code, the code must meet these criteria:

* The product code cannot
  be used on an active part. An active part is a part that has not
  been designated Obsolete.
* The product code cannot
  be used on a service charge.

1. If you are licensed
   to use multiple sites, click the Site ID
   arrow and select \*\*Tenant\*\*. If you
   are licensed to use a single site, this field is unavailable.
2. Select Maintain,
   Product Codes.
3. Clear the Active
   check box.
4. Click Save.