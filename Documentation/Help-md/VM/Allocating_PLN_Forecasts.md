Allocating PLN Forecasts




# Allocating PLN Forecasts

In order to allocate your PLN forecasts, you must
follow the steps and requirements listed below:

First you will need to add the CUSTOMER\_ORDER table to your PLN
layout and perform the necessary joins. Since the CUSTOMER\_FORECAST
table does not contain the Shipto Id field, you need to join the CUSTOMER\_ORDER
table to your layout. The steps to follow are listed below:

1. In your PLN layout,
   on the Header tab, add the CUSTOMER\_ORDER table.
2. Click DATA
   button and select the following fields:

CUSTOMER\_ORDER.ID

CUSTOMER\_ORDER.CUSTOMER\_ID

CUSTOMER\_ORDER.SHIPTO\_ID

3. Highlight the CUSTOMER\_ORDER
   table and click the Join button.
4. Highlight CUSTOMER\_FORECAST.CUSTOMER\_ID
   on left side and CUSTOMER\_ORDER.CUSTOMER\_ID on right side, click
   number 1 and then Set.
5. Highlight CUSTOMER\_FORECAST.FORECAST\_ID
   on left side and CUSTOMER\_ORDER.SHIPTO\_ID on right side, click
   number "2" and then Set and OK.
6. Save the layout.
7. You must make sure you
   have a customer order in VISUAL that is for the same Customer
   ID and Shipto ID that you chose on your Allocation screen for
   the PLN layout.
8. The Forecast ID on the
   PLN records of PLN VDI file MUST contain the Shipto ID. During
   the import, VMDI

Exchange will look through the open customer
orders in VISUAL to find one for your Customer ID and ShiptoID (i.e.
Forecast ID). Once it finds a matching order, VMDI Exchange will import
your forecasts and will allocate them appropriately.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Data_Interchange.md) User-defined Help