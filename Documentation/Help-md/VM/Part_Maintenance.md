Part Maintenance




# Part Maintenance

The Part Maintenance window has a lot of information
associated with it. This section discusses how the accounting information
entered in Part Maintenance affects the General Ledger and the reporting
of costs to the General Ledger Inventory Accounts.

Part Maintenance allows you to add and edit part information for
all the parts in your companys database. A part can be either the
raw material or other purchased component necessary in the manufacturing
process, or goods produced during the manufacturing process. A part
can be either a finished piece or an intermediate assembly used in
another process.

You can enter information into the Material, Labor, Burden, and
Service fields. When using a fabricated part, all four fields are
active. If it were a purchased part, the Material field and the Fixed
(cost) fields would be active (purchased parts have no Labor, Burden,
or Service associated with them).

Part Standard Costs setup can be entered for purchased and fabricated
parts.

* Material adjust-in transactions
  use these values to determine the transaction costs. Quantity
  adjusted-in times the Part Maintenance cost will extend to the
  FIFO layers value.
* Engineering masters use
  the cost setup in Part Maintenance for their estimates. Based
  on the Engineering masters, costs will flow next to the work order
  estimate cost when they are created.
* Standard costs:

Purchase order receipts will use the Part Maintenance standard when
goods are received. The total received amount is compared to the accounts
payable voucher costs to determine purchase price variances.

Finished Goods receipts also use the Part Maintenance value for
receipts. The costs received is compared to the incurred WIP amounts
to determine Finished Goods Variances.

Engineering Master Standards can be imploded into the Part Maintenance
window.

* Based on the latest Engineering
  Master Eng ID number (latest rev level), cost can be sent to each
  cost component. This is not an automatic update and should be
  executed only when standards need to be updated.

Burden is the capitalization of current overhead manufacturing costs
to the parts that are manufactured during that period.

* Purchase Burden can be applied
  when Purchased / Received to inventory on a percentage of cost
  or on a fixed amount per unit basis.
* Issue Burden can be applied
  when inventory is issued to a job. The Burden cost is carried
  in the parts inventory value until it is shipped. Inventory value
  moves to Costs of Goods Sold upon shipment.

Part Maintenance is available from the VISUAL Main window under
the Maintenance menu. It can display both fabricated and purchased
parts. It is important to differentiate between the type of part because
of the way the accounting information is handled.

To view the General Ledger Inventory Account information in the
Part Maintenance window, click the Accounting
button.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](Purchased_Parts_Costing_Utils.md) Purchased Parts

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](Fabricated_Parts_Costing_Utils.md) Fabricated Parts

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Costing_Utilities.md) User-defined Help