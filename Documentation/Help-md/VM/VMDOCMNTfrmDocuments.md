Adding Documents




# Adding Documents

You can add documents by specifying a file location
or a URL address. Using a URL address can be helpful if you share
documents with Microsoft Sharepoint or other similar document sharing
systems.

If you add documents with a URL address, you cannot
print the document using the print associated documents feature found
in applications such as Customer Order Entry, Print Work Order Travellers,
Customer Maintenance, Part Maintenance, and Vendor Maintenance. If
you would like to be able to print the documents that you associate
with records in these applications, specify a file location instead
of a URL.

The system does not validate the existence of any
URL address you provide. Make sure you specify the URL correctly.

For physical file locations, you can specify a default
Global Document Path for the file location in Document Folder Maintenance.
You can also specify a file location based on SIte ID and Reference
Type.

Because you assign document references and not direct
associations within VISUAL, you only need to manage your documents
in one place, the Document Maintenance window.

To add Documents:

1. In the Document Maintenance
   window, use the Site ID field to specify where the document can
   be used. To use the document in a particular site, select the
   site from the drop-down list. To use this document at the tenant
   level, select \*\* Tenant \*\* from the drop-down list. When you add
   a document at the tenant level, the document is available to all
   sites by default. If you are licensed to use a single site, this
   field is unavailable.
2. Click the Reference Type arrow and select the type of
   document from the list. You cannot remove or add Reference Types
   from the drop-down list. General is the default reference type.

By selecting an appropriate reference type,
you can control the documents that appear in the various windows and
thereby limit the documents from which your users can select. For
example, if you select Part for all of your part documents and your
user is referencing a document in the Part Maintenance window, that
user will only be able to select a part document. You can reference
General type documents from within any module.

You can select AP Invoice, AR Invoice, Customer,
Customer Order, Email Attachments, Engineering Change Notice, Estimating,
General, General Journal, Operation, Part, Project, Purchase Contract,
Purchase Order, RFQ, RMA, Requisition, Service, Shipper, Shop Resource,
Trace, Vendor, Work Order, or Work Flow.

After you select a reference type, the Document
Path field is updated. If a path is specified for the reference type
and site in the Document Path Maintenance dialog, then that path is
displayed in the Document Path field. If a path has not been specified
for the reference type and site, then the global document path is
displayed. If the global document path has not been specified, then
the directory where you store your VISUAL executables is displayed.

3. To add the document,
   perform one of these actions:
4. Drag-and-drop
   the document onto the Document Maintenance window. The document
   is copied into the directory that is displayed in the Document
   Path field.
5. Click the
   Document
   Path field button and navigate to the file. Click Open.
   The document is stored in the directory to which you navigated.
   It is not copied to any default directories that you have set
   up.
6. Specify a
   URL in the Document Path field. When you specify a URL with a
   valid protocol, the system selects the URL check box. The system recognizes these
   protocols:  
   http://  
   https://  
   file:// Use this protocol to reference a file on Microsoft Sharepoint
   only.  
   file:///// Use this protocol to reference a file on a web server.

The system inserts the name of the file
in the Document ID field.

Note: If you intend
to share your document across your network or with other VISUAL applications,
such as the VISUAL Shop Floor app, we recommend using the UNC path
in the Document Path field instead of a local file system path to
a mapped drive. For example, specify \\mycomputername\documents\mydocument.pdf
instead of c:\\documents.pdf.

4. In the Description
   field, specify a description for this document.
5. Click the Document Category drop-down button and
   select the category from the list. See [Setting
   Up Document Categories](Setting_Up_Document_Categories.htm).
6. If
   this document is under ECN Revision Control, select the ECN Rev Control check box, which also
   deactivates the Stage and Revision fields. If the document is
   not under ECN Revision Control, you can specify a stage and revision
   level for the document.

You can select Design, Pilot, Manual, or
Release. Stage codes
apply to records controlled by manual (you enter a Revision ID) or
predefined (VISUAL generates numbers based on your preferences) revision
numbers.

To create stage codes, use [revision
numbering maintenance](Maintaining_Revision_Numbering.htm).

If the stage code you select has any predefined
revision numbers assigned to it, VISUAL displays a browse for the
Revision field.

7. To allow the e-mailing
   of this document to customers or vendors, select the Allow
   Emailing check box.
8. Click the Save
   icon on the toolbar.

After you save the document, you can click the Document Link field
to open the document. If you provided a URL with the http:// or https://
protocol, the system opens the document in a web browser. If you provided
a URL with the file:// protocol or file:///// protocol, the system
opens the document in the application in which it was created. If
you provided a physical document location, the system also opens the
document in the application in which it was created.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](VMDOCMNTWhat.htm)
What is Document Maintenance?

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Document_Maintenance.htm) User-defined Help