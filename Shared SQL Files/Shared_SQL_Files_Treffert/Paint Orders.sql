SELECT
	CASE 
		when A.[DESCRIPTION] like '715 Bldg & Improvements%' THEN '715 Bldg & Improvements'
		when A.[DESCRIPTION] like 'Accrued Liabilities%' THEN 'Accrued Liabilities'
		when A.[DESCRIPTION] like 'Analysis%' THEN 'Analysis'
		when A.[DESCRIPTION] like 'Auburn South Building Improvements%' THEN 'Auburn South Building Improvements'
		when A.[DESCRIPTION] like 'Bldg & Improvements%' THEN 'Bldg & Improvements'
		when A.[DESCRIPTION] like 'Boeing Non%' THEN 'Boeing NonContract'
		when A.[DESCRIPTION] like 'Building R&M%' THEN 'Building R&M'
		when A.[DESCRIPTION] like 'Calibration and Repair%' THEN 'Calibration and Repair'
		when A.[DESCRIPTION] like 'Calibration%' THEN 'Calibration'
		when A.[DESCRIPTION] like 'Chemical Waste Disposal%' THEN 'Chemical Waste Disposal'
		when A.[DESCRIPTION] like 'Chemicals%' THEN 'Chemicals'
		when A.[DESCRIPTION] like 'Computer Maintance%' THEN 'Computer Maintance'
		when A.[DESCRIPTION] like 'Computer Replacement%' THEN 'Computer Replacement'
		when A.[DESCRIPTION] like 'Employee Purchases%' THEN 'Employee Purchases'
		when A.[DESCRIPTION] like 'Equipment R%' THEN 'Equipment R&M'
		when A.[DESCRIPTION] like 'Equipment%' THEN 'Equipment'
		when A.[DESCRIPTION] like 'Freight%' THEN 'Freight'
		when A.[DESCRIPTION] like 'Fundraising Events%' THEN 'Fundraising Events'
		when A.[DESCRIPTION] like 'H & W%' THEN 'H & W'
		when A.[DESCRIPTION] like 'H&w%' THEN 'H & W'
		when A.[DESCRIPTION] like 'High School Program%' THEN 'High School Program'
		when A.[DESCRIPTION] like 'Indirect Labor%' THEN 'Indirect Labor'
		when A.[DESCRIPTION] like 'Janitorial Supplies%' THEN 'Janitorial Supplies'
		when A.[DESCRIPTION] like 'Job Cost%' THEN 'Job Cost'
		when A.[DESCRIPTION] like 'Marketing%' THEN 'Marketing'
		when A.[DESCRIPTION] like 'Material%' THEN 'Material'
		when A.[DESCRIPTION] like 'Mfg and Ballard Finish%' THEN 'Mfg and Ballard Finish'
		when A.[DESCRIPTION] like 'Misc Expense%' THEN 'Misc Expense'
		when A.[DESCRIPTION] like 'Non Boeing Auburn North Mfg%' THEN 'Non Boeing Auburn North Mfg'
		when A.[DESCRIPTION] like 'NonBoeing%' THEN 'NonBoeing'
		when A.[DESCRIPTION] like 'Office Supplies & Postage%' THEN 'Office Supplies & Postage'
		when A.[DESCRIPTION] like 'Outreach%' THEN 'Outreach'
		when A.[DESCRIPTION] like 'Paint%' THEN 'Paint'
		when A.[DESCRIPTION] like 'Payroll Advances Clearing%' THEN 'Payroll Advances Clearing'
		when A.[DESCRIPTION] like 'Permits/Taxes/ Fees%' THEN 'Permits/Taxes/ Fees'
		when A.[DESCRIPTION] like 'Prepaid Expenses%' THEN 'Prepaid Expenses'
		when A.[DESCRIPTION] like 'Prepaid Maintance Contracts%' THEN 'Prepaid Maintance Contracts'
		when A.[DESCRIPTION] like 'Projects in Progress%' THEN 'Projects in Progress'
		when A.[DESCRIPTION] like 'Purchased Material accrual%' THEN 'Purchased Material accrual'
		when A.[DESCRIPTION] like 'Rental Expense%' THEN 'Rental Expense'
		when A.[DESCRIPTION] like 'Shop Supplies%' THEN 'Shop Supplies'
		when A.[DESCRIPTION] like 'Skills Promotions and Advertising%' THEN 'Skills Promotions and Advertising'
		when A.[DESCRIPTION] like 'Small Tools%' THEN 'Small Tools'
		when A.[DESCRIPTION] like 'Third Party Audits%' THEN 'Third Party Audits'
		when A.[DESCRIPTION] like 'Training & Education%' THEN 'Training & Education'
		when A.[DESCRIPTION] like 'Training and Education%' THEN 'Training & Education'
		when A.[DESCRIPTION] like 'Truck Expense%' THEN 'Truck Expense'
		when A.[DESCRIPTION] like 'Utilities%' THEN 'Utilities'
		when A.[DESCRIPTION] like 'Vehicles%' THEN 'Vehicles'
		ELSE A.[DESCRIPTION] 
	END AS Expense,
	CASE 
		when A.[DESCRIPTION] like '%825 Building' THEN '825 Building'
		when A.[DESCRIPTION] like '%AIP' THEN 'AIP'
		when A.[DESCRIPTION] like '%AIP ' THEN 'AIP'
		when A.[DESCRIPTION] like '%Admin' THEN 'Admin'
		when A.[DESCRIPTION] like '%Arlington' THEN 'Arlington'
		when A.[DESCRIPTION] like '%Aub Finish' THEN 'Auburn North'
		when A.[DESCRIPTION] like '%Auburn North Mfg' THEN 'Auburn North Mfg'
		when A.[DESCRIPTION] like '%Ballard Finish' THEN 'Ballard'
		when A.[DESCRIPTION] like '%Ballard Mfg' THEN 'Ballard Mfg'
		when A.[DESCRIPTION] like '%Ballard' THEN 'Ballard'
		when A.[DESCRIPTION] like '%Finish All' THEN 'Finish'
		when A.[DESCRIPTION] like '%Finish' THEN 'Finish'
		when A.[DESCRIPTION] like '%Indirect Auburn North Mfg' THEN 'Indirect Auburn North Mfg'
		when A.[DESCRIPTION] like '%Mfg All' THEN 'MFG'
		when A.[DESCRIPTION] like '%NB MFG' THEN 'NB MFG'
		when A.[DESCRIPTION] like '%Non-Boeing' THEN 'Non-Boeing'
		when A.[DESCRIPTION] like '%Other' THEN 'Other'
		when A.[DESCRIPTION] like '%Outreach' THEN 'Outreach'
		when A.[DESCRIPTION] like '%QA' THEN 'QA'
		when A.[DESCRIPTION] like '%STS' THEN 'STS'
		when A.[DESCRIPTION] like '%Slliks' THEN 'Slliks'
		when A.[DESCRIPTION] like '%South 50/50/0' THEN 'South 50/50/0'
		when A.[DESCRIPTION] like '%South' THEN 'South'
		when A.[DESCRIPTION] like '%Vocational Services' THEN 'Vocational Services'
		when A.[DESCRIPTION] like '%Manufacturing' THEN 'MFG'
		when A.[DESCRIPTION] like '%MFG' THEN 'MFG'
		when A.[DESCRIPTION] like '%All' THEN 'All'
		else A.[DESCRIPTION]
	END as Facility,
	P.ID AS [ID], 
	PO.VENDOR_ID AS [VENDOR_ID], 
	P.[DESCRIPTION] AS [PartDesc], 
	P.STOCK_UM AS [STOCK_UM], 
	RL.RECEIVER_ID AS [RECEIVER_ID], 
	R.RECEIVED_DATE AS [RECEIVED_DATE], 
	POL.PURC_ORDER_ID AS [PURC_ORDER_ID], 
	PO.ORDER_DATE AS [ORDER_DATE], 
	POL.LINE_NO AS [LINE_NO], 
	POL.ORDER_QTY AS [ORDER_QTY], 
	POL.PURCHASE_UM AS [PURCHASE_UM], 
	RL.RECEIVED_QTY AS [RECEIVED_QTY], 
	POL.UNIT_PRICE AS [UNIT_PRICE], 
	POL.TOTAL_AMT_ORDERED AS [TOTAL_AMT_ORDERED], 
	POL.TOTAL_AMT_RECVD AS [TOTAL_AMT_RECVD], 
	P.COMMODITY_CODE AS [COMMODITY_CODE], 
	POL.GL_EXPENSE_ACCT_ID AS [GL_EXPENSE_ACCT_ID], 
	A.[DESCRIPTION] AS [GLDesc], 
	POL.USER_1 AS [USER_1], 
	POL.USER_2 AS [USER_2 (Tax)], 
	POLB.specs AS [PO line_specs], 
	POB.specs AS [PO specs]
FROM
	RECEIVER R
INNER JOIN 
	RECEIVER_LINE RL 
	ON R.ID = RL.RECEIVER_ID
INNER JOIN 
	PURC_ORDER_LINE POL 
	ON RL.PURC_ORDER_ID=POL.PURC_ORDER_ID
	AND RL.PURC_ORDER_LINE_NO=POL.LINE_NO
INNER JOIN 
	PURCHASE_ORDER PO 
	ON POL.PURC_ORDER_ID=PO.ID
LEFT OUTER JOIN 
	PART P 
	ON POL.PART_ID=P.ID
INNER JOIN 
	ACCOUNT A 
	ON POL.GL_EXPENSE_ACCT_ID=A.ID
LEFT OUTER JOIN 
	SKILL_PO_LINE_BINARY POLB 
	ON POL.PURC_ORDER_ID=POLB.PURC_ORDER_ID
	AND POL.LINE_NO=POLB.PURC_ORDER_LINE_NO
LEFT OUTER JOIN 
	SKILL_PURCHASE_ORDER_BINARY POB 
	ON PO.ID=POB.PURC_ORDER_ID
WHERE  
	(R.RECEIVED_DATE >= '1/1/2016' AND R.RECEIVED_DATE < '1/1/2017')
	and CASE 
		when A.[DESCRIPTION] like '715 Bldg & Improvements%' THEN '715 Bldg & Improvements'
		when A.[DESCRIPTION] like 'Accrued Liabilities%' THEN 'Accrued Liabilities'
		when A.[DESCRIPTION] like 'Analysis%' THEN 'Analysis'
		when A.[DESCRIPTION] like 'Auburn South Building Improvements%' THEN 'Auburn South Building Improvements'
		when A.[DESCRIPTION] like 'Bldg & Improvements%' THEN 'Bldg & Improvements'
		when A.[DESCRIPTION] like 'Boeing Non%' THEN 'Boeing NonContract'
		when A.[DESCRIPTION] like 'Building R&M%' THEN 'Building R&M'
		when A.[DESCRIPTION] like 'Calibration and Repair%' THEN 'Calibration and Repair'
		when A.[DESCRIPTION] like 'Calibration%' THEN 'Calibration'
		when A.[DESCRIPTION] like 'Chemical Waste Disposal%' THEN 'Chemical Waste Disposal'
		when A.[DESCRIPTION] like 'Chemicals%' THEN 'Chemicals'
		when A.[DESCRIPTION] like 'Computer Maintance%' THEN 'Computer Maintance'
		when A.[DESCRIPTION] like 'Computer Replacement%' THEN 'Computer Replacement'
		when A.[DESCRIPTION] like 'Employee Purchases%' THEN 'Employee Purchases'
		when A.[DESCRIPTION] like 'Equipment R%' THEN 'Equipment R&M'
		when A.[DESCRIPTION] like 'Equipment%' THEN 'Equipment'
		when A.[DESCRIPTION] like 'Freight%' THEN 'Freight'
		when A.[DESCRIPTION] like 'Fundraising Events%' THEN 'Fundraising Events'
		when A.[DESCRIPTION] like 'H & W%' THEN 'H & W'
		when A.[DESCRIPTION] like 'H&w%' THEN 'H & W'
		when A.[DESCRIPTION] like 'High School Program%' THEN 'High School Program'
		when A.[DESCRIPTION] like 'Indirect Labor%' THEN 'Indirect Labor'
		when A.[DESCRIPTION] like 'Janitorial Supplies%' THEN 'Janitorial Supplies'
		when A.[DESCRIPTION] like 'Job Cost%' THEN 'Job Cost'
		when A.[DESCRIPTION] like 'Marketing%' THEN 'Marketing'
		when A.[DESCRIPTION] like 'Material%' THEN 'Material'
		when A.[DESCRIPTION] like 'Mfg and Ballard Finish%' THEN 'Mfg and Ballard Finish'
		when A.[DESCRIPTION] like 'Misc Expense%' THEN 'Misc Expense'
		when A.[DESCRIPTION] like 'Non Boeing Auburn North Mfg%' THEN 'Non Boeing Auburn North Mfg'
		when A.[DESCRIPTION] like 'NonBoeing%' THEN 'NonBoeing'
		when A.[DESCRIPTION] like 'Office Supplies & Postage%' THEN 'Office Supplies & Postage'
		when A.[DESCRIPTION] like 'Outreach%' THEN 'Outreach'
		when A.[DESCRIPTION] like 'Paint%' THEN 'Paint'
		when A.[DESCRIPTION] like 'Payroll Advances Clearing%' THEN 'Payroll Advances Clearing'
		when A.[DESCRIPTION] like 'Permits/Taxes/ Fees%' THEN 'Permits/Taxes/ Fees'
		when A.[DESCRIPTION] like 'Prepaid Expenses%' THEN 'Prepaid Expenses'
		when A.[DESCRIPTION] like 'Prepaid Maintance Contracts%' THEN 'Prepaid Maintance Contracts'
		when A.[DESCRIPTION] like 'Projects in Progress%' THEN 'Projects in Progress'
		when A.[DESCRIPTION] like 'Purchased Material accrual%' THEN 'Purchased Material accrual'
		when A.[DESCRIPTION] like 'Rental Expense%' THEN 'Rental Expense'
		when A.[DESCRIPTION] like 'Shop Supplies%' THEN 'Shop Supplies'
		when A.[DESCRIPTION] like 'Skills Promotions and Advertising%' THEN 'Skills Promotions and Advertising'
		when A.[DESCRIPTION] like 'Small Tools%' THEN 'Small Tools'
		when A.[DESCRIPTION] like 'Third Party Audits%' THEN 'Third Party Audits'
		when A.[DESCRIPTION] like 'Training & Education%' THEN 'Training & Education'
		when A.[DESCRIPTION] like 'Training and Education%' THEN 'Training & Education'
		when A.[DESCRIPTION] like 'Truck Expense%' THEN 'Truck Expense'
		when A.[DESCRIPTION] like 'Utilities%' THEN 'Utilities'
		when A.[DESCRIPTION] like 'Vehicles%' THEN 'Vehicles'
		ELSE A.[DESCRIPTION] 
	END in ('Chemicals', 'Paint')
	and CASE 
		when A.[DESCRIPTION] like '%825 Building' THEN '825 Building'
		when A.[DESCRIPTION] like '%AIP' THEN 'AIP'
		when A.[DESCRIPTION] like '%AIP ' THEN 'AIP'
		when A.[DESCRIPTION] like '%Admin' THEN 'Admin'
		when A.[DESCRIPTION] like '%Arlington' THEN 'Arlington'
		when A.[DESCRIPTION] like '%Aub Finish' THEN 'Auburn North'
		when A.[DESCRIPTION] like '%Auburn North Mfg' THEN 'Auburn North Mfg'
		when A.[DESCRIPTION] like '%Ballard Finish' THEN 'Ballard'
		when A.[DESCRIPTION] like '%Ballard Mfg' THEN 'Ballard Mfg'
		when A.[DESCRIPTION] like '%Ballard' THEN 'Ballard'
		when A.[DESCRIPTION] like '%Finish All' THEN 'Finish'
		when A.[DESCRIPTION] like '%Finish' THEN 'Finish'
		when A.[DESCRIPTION] like '%Indirect Auburn North Mfg' THEN 'Indirect Auburn North Mfg'
		when A.[DESCRIPTION] like '%Mfg All' THEN 'MFG'
		when A.[DESCRIPTION] like '%NB MFG' THEN 'NB MFG'
		when A.[DESCRIPTION] like '%Non-Boeing' THEN 'Non-Boeing'
		when A.[DESCRIPTION] like '%Other' THEN 'Other'
		when A.[DESCRIPTION] like '%Outreach' THEN 'Outreach'
		when A.[DESCRIPTION] like '%QA' THEN 'QA'
		when A.[DESCRIPTION] like '%STS' THEN 'STS'
		when A.[DESCRIPTION] like '%Slliks' THEN 'Slliks'
		when A.[DESCRIPTION] like '%South 50/50/0' THEN 'South 50/50/0'
		when A.[DESCRIPTION] like '%South' THEN 'South'
		when A.[DESCRIPTION] like '%Vocational Services' THEN 'Vocational Services'
		when A.[DESCRIPTION] like '%Manufacturing' THEN 'MFG'
		when A.[DESCRIPTION] like '%MFG' THEN 'MFG'
		when A.[DESCRIPTION] like '%All' THEN 'All'
		else A.[DESCRIPTION]
	END in ('Ballard', 'Auburn North')
ORDER BY 
	POL.PURC_ORDER_ID, 
	POL.LINE_NO