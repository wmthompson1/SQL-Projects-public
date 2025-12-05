Setting Up Replenishment Level Effective Dates




# Setting Up Replenishment Level Effective Dates

This procedure applies to stocked parts only.

Demand can fluctuate throughout the year. For example, you may see
increased demand during certain seasons. To accommodate these fluctuations,
you may use different replenishment levels during certain times of
year. You can set up these replenishment levels in the Replenishment
Level Effective Dates dialog box. The replenishment levels you set
up in this dialog box override the replenishment level you specify
in the DBR tab. If no replenishment level has been specified for the
current date, then the replenishment level you specify in the DBR
tab is used.

If you plan by independently planned warehouses, you can set up
replenishment levels for each of your independently planned warehouses.
You can also set up replenishment levels for your universally planned
warehouses.

If you do not plan by independently planned warehouses, then the
replenishment levels you set up in the Replenishment Level Effective
Dates dialog box apply to all of your warehouses.

To set up replenishment levels by effective date:

1. Select Inventory,
   Part Maintenance.
2. Click the Part
   ID browse button and select a stocked part.
3. If you plan by independently
   planned warehouses, perform these steps:

   1. Click the DBR
      tab.
   2. In the Warehouse ID field, select the
      independently planned warehouse for which you are setting
      up replenishment levels. Select Universal if
      you are setting up replenishment levels for your universally
      planned warehouses.
4. Select Maintain,
   Replenishment Level Effective Dates.
5. Click Insert.
6. Specify this information:

Begin Date 
Specify the date that the replenishment level takes effect. Beginning
on this date, the replenishment level you specify in this dialog overrides
the replenishment level specified on the DBR tab.

End Date Specify
the date that the replenishment level override expires.

Replenishment Level
Specify the replenishment level for this part. When the number of
units in inventory falls below this amount, a new supply order is
generated. For fabricated parts, a new work order is generated. For
purchased parts, a new planned purchase order is generated.

Is Recurring
If this replenishment level override applies during these dates every
year, select the Is Recurring check box. If you select this check
box, then the replenishment level you specify applies during the date
range every year. The year in the Begin Date and End Date is ignored.

7. Click Save.