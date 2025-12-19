Updating Line Item Accumulators




# Updating Line Item Accumulators

In order to allocate your PLN forecasts and update
customer order line item accumulator fields with your data contained
in your PLN VDI file, you must follow the steps and requirements listed
below:

First you will need to add the CUSTOMER\_ORDER table to your PLN
layout and perform the necessary joins. Since the CUSTOMER\_FORECAST
table does not contain the Shipto Id field, you need to join the CUSTOMER\_ORDER
table to your layout. The steps to follow are listed below:

1. In your PLN layout,
   on the Header tab, add the CUSTOMER\_ORDER table.
2. Click DATA button and
   select the following fields:

CUSTOMER\_ORDER.ID

CUSTOMER\_ORDER.CUSTOMER\_ID

CUSTOMER\_ORDER.SHIPTO\_ID

CUST\_ORDER\_LINE.CUST\_ORDER\_ID

CUST\_ORDER\_LINE.LINE\_NO

CUST\_ORDER\_LINE.CUSTOMER\_PART\_ID

CUST\_ORDER\_LINE.EDI\_ACCUM\_FAB\_QTY

CUST\_ORDER\_LINE.EDI\_ACCUM\_RAW\_QTY

CUST\_ORDER\_LINE.EDI\_ACCUM\_SHIP\_QTY

3. Highlight the CUSTOMER\_ORDER
   table and click the Join button.
4. Highlight CUSTOMER\_FORECAST.CUSTOMER\_ID
   on left side and CUSTOMER\_ORDER.CUSTOMER\_ID on right side, click
   number "1" and then Set.
5. Highlight CUSTOMER\_FORECAST.FORECAST\_ID
   on left side and CUSTOMER\_ORDER.SHIPTO\_ID on right side, click
   number "2" and then Set and OK.
6. Highlight the CUST\_ORDER\_LINE
   table and click the Join button.
7. Highlight CUSTOMER\_FORECAST.CUSTOMER\_PART\_ID
   on left side and CUST\_ORDER\_LINE.CUSTOMER\_PART\_ID on right side,
   click number "1" and then Set.
8. Highlight CUSTOMER\_ORDER.ID
   on left side and CUST\_ORDER\_LINE.CUST\_ORDER\_ID on right side,
   click number "2" and then Set and OK
9. Save the layout.

   |  |  |
   | --- | --- |
   | POSTIT.gif | You must make sure you have a customer order in VISUAL that is for the same Customer ID and Shipto ID that you chose on your Allocation screen for the PLN layout. |

The customer order MUST contain line items
for the Parts for which you are importing PLN forecasts.

The Forecast ID on the PLN records of PLN
VDI file MUST contain the Shipto ID. During the import, VMDI Exchange
will look through the open customer orders in VISUAL to find one for
your Customer ID and Shipto ID (i.e. Forecast ID).

After it finds a matching order, VMDI Exchange
will import your forecasts and will allocate them appropriately.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Data_Interchange.md) User-defined Help