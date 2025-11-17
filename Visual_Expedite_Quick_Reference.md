# Visual Expedite Quick Reference Guide
## Exception Management System v2.2.1.7

---

## Page 1: Getting Started & Interface Overview

### What is Visual Expedite?
A real-time exception management system that identifies supply chain issues and enables quick resolution through integrated Visual ERP workflows.

### Main Interface - Three Panes

#### Exception Pane (Top)
- **Purpose**: Shows all active exceptions requiring attention
- **Key Actions**:
  - Click green refresh to update data
  - Sort by clicking column headers
  - Export to Excel using Excel icon
  - Check "Updated" when exception is addressed
  - Check "Locked" when exception cannot be fixed
  - Add notes in Comments field

#### Netting Pane (Bottom Left)
- **Purpose**: Shows supply/demand planning data for selected exception
- **Key Actions**:
  - Check "Cancel" to close short/cancel orders
  - Double-click dates to change due dates
  - Check "Include Planned Orders" to show MRP suggestions
  - Use "All warehouses" to see cross-warehouse planning

#### BOM/Where Used Pane (Bottom Right)
- **Purpose**: Shows bill of materials or where-used structure
- **Key Controls**:
  - "Multi-Level": Expand full structure
  - "Msg Counts": Show exception counts on components
  - "Show Trans": Display material/labor transactions
  - Direction arrows (↓/↑): Toggle BOM vs Where-Used view

### Quick Navigation Tips
- **Highlight any row** → Updates all related panes
- **Double-click Part ID** → Opens Visual material planning
- **Double-click Document** → Opens Visual PO/WO entry
- **Double-click Release message** → Opens EMS PO/WO generation (EMS users)

---

## Page 2: Exception Types & Filtering

### Exception Types (What They Mean)

| Exception | Description | Action Needed |
|-----------|-------------|---------------|
| **Late** | Order is past due | Expedite or reschedule |
| **Pull** | Need order earlier than scheduled | Move up delivery date |
| **Push** | Order arriving too early | Delay delivery date |
| **Cancel** | No demand for order | Cancel excess quantity |
| **Release** | Shortage with planned order available | Create PO/WO |
| **Moves** | Excess in one warehouse, shortage in another | Transfer inventory |
| **Order Point** | Below reorder point | Create replenishment order |
| **Shortage** | Stock shortage without planned order | Investigate demand |
| **Safety Stock** | Below safety stock level | Expedite replenishment |

### Quick Filter Setup

#### Material Types
- **Fab**: Fabricated/manufactured parts
- **Pur**: Purchased parts  
- **Svc**: Outside service operations

#### Time Filters
- **Horizon**: Days from "Act by Date" to today (urgency)
- **Days**: Threshold for Late/Push/Pull severity

#### Value Filters
- **Amount**: Dollar value threshold

#### Exclusions (Use to focus on actionable items)
- **Exclude Updates**: Hide already-addressed exceptions
- **Exclude Locks**: Hide non-fixable exceptions
- **Exclude Planned**: Hide planned-order-driven exceptions

### Filter Tips
- Yellow tab = filter applied
- Use Lists for grouping codes
- Wildcards (%) work in Part ID field only
- Code ranges work for Planner, Buyer, Product/Commodity codes

---

## Page 3: Taking Action - Standard Users

### Exception Resolution Workflow

#### 1. Review Exception
- Check exception type and urgency (Horizon/Days)
- Review "Act by Date" vs current due date
- Check "New Date" for system recommendation

#### 2. Make Changes in Netting Pane
- **Cancel Orders**: Check "Cancel" box to close short
- **Change Dates**: Double-click date → Opens date change dialog
- **Notes**: System automatically logs changes with user/date

#### 3. Update Status
- Check "Updated" when action taken
- Add comments for tracking
- Check "Locked" if exception cannot be fixed

### Part Information Access
- Part details appear at top when highlighting exceptions
- Toggle between Part Warehouse and Part views
- Access comprehensive Part Info screen via icon next to "Qty Avail"

### Drilling Down to Visual
- **Part ID**: Material planning window
- **Document**: PO Entry or Manufacturing window
- **Component**: Highlights component planning data

### Column Management
- **Rearrange**: Drag column headers
- **Resize**: Double-arrow cursor on header edges
- **Show/Hide**: Use Maintain → Show/Hide Columns
- Settings saved per user automatically

### Important Data Points
- **Date**: Current due date
- **Act by Date**: When action needed (considering lead time)
- **New Date**: System-recommended date
- **Message**: Exception type and details

---

## Page 4: Advanced Features & Administration

### EMS Users - Purchase Order Generation
**Access**: Double-click "Release" message or use EMS module

#### Quick PO Creation
1. **Vendor Selection**: Auto-fills FOB, terms, currency
2. **Line Items**: Add/delete/copy lines as needed
3. **Planned Orders**: Combine multiple planned orders
4. **Allocations**: Link to specific requirements
5. **Outside Services**: Special handling for service operations

#### Key PO Features
- **Delivery Schedules**: Multiple delivery dates per line
- **Project Integration**: WBS, Cost Category support
- **History Access**: Purchase history, quotes, open POs
- **Exception Linking**: Address multiple exceptions per PO

### EMS Users - Work Order Generation
**Access**: Double-click "Release" message for fabricated parts

#### Quick WO Creation
1. **Engineering Master**: Auto-populates from engineering data
2. **BOM Review**: View/modify bill of materials on-the-fly
3. **Planned Orders**: Combine multiple requirements
4. **Co-Products**: Manage multiple outputs

### Critical Maintenance Tasks

#### Cumulative Lead Times (CRITICAL)
- **Frequency**: Update regularly (red alerts show when needed)
- **Impact**: Drives "Act by Date" calculations
- **Access**: Maintain → Cumulative Lead Times
- **Manual Override**: Available per part

#### List Management
- **Purpose**: Group codes for easier filtering
- **Storage**: Per user, auto-saves
- **Access**: Maintain → Lists

### System Administration (SYSADM Only)

#### Generator Configuration
- **License Key**: Required for operation
- **Process Horizon**: Days to look ahead (0 = unlimited)
- **Cascade Method**: Y = push all demand, N = minimal changes
- **Message Limits**: Controls exception volume per part/warehouse

#### User Management
- **Access Levels**:
  - Y: Full EMS access (PO/WO generation)
  - N: View only, drill to Visual
  - W: Work orders only
  - P: Purchase orders only

#### PO Approval Workflow (Optional)
- **Multi-level approvals** based on dollar amounts
- **Department-based** authorization available
- **Email notifications** for approvers
- **Change control** during approval process

### Quick Troubleshooting
- **No data showing**: Check filters, run generator
- **Can't make changes**: Check user access level
- **Dates wrong**: Update cumulative lead times
- **Missing exceptions**: Check Process Horizon setting

---

*Visual Expedite v2.2.1.7 Quick Reference - For detailed information, consult full user guide*