Warehouse Locations and Auto-issue Transactions




# Warehouse Locations and Auto-issue Transactions

To determine the location that is used for auto-issues,
this hierarchy is used:

* If a warehouse is specified
  on the header of the Material Requirement card and a location
  is specified on the Planning tab of the Material Requirement card,
  then the location that is specified on the Planning tab is used.
* If a warehouse is specified
  on the header of the Material Requirement card but no location
  is specified on the Planning tab, then the location that is designated
  as the default auto-issue location for the warehouse is used.
* If no warehouse is specified
  on the header of the Material Requirement card, then the default
  auto-issue location that is specified on the Defaults tab in Part
  Maintenance is used.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](Auto-issue_Parts.md)
Auto-issue Parts