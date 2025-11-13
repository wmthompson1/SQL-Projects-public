# Visual Manufacturing Help Files - Document References Summary

## Key Help Files for Document References

Based on the Visual Manufacturing help file analysis, here are the critical documents for understanding document references:

### Primary Reference Files

#### 1. **Referencing_Documents.htm** - Core Documentation
- **Location**: `Visual Mfg Help Files\VM\Referencing_Documents.htm`
- **Purpose**: Comprehensive table showing where documents can be attached
- **Key Content**: 
  - Complete application-to-document-type mapping
  - Attachment levels (Header, Line, Both)
  - Reference types by application

#### 2. **Referencing_Existing_Documents.htm**
- **Location**: `Visual Mfg Help Files\VM\Referencing_Existing_Documents.htm`
- **Purpose**: Step-by-step procedures for attaching existing documents
- **Key Content**:
  - How to open Document Reference dialog
  - Different access methods by application
  - Document selection and filtering

#### 3. **VMDOCMNTWhat.htm** 
- **Location**: Referenced from Referencing_Documents.htm
- **Purpose**: Overview of Document Maintenance functionality

#### 4. **Creating_Document_References_in_Maintenance_Windows.htm**
- **Location**: Referenced from Referencing_Documents.htm  
- **Purpose**: Document creation in maintenance contexts

## Document Reference Locations by Application

### Manufacturing Window Applications

#### **Manufacturing Window - Header Card**
- **Document Types**: General, Part, Work Order
- **Attachment Level**: Header only
- **Access Method**: Click "Doc Ref" button
- **Alternative**: Edit → Document Reference

#### **Manufacturing Window - Operation Card**  
- **Document Types**: General, Operation, Service, Shop Resource, Work Order
- **Attachment Level**: Header only
- **Access Method**: Edit → Document Reference

#### **Manufacturing Window - Material Requirement Card**
- **Document Types**: General, Part, Work Order  
- **Attachment Level**: Header only
- **Access Method**: Edit → Document Reference

### Project Window Applications

#### **Project Window - Header Card**
- **Document Types**: General, Part, Work Order
- **Attachment Level**: Header only

#### **Project Window - WBS Task Card** 
- **Document Types**: General, Operation, Service, Shop Resource, Work Order
- **Attachment Level**: Header only

#### **Project Window - Leg/Detail**
- **Document Types**: General, Part, Work Order
- **Attachment Level**: Header only

## Document Types Explained

### **General Documents**
- Available in most applications
- Not tied to specific business objects
- Universal reference type

### **Work Order Documents**
- Specific to work order contexts
- Available in Manufacturing Window
- Can be attached at header or operation level

### **Part Documents**  
- Related to part/inventory items
- Available in Part Maintenance
- Can be referenced in work order contexts

### **Operation Documents**
- Specific to manufacturing operations
- Available in Operation Card contexts
- Tied to specific sequence numbers

### **Service Documents**
- Related to outside services
- Available in service-related contexts

### **Shop Resource Documents**
- Tied to manufacturing resources
- Available in resource-related operations

## Access Methods Summary

### Toolbar Buttons
- **Documents Button**: Attach to record header
- **Line Documents Button**: Attach to selected line item

### Menu Options
- **Edit → Document Reference**: Header attachment
- **Edit → Line Document Reference**: Line attachment  
- **Maintain → Document Reference**: Maintenance contexts
- **Info → Document Reference**: Inquiry contexts

### Manufacturing Window Specific
- **Header Card**: Use "Doc Ref" button
- **All Other Cards**: Use Edit → Document Reference

## Document Reference Dialog Features

### Document Selection
- Browse button for document selection
- Filtered lists based on reference type
- "All Reference Types" checkbox for expanded view

### Multi-Tenancy Support
- Tenant-level documents available in tenant applications
- Site-level applications see both site and allowed tenant documents
- Automatic filtering based on context

### Insert/Edit/Delete Operations
- **Insert**: Add new document reference
- **Edit**: Modify existing reference
- **Delete**: Remove reference (restrictions apply)

## Important Notes

### Deletion Restrictions
From `Deleting_Document_References.htm`:
- Cannot delete references from Document Maintenance if already used in VISUAL
- Must remove from VISUAL applications first
- Then delete from Document Maintenance

### Reference Type Validation
- Document types filtered by application context
- Only valid types shown in selection lists
- Reference type determines where documents appear

### File Path Handling
Multiple invalid path formats are cleaned up:
- Single dash "-"
- Various slash combinations "/", "//", "///", "\\", "\\\"
- Empty or invalid paths normalized

## Related Functionality

### Document Lifecycles
- **Viewing_Document_Lifecycles.htm**: Track document changes
- **Document_Lifecycle_in_RMA_Entry.htm**: RMA-specific lifecycle

### Material Planning Integration
- **Viewing_Document_References_in_the_Material_Planning_Window.htm**
- View-only access to part-attached documents

### Trace Integration  
- **Linking_Documents_to_Trace_IDs.htm**
- Document attachment to traceability records

## User-Defined Help Extensions

Most help files reference user-defined help files:
- `User_defined_Help_Files_Document_Maintenance.htm`
- `User_defined_Help_Files_Manufacturing_Window.htm`  
- `User_defined_Help_Files_Work_Order_Operation_Input.htm`

These likely contain customization-specific documentation.

## Best Practices (Implied from Documentation)

### Organization
- Use appropriate document types for context
- Attach at correct levels (header vs line)
- Maintain consistent reference types

### Maintenance
- Regular cleanup of unused references
- Proper deletion sequence (VISUAL first, then maintenance)
- Monitor for orphaned records

### User Training
- Understand access methods for each application
- Know which document types are available where
- Proper use of attachment levels