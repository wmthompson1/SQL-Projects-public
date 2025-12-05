Filtering the Data Source




# Filtering the Data Source

Use the Filter tab to specify filters that are always
applied to the query results. For example, if you wanted the data
source to include work orders with a status of Released only, and
your table alias for the WORK\_ORDER table is wo, then you could specify
this statement in the Filter tab:

wo.status = R

To limit query results to a users viewable sites, you must use
the @VIEWABLE\_SITES token in the Filter tab. For example, to limit
the work orders returned by a query to those work orders created in
a users viewable sites, you would specify this statement in the Filter
tab:

wo.site\_id IN (@VIEWABLE\_SITES)

You can also use the @CURRENT\_USER\_ID token to limit query results
to records associated with the user. For example, to build a metric
that allows users to view a list of customer orders that they entered,
and co is the table alias for customer\_order, you would specify this
statement in the Filter tab:

co.entered\_by = @CURRENT\_USER\_ID