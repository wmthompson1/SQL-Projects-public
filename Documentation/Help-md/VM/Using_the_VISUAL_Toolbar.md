Using the VISUAL Toolbar




# Using the VISUAL Toolbar

You can perform a basic search or an advanced search using the VISUAL
search bar.

In a basic search, you enter your search term in the Search box,
then click the Search button or press enter. The system searches the
database for your exact search term and for data similar to your search
term. Note that the system does not search the entire database; view
the Advanced Search dialog box to see the areas of the database that
the system searches.

To perform an advanced search:

1. Click the Filter
   button.
2. Specify the following
   information:

ID Enter your
search term in the ID field.

Like/Exact Select
Like to search for data similar to the term
you entered in the ID field. When you select Like, the system will
display any column that contains your search term in the Search Results
list. For example, if you entered plate in the ID field, the system
would display database columns containing 1/4 inch plate and 3/8 inch
plate. Select Exact if you want the system
to display database columns containing only your search term and no
other text in the Search Results list. For example, if you specified
plate, the system would display columns containing plate only. The
system would not display columns containing 1/4 inch plate or 3/8
inch plate. Typically, selecting Like returns more results than selecting
Exact.

Context If you
would like to limit your search to certain database columns, use the
Context field. Click the arrow and select the column you would like
to search. For example, if you select cust\_order\_id, the system searches
all cust\_order\_id columns in the database. Several tables contain
the cust\_order\_id column, including payable (which corresponds to
the Accounts Payable Invoice window), shipper (Shipment Entry window),
and inventory\_trans (Inventory Transaction Entry), among many others.
If you select cust from the drop-down list, the system searches all
columns that contain cust, including cust\_order\_id, customer\_id,
customer\_name, among others.

When you run a search based on a particular
context, the system may not return the source record. For example,
if you run a search on the cust\_order\_id column, the system will not
return any information from the Customer Order Entry window. The cust\_order\_id
column is not used in the customer\_order table; instead the id column
is used.

3. Click Search.
   The system searches the database based on the parameters you specified
   and returns a list of results.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Concepts_Common_Features.htm) User-defined Help