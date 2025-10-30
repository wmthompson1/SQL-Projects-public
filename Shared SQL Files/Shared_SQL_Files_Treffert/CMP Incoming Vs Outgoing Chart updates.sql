SELECT *
FROM LIVESUPPLEMENTAL.DBO.PLANNER_USER_ID_ReportSettings EX	
WHERE REPORT_NAME = 'CMP_incoming_vs_outgoing_daily_chart'

/*
insert into LIVESUPPLEMENTAL.DBO.PLANNER_USER_ID_ReportSettings values ('FIN-HOURLY', 'CMP Incoming V Outgoing Charts', 'ALL', 'FIN', 'tt 6/5/2020', '1')
insert into LIVESUPPLEMENTAL.DBO.PLANNER_USER_ID_ReportSettings values ('MFG-HOURLY', 'CMP Incoming V Outgoing Charts', 'ALL', 'MFG', 'tt 6/5/2020', '1')
insert into LIVESUPPLEMENTAL.DBO.PLANNER_USER_ID_ReportSettings values ('MFG-HOURLY-PLAN', 'CMP Incoming V Outgoing Charts', 'ALL', 'MFG', 'tt 6/5/2020', '1')

UPDATE LIVESUPPLEMENTAL.DBO.PLANNER_USER_ID_ReportSettings
SET PLANNER_USER_ID = 'HOLD'
WHERE PLANNER_USER_ID = 'FIN'
AND REPORT_NAME = 'CMP_incoming_vs_outgoing_daily_chart'

UPDATE LIVESUPPLEMENTAL.DBO.PLANNER_USER_ID_ReportSettings
SET REASONING = 'MFG'
WHERE PLANNER_USER_ID = 'MFG-HOURLY'
AND REPORT_NAME = 'CMP_incoming_vs_outgoing_daily_chart'

UPDATE LIVESUPPLEMENTAL.DBO.PLANNER_USER_ID_ReportSettings
SET REASONING = 'FIN'
WHERE PLANNER_USER_ID = 'HLD-HOURLY'
AND REPORT_NAME = 'CMP_incoming_vs_outgoing_daily_chart'

UPDATE LIVESUPPLEMENTAL.DBO.PLANNER_USER_ID_ReportSettings
SET PLANNER_USER_ID = 'HLD-HOURLY'
WHERE REASONING = 'FIN'
AND REPORT_NAME = 'CMP_incoming_vs_outgoing_daily_chart'


*/