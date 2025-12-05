Automatic Macros and the Manufacturing Window




# Automatic Macros and the Manufacturing Window

These conditions apply when you use automatic macros in the Manufacturing
Window:

* You cannot use the OnDelete
  or OnAfterDelete macros. Because of the way items are deleted
  in the Manufacturing Window, these macros do not function on operation
  cards, material cards, and header cards.
* To use the On Save, OnAfterSave,
  OnLoad, and OnNew macros, you must specify the type of card where
  the macro is used. Use a suffix on the macro name to indicate
  where the macro is used. For automatic macros used in the header
  card, use these names:
* OnSaveWO
* OnAfterSaveWO
* OnLoadWO
* OnNewWO

For automatic macros used on leg header
cards, use these names:

* OnSaveLEG
* OnAfterSaveLEG
* OnLoadLEG
* OnNewLEG

For automatic macros used on operation cards,
use these names:

* OnSaveOP
* OnAfterSaveOP
* OnLoadOP
* OnNewOP

For automatic macros used on material cards,
use these names:

* OnSaveOP
* OnAfterSaveMAT
* OnLoadMAT
* OnNewMAT