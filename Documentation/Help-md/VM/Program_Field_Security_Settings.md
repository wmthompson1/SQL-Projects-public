Program Field Security Settings




# Program Field Security Settings

You can restrict access to individual fields for the program fields
listed below. You can specify full access or read-only access. Users
with read-only access can view the information in the fields, but
cannot edit the information.

For more information, refer to [Setting
Information on the Program Security Tab](Setting_Program_Security.htm).

|  |  |  |
| --- | --- | --- |
| **Menu String**  **Program ID** | **Fields** | **Notes** |
| Accounting Window  VFGLAWIN | Account Sub Type  Active  Budget  Display Currency  Description  Entity ID  Summarize to Acct ID  Project Account  Revalue  Summary Account  Type |  |
| Customer Maintenance  VMCUSMNT | Active  Address Line 1  Address Line 2  Address Line 3  Bill to Address Line 1  Bill to Address Line 2  Bill to Address Line 3  Bill to City  Bill to Country  Bill to Name  Bill to State  Bill to Zipcode  City  Country  Name  State  Web Site  ZIpcode |  |
| Inventory Transaction Entry  VMINVENT | Adjust In  Adjust Out  Issue Material  Receipt by Part  Receipt by Work Order  Receipt Return | You can control the ability to commit transaction activities or to set in view only mode by selecting either Yes or Read Only.  For each inventory transaction type, specify **Yes** to grant users the ability to enter and edit inventory transactions of that type. Specify Read Only to prevent users from entering and editing inventory transactions of that type. For example, if you specify Read Only for Receipt by Work Order, the user cannot enter or edit a Receipt by Work Order inventory transaction, but they can still view them. |
| Manufacturing Window  VMMFGWIN | Customer Priority | Specify **Yes** to allow users to specify a value in the Customer Priority field, which is located on the work order header. If you specify Yes, users can also specify customer priorities in the Shop Floor app. |
| Material Dispatch Queue  VMMATDIS | Prioirty | Specify **Yes** to allow users to select or clear the Priority check box. If you specify Yes, users can also select the check box in the Shop Floor app. |
| Move Request  VMMOVREQ | Prioirty | Specify **Yes** to allow users to select or clear the Priority check box. If you specify Yes, users can also select the check box in the Shop Floor app. |
| Part Maintenance  VMPRTMNT | Auto Issue  Case Qty  Commodity Code  Consumable  Demand History  Part Description  Detail Only  Eng Master Eng ID  Fabricated  Inv Tx Locked  Kit  Pallet Qty  Product Code  Purchased  Stock UM  Stocked  ToolGOFixture  Supply then Leadtime  Shipping Weight  Weight UM |  |
| Shipping Entry  VMSHPENT | Ship Charge Acct |  |
| Vendor Maintenance  VMVNDMNT | Active  Address Line 1  Address Line 2  Address Line 3  City  Country  Name  Remit to Address Line 1  Remit to Address Line 2  Remit to Address Line 3  Remit to City  Remit to Country  Remit to Name  Remit to State  Remit to Zipcode  State  Web URL  Zipcode |  |
| WIP Inventory Transaction  VMWIPTSF | Adjust In  Adjust Out  Transfer |  |

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User-defined_Help_Files_-_Security.htm) User-defined Help