What is Document Maintenance?




# What is Document Maintenance?

Sometimes you may have a single document you want
to associate several items; for other documents, you may want to associate
several documents to one item. Use Document Maintenance to associate
your documents with the appropriate items in VISUAL.

By having a single window in which you can set up all of your documents
and using a reference from the appropriate areas in VISUAL, you can
better manage your documentation.

## Planning Document Storage

Documents can be stored in centralized directories by reference
type, site, entity, tenant, or globally. Use the Document Folder feature
to designate the storage folder
for documents at each level. See [Maintaining
Document Folders](Maintaining_Document_Folders.md).

If you set up specific directories for sites and reference types,
we recommend that you use drag-and-drop to add new documents and use
the Document ID browse in the Document Reference dialog to attach
existing documents to records. This prevents you from accidentally
overriding the site and reference type checks that are in place when
you: add new documents using drag-and-drop or attach existing documents
using Document ID browse in the Document Reference dialog.

This table describes how to achieve centralized directories for
each level:

| Document Storage Level | How to store a document at this storage level |
| Reference Type | For directories by reference type, specify a directory unique for each site or tenant reference type such as, C:\Infor\VISUAL\Docs\SiteABC\ReferenceType1 and C:\Infor\VISUAL\Docs\SiteABC\ReferenceType2. |
| Site | For a site-level directory not subdivided by reference type, specify the same directory for all of the sites reference types. |
| Entity | For an entity-level folder structure not subdivided by site, specify the same directories for all of the entity's child sites. You can still use reference types. For example, you could create a directory called C:\Infor\VISUAL\Attachments\EntityA\APInvoices and assign the directory to the AP Invoice reference type in each of the entity's child sites. |
| Tenant | For tenant-level folders, specify \*\* Tenant \*\* in the Site ID field. You can specify which sites have access to tenant-level documents on a document-by-document basis. |
| Global | For a global document folder, create a folder and then specify it in the Global Document Path. |

## Referencing Documents at the Tenant-level and the Site-level

When you attach documents in maintenance windows, the level of the
maintenance window must match the level of the document. For example,
Vendor Maintenance is a tenant-level application, because you cannot
specify a site. If you attach an existing document to a Vendor Maintenance
record, you can only attach tenant-level documents. While you can
use Document Maintenance to create a site-specific vendor document,
you cannot use this document in Vendor Maintenance. Site-specific
documents can only be used in site-specific maintenance windows such
as WIP Maintenance.

Similarly, when you create a new document attachment through a maintenance
window, the level of the new document matches the level of the maintenance
window. For example, if you create a new document in Purchase Order
Entry, the document is created in the site that you selected in the
purchase order header. If you create a new document in Customer Maintenance,
the document is created at the tenant level.

Many of the document reference-enabled windows allow document creation
at the site level. This table shows the windows where tenant level
documents and document references are made:

| Windows | Tenant-Level |
| Customer Maintenance | Tenant |
| Vendor Maintenance | Tenant |

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](Starting_Document_Maintenance.md) Starting Document Maintenance

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](Setting_Up_Document_Categories.md) Setting Up Document Categories

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](Maintaining_Document_Folders.md) Maintaining Document Folders

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](Maintaining_Default_Reference_Types.md) Maintaining Default Reference Types

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](VMDOCMNTfrmDocuments.md)
Adding Documents

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](VMCVTDOCfrmAddDrawings.md)
Adding Part Drawings to Document Maintenance

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](Setting_Allowable_Sites_for_Tenant_Documents.md) Setting Allowable Sites for Tenant Documents

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](Editing_Document_References.md)
Editing Documents References

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](Viewing_Where_Documents_are_Used.md) Viewing Where Documents are Used

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](Deleting_Document_References.md) Deleting Documents References

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](Viewing_Attached_Documents.md)
Viewing Attached Documents

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](Copying_and_Moving_Documents.md) Copying and Moving Documents

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](Printing_Document_Lists.md)
Printing Document Listings

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](Referencing_Documents.md)
Referencing Documents

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Document_Maintenance.md) User-defined Help