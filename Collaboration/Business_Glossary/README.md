# Business Glossary

A shared vocabulary for Skills Inc data and business concepts. This semantic layer helps everyone speak the same language when discussing metrics, processes, and data.

## How to Use This Glossary

- Browse by category below, or use GitHub search to find specific terms
- Each term includes: definition, usage examples, related terms, and data sources
- **Add new terms:** Create a pull request or submit an issue with the "glossary" label
- **Update definitions:** Team consensus required for changes to existing definitions

---

## 📊 Metrics & KPIs

### Conversion Rate
**Definition:** The percentage of [define what converts to what]  
**Calculation:** `(Number of conversions / Total opportunities) × 100`  
**Owner:** [Department/Person]  
**Data Source:** [System/Report]  
**Related Terms:** Throughput, Yield Rate

### [Add more metrics]

---

## 🏭 Manufacturing Terms

### Work Order (WO)
**Definition:** A document authorizing the manufacture or modification of a specific quantity of parts  
**Aliases:** Job, Manufacturing Order  
**System Field:** `wo_number` in ERP  
**Lifecycle:** Created → Released → In Progress → Completed → Closed  
**Related Terms:** Part Number, Operation, Routing

### Operation
**Definition:** A specific manufacturing step in the production process  
**Related Terms:** Work Center, Routing, Labor Hours

### [Add more manufacturing terms]

---

## 💰 Financial Terms

### Actual Cost
**Definition:** The real cost incurred for materials, labor, and overhead on a work order  
**Data Source:** `mfgwin.actual_costs` table  
**Related Terms:** Projected Cost, Variance

### Projected Cost
**Definition:** The estimated cost of a work order based on standards  
**Related Terms:** Standard Cost, Actual Cost

### Special Fees (BOE Billing)
**Definition:** Additional charges applied to Boeing (BOE609) manufacturing orders based on service costs or minimum lot sizes  
**Components:**
1. **Service Cost Fee:** Variable rate applied when work order has external service costs
2. **Minimum Lot Fee:** Fixed $175 charge for Stanchion parts shipped below batch quantity (typically < 3 units)  
**Data Source:** `usp_BOE_BILLING_MFG` stored procedure  
**Configuration:** `[sql-bi-1].LIVESupplemental.dbo.BOE_Billing_Charges` (rates), `BOE_Stanchion_Cargo_Bay` (thresholds)  
**Related Terms:** Service Cost, Batch Quantity, Stanchion Parts



| 1.) |  |  |  |
| :---- | :---- | :---- | :---- |
| REPORT | DESCRIPTION | CHARGE | @SPECIAL |
| usp\_BOE\_Billing\_605 | BOE602 & BOE605 | 109 | NULL |
| usp\_BOE\_Billing\_FINISH | FINISH 609 | 112.87 | NULL |
| usp\_BOE\_Billing\_MFG | MFG 609 NO 5 AXIS | 110.96 | 200 |
| usp\_BOE\_Billing\_ASSY | ASSY 609 | 70.52 | 200 |
| usp\_BOE\_Billing\_5AXIS | MFG 609 5 AXIS | 107.28 | 200 |
| usp\_BOE\_Billing\_614 | BOLTBOARDS | 60 | NULL |
| usp\_BOE\_BILLING\_TUKWILA | DO NOT USE | 75 | NULL |
| usp\_BOE\_BILLING\_HELENA | DO NOT USE | 75 | NULL |
| usp\_BOE\_BILLING\_EME | BOEEME | 109 | NULL |
|  |  |  |  |
|  |  | ^^^ |  |
|  |  |  |  |
| 2.)  |  |  |  |
|  |  |  |  |
|         , CASE |  |  |  |
|             WHEN WO.ACT\_SERVICE\_COST \> 0 THEN @SPECIAL (see table) |  |  |  |
|             ELSE 0 |  |  |  |
|         END \+ CASE |  |  |  |
|             WHEN TOTAL\_SHIPPED\_QTY \< \[Batch Qty\] AND CB.\[Description\] LIKE 'Stanchion%' THEN 175 |  |  |  |
|             ELSE 0 |  |  |  |
|         END AS \[SPECIAL FEES\] |  |  |  |
|  |  |  |  |



### [Add more financial terms]

---

## 🏢 Organizational Terms

### Department Codes
| Code | Name | Description |
|------|------|-------------|
| MFG | Manufacturing | Production operations |
| QC | Quality Control | Inspection and testing |
| SHP | Shipping | Outbound logistics |
| [Add more] | | |

### [Add more organizational terms]

---

## 🗃️ Data & System Terms

### ERP
**Definition:** Enterprise Resource Planning system (Visual Manufacturing)  
**Purpose:** Core business system for manufacturing, inventory, finance  
**Key Modules:** Manufacturing, Purchasing, Sales, Finance

### BOE
**Definition:** [Define what BOE stands for and its purpose]  
**Related Systems:** [List related systems]

### [Add more system terms]

---

## 📝 Document Abbreviations

| Abbreviation | Full Term | Context |
|--------------|-----------|---------|
| WO | Work Order | Manufacturing |
| PO | Purchase Order | Purchasing |
| SO | Sales Order | Sales |
| BOE | [Define] | [Context] |
| TPunch | Time Punch | Labor tracking |
| [Add more] | | |

---

## 🔄 Process Terms

### Expedite
**Definition:** Accelerated processing of an order to meet urgent delivery requirements  
**Reference:** See [Visual_Expedite_Quick_Reference.md](../Visual_Expedite_Quick_Reference.md)  
**Related Terms:** Rush Order, Priority

### [Add more process terms]

---

## Contributing to the Glossary

### Adding a New Term
```markdown
### Term Name
**Definition:** Clear, concise definition  
**Aliases:** Other names for this term  
**Formula/Calculation:** If applicable  
**Owner:** Department or person responsible  
**Data Source:** Where this data comes from  
**Example:** Sample usage  
**Related Terms:** Links to related concepts
```

### Proposing Changes
1. Create an issue with label "glossary"
2. Propose the change with rationale
3. Team discussion and consensus
4. Update approved by data steward

---

*This glossary is a living document. Last major update: November 2025*
