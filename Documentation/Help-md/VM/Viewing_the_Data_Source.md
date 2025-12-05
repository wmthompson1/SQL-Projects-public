Viewing the Data Source




# Viewing the Data Source

NOTE: To use this feature,
you must have system administration privileges.

You can use the Display Data Source toolbar button to display the
database table and column that store the information shown in the
interface:

|  | Display Data Source toolbar button |

You can use this feature on the main window. You cannot use the
feature in the dialogs that you open from the main window, such as
the Delivery Schedule dialog in Customer Order Entry.

The data source function is available in these windows:

* Accounting Window
* A/P Invoice Entry
* A/P Payment Entry
* A/R Cash Application
* A/R Invoice Entry
* Customer Maintenance
* Customer Order Entry
* Estimating Window
* IBT Entry
* Manufacturing Window (header,
  material, and operation cards only)
* Material Trace History
* Outside Service Dispatch
  Entry
* Outside Service Maintenance
* Part Maintenance
* Part Trace Maintenance
* Purchase Management Window
* Purchase Order Entry
* Purchase Receipt Entry
* Purchase Requisition Entry
* Receiving Inspection
* RMA Entry
* Shipping Entry
* Shop Resource Maintenance
* Task Maintenance
* Vendor Maintenance
* Vendor RFQ Entry

To display the data source of an interface object:

1. Open a window where
   the Database Source option is supported.
2. Click the Display
   Data Source button.
3. Click the interface
   object whose source you want to view. For fields, click the field.
   For check boxes and option buttons, you can click the label or
   the object. This information is displayed in the Status Bar at
   the bottom of the window:
4. If a single
   database table and column supplies data to the object, then the
   table and column are displayed.
5. If data in
   the field could be stored in more than one database table and
   column, then all database tables and columns that store the data
   are displayed. For example, if you view the data source for the
   Fabricated check box in Part Maintenance, both PART\_SITE.FABRICATED
   and PART.FABRICATED are displayed.
6. If data in
   the field is a calculation of multiple database tables and columns,
   such as the Grand Total field in Customer Order Entry, then Calculated
   is displayed.
7. If the data
   in the field is derived from a single source, then Derived is
   displayed. For example, the Specs column in the line table in
   Customer Order Entry is a derived field. Its value is determined
   by the existence of a specification for the part on the line.
8. If the data
   in the field is derived from multiple fields, then Derived from
   multiple fields is displayed. For example, the Supply Status column
   in the line table in Customer Order Entry is derived from multiple
   fields in the database.

4. To view the source for
   another object, click the Display Data Source
   button again and then click the second object.