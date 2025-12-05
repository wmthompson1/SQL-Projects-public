Browsing by SQL Statement




# Browsing by SQL Statement

You can browse the database by SQL statement.

1. In the Browse window,
   select SQL from the Options
   menu.

The Browse by SQL Statement dialog box appears.

2. Enter the SQL statement
   you want to use for your search in the Search Condition field.
3. Click Ok
   to begin the search.
4. Click the Save
   as Default button to save the SQL statement as the default
   statement. This statement will appear in the Search Condition
   field the next time you choose to browse by SQL statement.

After you click the Ok
button, VISUAL returns the results to the Browse window.

## Using Customizable UDFs in your SQL Statement

If you have set up Customizable User Defined Fields for a program,
you can include those Customizable UDF fields in your search by SQL
filter.

For example, if you are browsing for an order ID in the Customer
Order Entry window and you are browsing for an Order ID, use this
procedure to include customizable user defined fields in your search:

1. Add a join clause for
   the CUSTOMER\_ORDER and CUSTOMER tables in the Search Condition
   box.

CUSTOMER\_ORDER.CUSTOMER\_ID
= CUSTOMER.ID

2. Add two table references
   for the user defined fields into From: box.

CUSTOMER\_ORDER, CUSTOMER,
USER\_DEF\_FIELDS UDF\_DEF, USER\_DEF\_FIELDS

3. The first USER\_DEF\_FIELDS
   reference use a table alias so SQL can join the table back to
   itself and resolve ambiguities that might occur.

Join the USER\_DEF\_FIELDS definition to the
USER\_DEF\_FIELDS data in the Search Condition box:

AND UDF\_DEF.PROGRAM\_ID
= USER\_DEF\_FIELDS.PROGRAM\_ID

AND UDF\_DEF.ID = USER\_DEF\_FIELDS.ID

AND CUSTOMER\_ORDER.ID
= USER\_DEF\_FIELDS.DOCUMENT\_ID

AND USER\_DEF\_FIELDS.PROGRAM\_ID
= 'VMORDENT'

|  | It's important to point out that two pieces of this clause are specific to the application for which you are creating the SQL statement:  The CUSTOMER\_ORDER\_ID fields need to be joined to the USER\_DEF\_FIELDS.DOCUMENT\_ID (not UDF\_DEF.DOCUMENT\_ID as this value will be NULL) and the USER\_DEF\_FIELDS.PROGRAM\_ID must be equi-joined against the programs internal application name. This is usually the same as the executable name.  The only exception to the PROGRAM\_ID rule is for the Order Management Window, which uses the VMORDENT as the program ID instead of VMORDWIN. Using the VMORDENT reference allows VISUAL to give the ability to have one set of customizable UDF definitions for both order entry windows. |

4. To include a restriction
   for a particular UDF you must add a join for the definition label.
   For this example, a string UDF with a label of 'String 1'.

AND UDF\_DEF.LABEL = 'String
1'

This statement will not be very useful unless
you add another join for the actual data that is assigned to the 'String
1' definition:

AND USER\_DEF\_FIELDS.STRING\_VAL
= 'Test 1'

Complete example:

| From: |
| CUSTOMER\_ORDER, CUSTOMER, USER\_DEF\_FIELDS UDF\_DEF, USER\_DEF\_FIELDS |
| Search Condition: |
| CUSTOMER\_ORDER.CUSTOMER\_ID = CUSTOMER.ID  AND UDF\_DEF.PROGRAM\_ID = USER\_DEF\_FIELDS.PROGRAM\_ID  AND UDF\_DEF.ID = USER\_DEF\_FIELDS.ID  AND CUSTOMER\_ORDER.ID = USER\_DEF\_FIELDS.DOCUMENT\_ID  AND USER\_DEF\_FIELDS.PROGRAM\_ID = 'VMORDENT'  AND UDF\_DEF.LABEL = 'String 1'  AND USER\_DEF\_FIELDS.STRING\_VAL = 'Test 1' |

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Concepts_Common_Features.htm) User-defined Help