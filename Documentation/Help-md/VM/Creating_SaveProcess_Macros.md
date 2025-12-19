Creating SaveProcess Macros




# Creating SaveProcess Macros

.

Use these guidelines to create SaveProcess macros:

* You can create one SaveProcess
  macro for each document type.
* To ensure consistency, all
  users should use the same SaveProcess macros. If you store macros
  in the database, then the SYSADM user should create the macros
  and share them with other users in Security Maintenance. If you
  store macros locally, then you should provide all users with copies
  of the SaveProcess macros.
* The SaveProcess macros must
  update the PROCESS\_ACTIVITY table. To produce meaningful leadtime
  process graphs, your macros should update these columns:
* ACTUAL\_DAYS
* START\_DATE
* END\_DATE
* PERCENT\_COMPLETE

See [Creating Macros](Creating_Macros.md).

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Customer_Order_Entry.md) User-defined Help