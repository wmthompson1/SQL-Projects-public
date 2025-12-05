Types of Macros




# Types of Macros

You can create two types of macros: macros that run automatically
based on an event and macros that you run manually.

Macros can be automatically run based on these events:

OnSave The OnSave macro is run before
the ability to save information has been validated.

OnAfterSave The OnAfterSave macro is
run after the user saves the record.

OnLoad The OnLoad macro is run when
the user opens an existing record.

OnNew The OnNew macro is run when the
user clears a record (clears the window ready for a new record) by
clicking the New toolbar button.

OnDelete The OnDelete macro is run when
the ability to delete information has been validated, but before the
deletion actually occurs. You cannot use this macro in the Manufacturing
Window.

OnAfterDelete The OnAfterDelete macro
is run after information has been deleted from the database, but before
the window has been cleared. You cannot use this macro in the Manufacturing
Window.

SaveProcess The SaveProcess macro is
used in conjunction with Performance Leadtime. The macro is run when
you save a record.

To create a macro based on an event, use the event name as the macro
name. For example, to create an OnNew macro, specify OnNew in the
Macro Name field. When the event occurs, the macro is run.

To create a macro that you run manually, specify any name as the
macro name. To run the macro, select it from the Macros menu.