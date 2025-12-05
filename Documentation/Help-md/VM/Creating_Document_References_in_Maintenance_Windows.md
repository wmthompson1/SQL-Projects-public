Creating Document References in Maintenance Windows




# Creating Document References in Maintenance Windows

Dragged-and-dropped documents are stored based on
this storage hierarchy. If a directory exists for tenant, site, or
reference type documents, the document is stored there. If no such
directory exists then the document is stored in the global document
path as defined in the Document Folder Maintenance window. If folders
do not exist at either of those storage hierarchy levels, then the
documents are stored in the VISUAL executable directory.

You can add a document reference to a maintenance window by:

* Dragging and dropping the
  document onto one of these maintenance windows: Customer Maintenance,
  Part Maintenance, Vendor Maintenance or WIP Maintenance.
* Dragging and dropping the
  document onto a maintenance windows Document Reference dialog.
* Specifying a new Document
  ID in a maintenance windows Document Reference dialog.

## Dragging and Dropping Documents onto Maintenance Windows

You can create document references to maintenance windows using
the drag-and-drop method.

The document level, site-level or tenant-level, is determined by
the window onto which you are dragging and dropping the document.
The documents reference type is determined by the settings specified
in the Document Maintenance windows Default Reference Type Maintenance
dialog. The documents path is determined by the settings specified
in the Document Maintenance windows Document Folder Maintenance dialog.

Dragging and dropping a new document is different than adding an
existing document as a new reference for a record. New documents are
created based on their default reference type. You can override the
reference type default in the New Document dialog. New documents are
assigned to a site or tenant; the site when it is specified in the
maintenance window, or the tenant when the site is not specified in
the maintenance window. Adding an existing document as a new reference
for a record differs from adding a new document. An existing document
must have a valid reference type for the application, which may differ
from the default, and it must also be valid for the site or tenant
specified in the maintenance window.

To drag-and-drop documents onto maintenance windows:

1. Access the maintenance
   window to which you are creating the referenced document.
2. Select the item. For
   example in Part Maintenance select the part.
3. Locate the document
   you want referenced in the maintenance window.
4. Click and hold the mouse
   button down to select the document, drag the mouse onto the maintenance
   window, and then release the mouse button to create a reference
   to the document.
5. Click Yes
   in the message box indicating that the document reference will
   be created. Click No to cancel.
6. Click Save.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Document_Maintenance.htm) User-defined Help