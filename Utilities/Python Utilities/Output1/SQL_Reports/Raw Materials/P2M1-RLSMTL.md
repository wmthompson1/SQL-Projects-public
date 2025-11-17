# P2M1-RLSMTL

```sql
SELECT a.BASE_ID, a.LOT_ID, a.SPLIT_ID, a.SUB_ID, a.TYPE, a.PART_ID, a.WONUM, a.DESIRED_QTY, a.STATUS, 
a.CUSTOMER_ORDER, a.LINE_NO, a.CUSTOMER_ID, a.allocation_type, a.CurrentOperation, a.StatusCurrOp, 
a.PRINTED_DATE, a.DESIRED_RLS_DATE, a.CREATE_DATE, 
a.remaining_operations, 
case when remaining_operations like 'P2M1-SAW%' then 'SAW' 
    when  remaining_operations like 'P2M1-CNC%' then 'CNC' 
    when  remaining_operations like 'P2M1-SM-SHEAR%' or remaining_operations like 'P2M1-SM-TPUNCH%' then 'SHEAR'
    when  remaining_operations like 'P2M1-SM-PRESS%' then 'SHEAR'
    when  remaining_operations like 'P2M1-IN-DIM%' or remaining_operations like 'P2M1-SHIP%' then 'Outside Processing'
    when  remaining_operations like 'P2M1-SM-WTRJET%' or remaining_operations like 'P2M2-SM-WTRJET%' then 'WTRJET'
    when  remaining_operations like 'P2M1-DB-VIBRA%' or remaining_operations like 'P2M2-DB-VIBRA%' then 'VIBRA'
    when  remaining_operations like 'P2M1-MACH%' then 'MACH'
else remaining_operations end as 'NEXT_OP',
a.QTY_ON_HAND, a.QTY_IN_DEMAND, 
a.BUYER_USER_ID, a.PLANNER_USER_ID, a.COMMODITY_CODE, a.DESCRIPTION, a.DESIRED_WANT_DATE, a.[EXP/FLT], a.user_10, 
a.col_user_1, a.RWPart, a.CUSTOMER_PO_REF, a.WORK_ORDER_NOTES, a.CUST_ORDER_NOTATION, CUST_ORD_CREATEDATE, 
a.PartMaterialType, a.MaterialType, a.Alloy, a.CO_AMOUNT, a.UNIT_PRICE, a.TOTAL_AMT_SHIPPED, a.COL_AMOUNT, 
a.RESOURCE_ID_Raw, a.OPERATION_TYPE, a.StatusCurrOpType, a.CURROPCHK, a.RESOURCE_ID, a.AubPriText, a.AubTcText, 
a.HasAubPri, a.HasAubTc, a.TimeLimit, a.LAST_CLOCK_OUT, a.last_worked_seq, a.last_clocked, a.LATE, a.LATEP2, 
a.LATEP1, a.LATEP3, a.LATEBP1, a.WAIT_DAYS, a.EMPLOYEE_ID, a.USER_1, 
iif(a.LEAD_SUPERVISOR = 'AP1-Eric Diaz', 'AP1-Greg Berntsen', a.LEAD_SUPERVISOR) as 'LEAD_SUPERVISOR', 
iif(a.SupervisorName = 'Eric Diaz', 'Greg Berntsen', a.SupervisorName) as 'SupervisorName', 
a.StatusCurrOpMsg, a.tdesc, a.DEPARTMENT, a.PROCESS, a.REPORT_GROUPING, a.RM_READY
FROM WODS_Output_Complement a WITH (NOLOCK)
where a.RESOURCE_ID = 'P2M1-RLSMTL' and remaining_operations != 'P2M1-KIT-FG' AND a.STATUS = 'R'
ORDER BY a.[EXP/FLT] DESC, a.DESIRED_RLS_DATE ASC

```