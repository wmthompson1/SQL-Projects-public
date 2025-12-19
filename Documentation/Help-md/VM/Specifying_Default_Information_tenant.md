Specifying Default Information




# Specifying Default Information

Use the Defaults tab to specify certain application-wide
information, including:

* Trace ID information
* How to use customer pricing
  in shipping entry
* Default Document Maintenance
  options
* Password requirements in
  Workflow
* PLM connection settings
* Where to store macros

To specify information on the Defaults tab:

1. Select Admin,
   Application Global Maintenance.
2. Click the Defaults
   tab.
3. If you use trace IDs
   in labor transactions and service receipts, select the Only
   Trace Qty from Preceding Operation check box to require
   users to enter trace IDs sequentially at every labor transaction
   or service receipt. Clear this check box if you do not want to
   force users to enter trace IDs sequentially.
4. Use the Customer Price
   Effectivity in Shipping section to specify how the customer-specific
   pricing information should be used when shipping an order to the
   customer. In Customer Maintenance, you specify pricing information
   for each part the customer buys in the part pricing table. When
   you specify the pricing information, you specify dates that the
   pricing is effective. Click one of these options to specify how
   to use the part pricing information:

Always Require Price
in Table If you require that a unit price be specified in
the customers part pricing table, click this option.

Use price on Order Line
if Price is Not in Table To use the price specified in the
customer order if no price exists in the customers part pricing table,
click this option.

Warn if Price is Not
in Table, Use Price on Order Line To display a warning if
no price exists in the customers part pricing table, click this option.
If you continue with the shipment, the price specified in the customer
order is used.

The setting you specify in Application Global
Maintenance is the default setting. You can override the setting for
individual parts in Part Maintenance.

5. In the Documents section,
   specify the default e-mail information to use in Document Maintenance:

Allow E-mailing Associated
Documents (default) Use this check box to specify the default
setting for the Allow E-mailing check box
in Document Maintenance. If you select the Allow
E-mailing Associated Documents (default) check box, the Allow
E-mailing check box in Document Maintenance is selected by default.
If you clear the Allow E-mailing Associated Documents (default) check
box, the Allow E-mailing check box in Document Maintenance is cleared
by default. You can override the default setting in Document Maintenance.

6. To require the use of
   passwords for secured fields when working with workflows, select
   the Passwords Required for Secured Fields
   check box.
7. In the Terms section,
   specify this information:

Default Terms
Select the terms to use as the default for new customer and vendor
records. The terms that you select are also used as the default terms
on transactions when another source of terms definitions, such as
a customer or vendor record, cannot be found. If you leave this field
blank, then Due on Receipt is used as the default terms.

You cannot specify terms with specific date
definitions or installments. These types of terms are not displayed
when you click the Terms browse button. See [Adding
Terms](Entering_Information_in_Terms_Maintenance.md).

Due on Receipt ID
If you have set up more than one terms ID as due on receipt, use
this field to specify the terms ID to use as the default Due on Receipt
ID. Terms are designated as due on receipt if these conditions are
met:

* The Discount
  type and Net type are Age of Invoice
* The Discount
  days and Net days are 0
* The Discount
  % is 0
* The freight
  terms are billed

When you click the browse button, only the
terms that meet the criteria for due on receipt are displayed.

The terms that you select are used on transactions
when default terms have not been defined on the customer or vendor
record and the Default Terms field in Application Global Maintenance
is blank.

If you leave this field blank, then the
first terms ID in the database that meets the criteria for due on
receipt is used as the default.

If you specify a default Due on Receipt
terms ID, it is used on all AP and AR memos. If you do not specify
a default Due on Receipt terms ID, then the first terms ID in the
database that meets the criteria for due on receipt is used.

8. If VISUAL is integrated
   to Infor PLM, you can directly access PLM from Part Maintenance.
   Use the PLM Integration section to specify default PLM access
   information for all sites in your database. You can override the
   information you specify in Application Global Maintenance for
   each of your sites in Site Maintenance. Specify this information:

Login URL Specify
the external launch URL for Web PLM.

Enable To allow
direct access to PLM for all sites by default, select this check box.
To prevent direct access to PLM for all sites by default, clear this
check box.

9. In the Macros section,
   specify how to store macros and where to read macros. Macros can
   be stored and read from the workstation or from the database.

To store macros in and read them from the
database, select the Store Macros in Database
check box. After you select the check box, these conditions apply:

* When a user
  runs a macro, the macro is read from the database.
* Any macros
  created after the check box is selected are stored in the database.

To store macros on and read them from the
workstation, clear the check box. After you clear the check box, these
conditions apply:

* When a user
  runs a macro, the macro is read from the workstation.
* Any macros
  created after the check box is selected are stored on the workstation.

You cannot read certain macros from the
database and other macros from the workstation. If you previously
stored macros on the workstation but now store them in the database,
you can load your existing macros from the workstation to the database.
Similarly, if you previously stored macros in the database but now
store them on the workstation, you can load your existing macros from
the database onto the workstation. See [Storing
Macros](Storing_Macros.md).

10. Click Save.