Applying Changes in a Quality Management System




# Applying Changes in a Quality Management System

If you are integrated to Infor Quality Management, update the corresponding
quality management records to keep your quality database in sync with
your VISUAL database.

Before you begin this procedure, you must enable a quality management
system in Site Maintenance.

To update your quality management system:

1. In the ECN record, select
   a line item.
2. Click the Start button.
   Perform one of these actions:
3. If you specified
   Query Use on the Site Maintenance General tab for this site, then
   a dialog box is displayed. To open the related maintenance window
   in IQM, click Yes. To open the maintenance window in VISUAL, click
   No.
4. If you specified
   Always Use on the Site Maintenance General tab for this site,
   then IQM is opened.

The maintenance form that is opened depends
upon the item specified on the ECN line. This table shows which IQM
form is associated with each ECN item type.

| **ECN Type** | **IQM Form** |
| Document | Document Maintenance |
| Part | Product Maintenance |
| Engineering Master | Process Maintenance |
| Work Order | Process Maintenance |
| Project | Not applicable. Projects are not maintained in the quality management system. |
| Change Notice | Not applicable. Change notices are not maintenance in the quality management system. |

3. When you are finished
   implementing the ECN in both IQM and in VISUAL, select the External
   Tasks Complete check box. This completes the ECN. After an ECN
   is complete, you cannot edit it.