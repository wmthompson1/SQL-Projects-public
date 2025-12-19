Setting Up Supplier Performance Criteria




# Setting Up Supplier Performance Criteria

To set up the criteria to use to evaluate your suppliers:

1. Select Purchasing,
   Supplier Performance.
2. Select Options,
   Preferences.
3. Specify the days late
   thresholds. Use the Days Late 1 threshold to specify the best
   rating. When you specify thresholds, follow these rules:
4. Specify 0
   in the Days Late 1 From threshold. If you do not specify 0, then
   orders that were delivered on time will not receive a quality
   rating for days late performance.
5. The days late
   thresholds should be sequential. For example, if you specify 5
   in the To field for Days Late threshold 1, then specify 5 in the
   From field for Days Late threshold 2.
6. The total
   of the % of Quality values you specify for thresholds 2 through
   4 must equal the % of Quality value you specify for threshold
   1. For example, if you specify 70 for threshold 1, you could specify
   40 for threshold 2, 20 for threshold 3, and 10 for threshold 4
   because 40 plus 20 plus 10 equals 70. You could not specify 50
   for threshold 2, 30 for threshold 3, and 15 for threshold 3, because
   50 plus 30 plus 15 does not equal 70.
7. If the average
   days late for all orders exceeds the value you specify in the
   To field for the Days Late threshold 4, then the supplier is given
   a rating of zero for on-time performance. These orders still receive
   a rating for quantity delivered.

For each threshold, specify this information:

From Specify
the beginning of the days late range.

To Specify the
end of the days late range.

% of Quality
Specify the rating for on-time performance a supplier receives if
the average days late for all orders falls in this threshold.

If you do not want to rate suppliers on
on-time performance, then specify a 0 in all Days Late Quality Rating
% fields.

4. In the Quantity Difference
   section, specify this information:

Qty/Qty Rec %
Specify the percentage of the quantity ordered that a vendor must
deliver to earn the top rating for quantity. If a vendor delivers
a percentage that is less than the value you specify here, the vendor
receives a prorated portion of the quality rating for delivery performance.
See [How
Supplier Performance Ratings are Calculated](How_Supplier_Performance_Ratings_are_Calculated.md).

% of Quality
Specify the rating a vendor earns for delivering the quantity percentage
you specify or greater. The value you specify in this field plus the
value you specified in the % of Quality field for Days Late 1 must
equal 100. If you do not want to rate suppliers on quantity, specify
0 in this field.

5. In the Limits section,
   specify this information:

Oldest PO Date
Specify the start date for the vendor evaluation. Purchase orders
with order dates on or after the date you specify are considered for
the vendor rating.

Number of Suppliers
Specify the number of vendors to include in the graph.

6. Click Save.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](VMSUPPFMfrmSupplierPerformance.md) Viewing the Supplier Performance Graph