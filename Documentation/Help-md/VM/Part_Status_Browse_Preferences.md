Part Status Browse Preferences




# Part Status Browse Preferences

You can use Preferences Maintenance to specify the status of the parts
to display in part ID browse tables.

1. Select Admin,
   Preferences Maintenance.
2. Click Insert.
3. Specify preferences. This
   table shows the preferences that you can set:

|  |  |  |
| --- | --- | --- |
| **Section** | **Entry** | **Value** |
| PartMaintenance | ShowInactivePartsInBrowse | Specify Y to include inactive parts in part ID browse tables.  Specify N to exclude inactive parts. The default value is Y.  The preference is applied to all part ID browses in the system.  If you specify N, you can type the ID of an inactive part into part ID fields. |
| PartMaintenance | ShowObsoletePartsInBrowse | Specify Y to include obsolete parts in part ID browse tables.  Specify N to exclude obsolete parts. The default value is Y.  The preference is applied to all part ID browses in the system.  If you specify N, you can type the ID of an obsolete part into part ID fields. |
| Customer Order Entry Window | ShowPartsFnArea | Specify Y to include parts that are not allowed in sales functions in the Part ID browse in Customer Order Entry and the Order Management Window.  Specify N to exclude the parts that are not allowed in sales.  The default value is Y. |
| PurchaseEntry | ShowPartsFnArea | Specify Y to include parts that are not allowed in purchasing functions in the Part ID browse in Purchase Order Entry and the Purchase Management Window.  Specify N to exclude the parts that are not allowed in purchasing.  The default value is Y. |
| ManufacturingWindow | ShowPartsFnArea | Specify Y to include parts that are not allowed in work order functions in the Part ID browse in the Manufacturing Window. Specify N to exclude the parts that are not allowed in work orders. The default value is Y. |

4. Click Save.
5. In the directory where you
   store VISUAL executables, delete the VMBROWSE.INI. The file is regenerated
   with your preferences when you next browse for a record.