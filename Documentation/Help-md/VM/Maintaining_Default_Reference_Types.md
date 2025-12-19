Maintaining Default Reference Types




# Maintaining Default Reference Types

Use default reference types to define how your documents
are stored.

When a user drags-and-drops a new document onto a programs main
window or a Document Reference dialog, these settings determine the
default reference type. For example, if you specify Customer as the
default reference type for Customer Order documents, then new documents
that are drag-and-dropped onto the Customer Order Entry window have
a Customer reference type. You can change the reference for new dragged-and-dropped
documents in the Document Reference dialog or in the New Document
dialog. The General reference type is used when no default reference
type exists.

To maintain default reference types:

1. In the Document Maintenance
   window, select Maintain, Default
   Reference Types.
2. In the Site ID field,
   specify the site where you are setting up default reference types.
   Select \*\* Tenant \*\* to set up default
   references for tenant-level documents. If you are licensed to
   use a single-site, this field is unavailable.
3. Click the Insert
   Row toolbar button.
4. Click in the Document
   Type column of the new row and select the Document
   Type from the drop-down list.
5. Click in the Default
   Reference Type column of the new row and select the Default
   Reference Type from the drop-down list.

This table lists the Reference types that are available based on
the selected Document Type:

| Document Type | Default Reference Type |
| AP Invoice | * AP   Invoice * General * Vendor |
| AR Invoice | * AR   Invoice * Customer * General |
| Cash Application | * AR   Invoice * General |
| Customer | * Customer * General |
| Customer Order | * Customer * Customer   Order * General |
| Engineering Change Notice | * Engineering   Change Notice * General |
| Equipment | * Equipment * General |
| Estimating | * Customer * Estimating * General |
| General Journal | * General * General   Journal |
| Operation | * General * Operation * Shop   Resource * Work   Order |
| Part | * General * Part |
| Project (Only available when you are licensed for a project database.) | * General * Project |
| Purchase Contract | * General * Purchase   Contract |
| Purchase Order | * General * Purchase   Order * Vendor |
| Receiver (Used when adding documents in Purchase Receipt Entry and Receiving Inspection) | * General * Purchase   Order * Receiver * Vendor |
| Requisition | * General * Requisition * Vendor |
| RFQ | * General * RFQ |
| RMA | * Customer * General * RMA |
| Service | * General * Service |
| Shipper | * Customer * General * Shipper |
| Shop Resource | * General * Shop   Resource |
| Trace | * General * Trace |
| Vendor | * General * Vendor |
| Work Order | * General * Part * Work   Order |

6. Click Save.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](VMDOCMNTWhat.md)
What is Document Maintenance?

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Document_Maintenance.md) User-defined Help