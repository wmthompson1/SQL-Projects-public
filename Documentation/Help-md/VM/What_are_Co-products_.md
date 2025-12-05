What are Co-products?




# What are Co-products?

A co-product is an additional part produced by a work
order, in addition to the main part. A work order or master specifies
a part in its header that is considered the main part of the order.
This part may or may not be assigned a part number. The co-product
list specifies the additional parts that are made with the main part.
All co-products must have part numbers; the part numbers are the primary
keys of the record.

Do not confuse co-products with by-products. A by-product is similar
to a co-product in that it is an additional part with value that is
created by a work order. The difference is in the method used to cost
the additional parts. Co-products are costed directly from work order
details and calculated based on a percentage of the entire order cost.
You can assign values to co-products much like materials are assigned
values.

For example, a group of stamp parts, each having a different form,
fit and function, but each produced from the same raw material at
the same time are co-products. The scrap material produced by stamping
is a by-product.

Continuing the example of stamp parts, consider a group of four
parts that are produced from a single sheet of stainless steel.

![ebx_-953565239.gif](ebx_-953565239.gif "ebx_-953565239.gif")

The first part has been selected as the main part. This is a fairly
arbitrary decision, except that it should not create difficult "quantity
per" relationships.

The percent of cost calculation distributes the cost of the entire
order to each individual part being produced. The above relationship
causes the following unit costs, assuming the order costs a total
of $1,000.

![ebx_-953565239.gif](ebx_-953565239.gif "ebx_-953565239.gif")

VISUAL computes the total cost of the order, apportions it to each
of the co-products including the main part, and then computes a unit
cost for each co-product.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Manufacturing_Window.htm) User-defined Help

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](Setting_Up_Co-products.htm)
Setting Up Co-products

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](Linking_Co-products_to_Customer_Orders.htm) Linking Co-products to Customer Orders

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](Linking_Co-products_to_New_Work_Orders.htm) Linking Co-products to New Work Orders

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](Linking_Co-products_to_Existing_Work_Orders.htm) Linking Co-products to Existing Work
Orders

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](Receiving_Co-products_into_Inventory.htm) Receiving Co-products into Inventory

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](Shipping_Co-products.htm)
Shipping Co-products

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](Netting_Co-products.htm)
Netting Co-products

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](Allocating_Co-products_to_Demand.htm) Allocating Co-products to Demand

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](Viewing_Co_product_Demand_Allocation_Information.htm) Viewing Co-product Demand Allocation
Information