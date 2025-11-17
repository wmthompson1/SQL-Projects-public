# Planners Morning Check

```sql
USE DataWarehouse
GO

; WITH CTE_PLANNERS AS
(SELECT P.*, EE.[ACTIVE]
FROM LIVESupplemental.dbo.PlannersList AS P
INNER JOIN EMPLOYEE EE
--LEFT OUTER JOIN EMPLOYEE EE
	ON P.EMPID = EE.ID
	AND EE.[ACTIVE] = 'Y'
)

, CTE_WO AS
(SELECT WO.BASE_ID
	, WO.SPLIT_ID
	, WO.CREATE_DATE
	, WO.ENGINEERED_BY
FROM WORK_ORDER AS WO
WHERE WO.[TYPE] = 'W'
	AND WO.SUB_ID = '0'
	AND WO.CREATE_DATE >= GETDATE() - 7
	AND WO.[STATUS] = 'R'
)
, CTE_BASE AS
(SELECT CASE
		WHEN SUBSTRING(WO.ENGINEERED_BY, CHARINDEX(P.FILTER_STRING, WO.ENGINEERED_BY), LEN(P.FILTER_STRING)) 
			= P.FILTER_STRING THEN P.[LOCATION]
		WHEN SUBSTRING(WO.ENGINEERED_BY, CHARINDEX(P2.FILTER_STRING, WO.ENGINEERED_BY), LEN(P2.FILTER_STRING)) 
			= P2.FILTER_STRING THEN P2.[LOCATION]
		WHEN SUBSTRING(WO.ENGINEERED_BY, CHARINDEX(P3.FILTER_STRING, WO.ENGINEERED_BY), LEN(P3.FILTER_STRING)) 
			= P3.FILTER_STRING THEN P3.[LOCATION]
		WHEN SUBSTRING(WO.ENGINEERED_BY, CHARINDEX(P4.FILTER_STRING, WO.ENGINEERED_BY), LEN(P4.FILTER_STRING)) 
			= P4.FILTER_STRING THEN P4.[LOCATION]
		WHEN SUBSTRING(WO.ENGINEERED_BY, CHARINDEX(P5.FILTER_STRING, WO.ENGINEERED_BY), LEN(P5.FILTER_STRING)) 
			= P5.FILTER_STRING THEN P5.[LOCATION]
		WHEN SUBSTRING(WO.ENGINEERED_BY, CHARINDEX(P6.FILTER_STRING, WO.ENGINEERED_BY), LEN(P6.FILTER_STRING)) 
			= P6.FILTER_STRING THEN P6.[LOCATION]
		ELSE '_BLANK'
	END AS LOCATION
	, COALESCE(P.LINE_OF_BUSINESS, P2.LINE_OF_BUSINESS, P3.LINE_OF_BUSINESS, P4.LINE_OF_BUSINESS, P5.LINE_OF_BUSINESS, P6.LINE_OF_BUSINESS, '_BLANK') AS LINE_OF_BUSINESS
	, CASE
		WHEN SUBSTRING(WO.ENGINEERED_BY, CHARINDEX(P.FILTER_STRING, WO.ENGINEERED_BY), LEN(P.FILTER_STRING)) = P.FILTER_STRING 
				THEN P.[NAME]
		WHEN SUBSTRING(WO.ENGINEERED_BY, CHARINDEX(P2.FILTER_STRING, WO.ENGINEERED_BY), LEN(P2.FILTER_STRING)) = P2.FILTER_STRING 
			THEN P2.[NAME]
		WHEN SUBSTRING(WO.ENGINEERED_BY, CHARINDEX(P3.FILTER_STRING, WO.ENGINEERED_BY), LEN(P3.FILTER_STRING)) = P3.FILTER_STRING 
			THEN P3.[NAME]
		WHEN SUBSTRING(WO.ENGINEERED_BY, CHARINDEX(P4.FILTER_STRING, WO.ENGINEERED_BY), LEN(P4.FILTER_STRING)) = P4.FILTER_STRING 
			THEN P4.[NAME]
		WHEN SUBSTRING(WO.ENGINEERED_BY, CHARINDEX(P5.FILTER_STRING, WO.ENGINEERED_BY), LEN(P5.FILTER_STRING)) = P5.FILTER_STRING 
			THEN P5.[NAME]
		WHEN SUBSTRING(WO.ENGINEERED_BY, CHARINDEX(P6.FILTER_STRING, WO.ENGINEERED_BY), LEN(P6.FILTER_STRING)) = P6.FILTER_STRING 
			THEN P6.[NAME]
		ELSE '_BLANK'
	END AS [NAME]
	, WO.BASE_ID
	, WO.SPLIT_ID
	, WO.CREATE_DATE
	, WO.ENGINEERED_BY
	, COALESCE(P.[ACTIVE], P2.[ACTIVE], P3.[ACTIVE], P4.[ACTIVE], P5.[ACTIVE], P6.[ACTIVE], 'N') AS [ACTIVE]
FROM CTE_WO AS WO
LEFT OUTER JOIN CTE_PLANNERS AS P
	ON RIGHT(WO.ENGINEERED_BY, 4) = P.FILTER_STRING
LEFT OUTER JOIN CTE_PLANNERS AS P2
	ON RIGHT(WO.ENGINEERED_BY, 3) = P2.FILTER_STRING
LEFT OUTER JOIN CTE_PLANNERS AS P3
	ON RIGHT(WO.ENGINEERED_BY, 2) = P3.FILTER_STRING
LEFT OUTER JOIN CTE_PLANNERS AS P4
	ON LEFT(WO.ENGINEERED_BY, 4) = P4.FILTER_STRING
LEFT OUTER JOIN CTE_PLANNERS AS P5
	ON LEFT(WO.ENGINEERED_BY, 3) = P5.FILTER_STRING
LEFT OUTER JOIN CTE_PLANNERS AS P6
	ON LEFT(WO.ENGINEERED_BY, 2) = P6.FILTER_STRING
WHERE (P.FILTER_STRING IS NULL
	AND P2.FILTER_STRING IS NULL
	AND P3.FILTER_STRING IS NULL
	AND P4.FILTER_STRING IS NULL
	AND P5.FILTER_STRING IS NULL
	AND P6.FILTER_STRING IS NULL)
	OR
	(ISNULL(P.[ACTIVE], 'N') = 'N'
	AND ISNULL(P2.[ACTIVE], 'N') = 'N'
	AND ISNULL(P3.[ACTIVE], 'N') = 'N'
	AND ISNULL(P4.[ACTIVE], 'N') = 'N'
	AND ISNULL(P5.[ACTIVE], 'N') = 'N'
	AND ISNULL(P6.[ACTIVE], 'N') = 'N'
	)

)

SELECT BASE_ID
, CREATE_DATE
, ENGINEERED_BY
, [ACTIVE]
FROM CTE_BASE
ORDER BY RTRIM(REPLACE(ENGINEERED_BY, '/', ''))

/*
SELECT *
FROM LIVESupplemental.dbo.PlannersList AS P

select * from employee where last_name = 'forrest'

SELECT EE.[ACTIVE], P.*
FROM LIVESupplemental.dbo.PlannersList AS P
left outer join live.dbo.EMPLOYEE EE
ON P.EMPID = EE.ID
--WHERE EE.[ACTIVE] = 'N'
--AND LINE_OF_BUSINESS != 'No Longer Here'
ORDER BY [NAME]

--UPDATE LIVESupplemental.dbo.PlannersList
--SET FILTER_STRING = 'DOND'
--WHERE EMPID = '457' AND FILTER_STRING = 'DonD'--IN (SELECT EMPID FROM #T1 GROUP BY EMPID)

DROP TABLE #T1

SELECT BASE_ID INTO #T1 FROM WORK_ORDER WHERE ENGINEERED_BY IN ('JALEXANDE', 'JALEXANDER')

--UPDATE WORK_ORDER 
--SET ENGINEERED_BY = 'JCA'
--WHERE BASE_ID IN (SELECT BASE_ID FROM #T1 GROUP BY BASE_ID)

INSERT INTO LIVESupplemental.dbo.PlannersList VALUES ('ACT','P2','4118','Ash Thornton','MFG','N','Shannen Helle')
INSERT INTO LIVESupplemental.dbo.PlannersList VALUES ('AD','NA','1492','Ashley Dooley','No Longer Here','N','NULL')
INSERT INTO LIVESupplemental.dbo.PlannersList VALUES ('AJH','Auburn','1889','Amy Hensel','No Longer Here','N','Jeff Thiessen')
INSERT INTO LIVESupplemental.dbo.PlannersList VALUES ('AJV','Auburn','3329','Alexander Vicente','No Longer Here','N','NULL')
INSERT INTO LIVESupplemental.dbo.PlannersList VALUES ('AMS','Auburn','3716','Austin Spangrud','No Longer Here','N','Shannen Helle')
INSERT INTO LIVESupplemental.dbo.PlannersList VALUES ('AWC','NA','1613','Anne Clark','No Longer Here','N','NULL')
INSERT INTO LIVESupplemental.dbo.PlannersList VALUES ('BDB','Auburn','2452','Brittney Brady','No Longer Here','N','Jeff Thiessen')
INSERT INTO LIVESupplemental.dbo.PlannersList VALUES ('BDD','NA','1546','Dillon Doyle','No Longer Here','N','NULL')
INSERT INTO LIVESupplemental.dbo.PlannersList VALUES ('BM','NA','1533','Bryan Meldahl','No Longer Here','N','NULL')
INSERT INTO LIVESupplemental.dbo.PlannersList VALUES ('BNM','Auburn','3533','Breanne Mimms','No Longer Here','N','Shannen Helle')
INSERT INTO LIVESupplemental.dbo.PlannersList VALUES ('BP','Auburn','1243','Betty Prentice','No Longer Here','N','Jeff Thiessen')
INSERT INTO LIVESupplemental.dbo.PlannersList VALUES ('CAM','Auburn','3235','Chuck Marlow','No Longer Here','N','NULL')
INSERT INTO LIVESupplemental.dbo.PlannersList VALUES ('CB','P2','2166','Cathie Berntsen','MFG','N','Shannen Helle')
INSERT INTO LIVESupplemental.dbo.PlannersList VALUES ('CET','P2','3216','Charles Tiffany','MFG','N','Shannen Helle')
INSERT INTO LIVESupplemental.dbo.PlannersList VALUES ('CET','Auburn','3235','Chuck Marlow','No Longer Here','N','NULL')
INSERT INTO LIVESupplemental.dbo.PlannersList VALUES ('CK','Auburn','2008','Charleen Kolkow','No Longer Here','N','Jeff Thiessen')
INSERT INTO LIVESupplemental.dbo.PlannersList VALUES ('CKE','P2','3438','Christen Erickson','MFG','N','Shannen Helle')
INSERT INTO LIVESupplemental.dbo.PlannersList VALUES ('CLH','Ballard','505','CL Hawk','No Longer Here','N','Jeff Thiessen')
INSERT INTO LIVESupplemental.dbo.PlannersList VALUES ('CM','Auburn','1238','Cindy Mills','No Longer Here','N','NULL')
INSERT INTO LIVESupplemental.dbo.PlannersList VALUES ('CM','NA','1238','Cindy Mills','No Longer Here','N','NULL')
INSERT INTO LIVESupplemental.dbo.PlannersList VALUES ('CMB','P2','2166','Cathie Berntsen','MFG','N','Shannen Helle')
INSERT INTO LIVESupplemental.dbo.PlannersList VALUES ('CMK','Auburn','2008','Charleen Kolkow','No Longer Here','N','Jeff Thiessen')
INSERT INTO LIVESupplemental.dbo.PlannersList VALUES ('CMO','P1','4109','Cathy Olson','FIN','N','Shannen Helle')
INSERT INTO LIVESupplemental.dbo.PlannersList VALUES ('CN','Auburn','2561','Celena Nelson','No Longer Here','N','NULL')
INSERT INTO LIVESupplemental.dbo.PlannersList VALUES ('CRP','Auburn','2805','Cianna Petri','No Longer Here','N','Shannen Helle')
INSERT INTO LIVESupplemental.dbo.PlannersList VALUES ('DB','Auburn','2372','Devon Burns','No Longer Here','N','Jeff Thiessen')
INSERT INTO LIVESupplemental.dbo.PlannersList VALUES ('DD','P1','457','Don Davis','Quality','N','Shannen Helle')
INSERT INTO LIVESupplemental.dbo.PlannersList VALUES ('DM','BALLARD','1025','Dmitriy Mandelman','Outreach','N','Shannen Helle')
INSERT INTO LIVESupplemental.dbo.PlannersList VALUES ('DMT','P2','2080','Diane Tremain','MFG','N','Shannen Helle')
INSERT INTO LIVESupplemental.dbo.PlannersList VALUES ('DOND','P1','457','Don Davis','Quality','N','Shannen Helle')
INSERT INTO LIVESupplemental.dbo.PlannersList VALUES ('FEO','Auburn','1782','Fred Odom','No Longer Here','N','Shannen Helle')
INSERT INTO LIVESupplemental.dbo.PlannersList VALUES ('GAB','P1','1957','Greg Berntsen','FIN','N','Monica Dooley')
INSERT INTO LIVESupplemental.dbo.PlannersList VALUES ('GG','Auburn','902','Gail Gilbertson','No Longer Here','N','Jeff Thiessen')
INSERT INTO LIVESupplemental.dbo.PlannersList VALUES ('GWR','Auburn','1279','Gregg Rodehaver','No Longer Here','N','NULL')
INSERT INTO LIVESupplemental.dbo.PlannersList VALUES ('JAT','Auburn','1287','Jeff Thiessen','No Longer Here','N','Jeff Thiessen')
INSERT INTO LIVESupplemental.dbo.PlannersList VALUES ('JCA','P2','103','Jeff Alexander','MFG','N','Shannen Helle')
INSERT INTO LIVESupplemental.dbo.PlannersList VALUES ('JCM','NA','1671','Jessica Myers','No Longer Here','N','NULL')
INSERT INTO LIVESupplemental.dbo.PlannersList VALUES ('JES','Auburn','2136','Jessica Simmons','No Longer Here','N','Shannen Helle')
INSERT INTO LIVESupplemental.dbo.PlannersList VALUES ('JF','Ballard','2187','Janice Fox','No Longer Here','N','NULL')
INSERT INTO LIVESupplemental.dbo.PlannersList VALUES ('JHP','Auburn','1885','Jose Portillo','No Longer Here','N','Shannen Helle')
INSERT INTO LIVESupplemental.dbo.PlannersList VALUES ('JJR','Auburn','3639','Jacquelin Roselli','No Longer Here','N','Shannen Helle')
INSERT INTO LIVESupplemental.dbo.PlannersList VALUES ('JMD','P1','2216','Janice Duranleau','FIN','N','Shannen Helle')
INSERT INTO LIVESupplemental.dbo.PlannersList VALUES ('JS','Auburn','2559','Jerry Scheffer','No Longer Here','N','Shannen Helle')
INSERT INTO LIVESupplemental.dbo.PlannersList VALUES ('JT','Auburn','1287','Jeff Thiessen','No Longer Here','N','Jeff Thiessen')
INSERT INTO LIVESupplemental.dbo.PlannersList VALUES ('JTC','Auburn','2802','Jeremy Cook','No Longer Here','N','Jeff Thiessen')
INSERT INTO LIVESupplemental.dbo.PlannersList VALUES ('JWS','Auburn','2559','Jerry Scheffer','No Longer Here','N','Shannen Helle')
INSERT INTO LIVESupplemental.dbo.PlannersList VALUES ('KAP','P2','3905','Kari Post','No Longer Here','N','Shannen Helle')
INSERT INTO LIVESupplemental.dbo.PlannersList VALUES ('KAW','Auburn','2083','Keith Wooldridge','FIN','N','Shannen Helle')
INSERT INTO LIVESupplemental.dbo.PlannersList VALUES ('KDN','Auburn','3369','Kellie Nicholson','No Longer Here','N','Jeff Thiessen')
INSERT INTO LIVESupplemental.dbo.PlannersList VALUES ('KEL','P1','2777','Katie E. Linstead','FIN','N','Shannen Helle')
INSERT INTO LIVESupplemental.dbo.PlannersList VALUES ('KFW','Auburn','2270','Kristiana Strickland Wade','No Longer Here','N','Shannen Helle')
INSERT INTO LIVESupplemental.dbo.PlannersList VALUES ('KFW','Auburn','3444','Arthur Ladia','No Longer Here','N','Shannen Helle')
INSERT INTO LIVESupplemental.dbo.PlannersList VALUES ('KN','Auburn','1719','Kellie Nicholson','No Longer Here','N','Jeff Thiessen')
INSERT INTO LIVESupplemental.dbo.PlannersList VALUES ('KNB','Auburn','3385','Kim Blakely','No Longer Here','N','Shannen Helle')
INSERT INTO LIVESupplemental.dbo.PlannersList VALUES ('KND','Ballard','3179','Kim Drayden','No Longer Here','N','Jeff Thiessen')
INSERT INTO LIVESupplemental.dbo.PlannersList VALUES ('KNT','P1','2727','Kristopher Truong','FIN','N','Shannen Helle')
INSERT INTO LIVESupplemental.dbo.PlannersList VALUES ('KR','NA','1822','Keith Robinson','No Longer Here','N','NULL')
INSERT INTO LIVESupplemental.dbo.PlannersList VALUES ('KRK','P2','3748','Keryn Knight','MFG','N','Shannen Helle')
INSERT INTO LIVESupplemental.dbo.PlannersList VALUES ('KRP','P2','3748','Keryn Phillip','MFG','N','Shannen Helle')
INSERT INTO LIVESupplemental.dbo.PlannersList VALUES ('KW','Auburn','2083','Keith Wooldridge','FIN','N','Shannen Helle')
INSERT INTO LIVESupplemental.dbo.PlannersList VALUES ('LD','Auburn','1893','Liny Dannis','No Longer Here','N','Jeff Thiessen')
INSERT INTO LIVESupplemental.dbo.PlannersList VALUES ('LDW','Ballard','2413','Lonny Wright','No Longer Here','N','Jeff Thiessen')
INSERT INTO LIVESupplemental.dbo.PlannersList VALUES ('LE','Auburn','2776','Linda Ezra','No Longer Here','N','NULL')
INSERT INTO LIVESupplemental.dbo.PlannersList VALUES ('LK','Auburn','1662','Laurie Krummer','No Longer Here','N','Shannen Helle')
INSERT INTO LIVESupplemental.dbo.PlannersList VALUES ('LLD','Auburn','1893','Liny Dannis','No Longer Here','N','Jeff Thiessen')
INSERT INTO LIVESupplemental.dbo.PlannersList VALUES ('LW','NA','1210','Lana Wagner','No Longer Here','N','NULL')
INSERT INTO LIVESupplemental.dbo.PlannersList VALUES ('MC','Ballard','609','Michele Countryman','No Longer Here','N','Jeff Thiessen')
INSERT INTO LIVESupplemental.dbo.PlannersList VALUES ('MD','P1','1080','Monica Dooley','FIN','N','Monica Dooley')
INSERT INTO LIVESupplemental.dbo.PlannersList VALUES ('MDK','Auburn','1274','Mike Keil','No Longer Here','N','NULL')
INSERT INTO LIVESupplemental.dbo.PlannersList VALUES ('MK','Auburn','1274','Mike Keil','No Longer Here','N','NULL')
INSERT INTO LIVESupplemental.dbo.PlannersList VALUES ('MKB','P2','2355','Makenzie Blakeley','MFG','N','Shannen Helle')
INSERT INTO LIVESupplemental.dbo.PlannersList VALUES ('ML','Ballard','1396','Molly Lavinter','No Longer Here','N','NULL')
INSERT INTO LIVESupplemental.dbo.PlannersList VALUES ('MLM','Auburn','3675','Madyson L. Malone','No Longer Here','N','Jeff Thiessen')
INSERT INTO LIVESupplemental.dbo.PlannersList VALUES ('MLS','Auburn','2328','Michelle Stark','No Longer Here','N','Shannen Helle')
INSERT INTO LIVESupplemental.dbo.PlannersList VALUES ('MP','NA','1177','Mike Potter','No Longer Here','N','NULL')
INSERT INTO LIVESupplemental.dbo.PlannersList VALUES ('MRB','Auburn','2763','Matt Baker','No Longer Here','N','Jeff Thiessen')
INSERT INTO LIVESupplemental.dbo.PlannersList VALUES ('MRP','NA','1177','Mike Potter','No Longer Here','N','NULL')
INSERT INTO LIVESupplemental.dbo.PlannersList VALUES ('MS','Auburn','2328','Michelle Stark','No Longer Here','N','Shannen Helle')
INSERT INTO LIVESupplemental.dbo.PlannersList VALUES ('NIA','Auburn','1625','Noe Aguiniga','No Longer Here','N','Shannen Helle')
INSERT INTO LIVESupplemental.dbo.PlannersList VALUES ('NRL','Auburn','3577','Nicole Langley','No Longer Here','N','Jeff Thiessen')
INSERT INTO LIVESupplemental.dbo.PlannersList VALUES ('NULL','NA','NULL','NULL','No Longer Here','N','NULL')
INSERT INTO LIVESupplemental.dbo.PlannersList VALUES ('PB','NA','2179','Patti Bradford','No Longer Here','N','NULL')
INSERT INTO LIVESupplemental.dbo.PlannersList VALUES ('RAM','Auburn','3797','Robbie McElroy','No Longer Here','N','Shannen Helle')
INSERT INTO LIVESupplemental.dbo.PlannersList VALUES ('RJF','NA','1964','Robert Kincaid','No Longer Here','N','NULL')
INSERT INTO LIVESupplemental.dbo.PlannersList VALUES ('RJK','NA','1964','Robert Kincaid','No Longer Here','N','NULL')
INSERT INTO LIVESupplemental.dbo.PlannersList VALUES ('RK','NA','1964','Robert Kincaid','No Longer Here','N','NULL')
INSERT INTO LIVESupplemental.dbo.PlannersList VALUES ('RS','Auburn','2081','Rachael Stratton','No Longer Here','N','Jeff Thiessen')
INSERT INTO LIVESupplemental.dbo.PlannersList VALUES ('SC','P1','1358','Shane Christopherson','FIN','N','Shannen Helle')
INSERT INTO LIVESupplemental.dbo.PlannersList VALUES ('SDC','P1','1358','Shane Christopherson','FIN','N','Shannen Helle')
INSERT INTO LIVESupplemental.dbo.PlannersList VALUES ('SF','Auburn','1043','Sharon Jaimis-Graeme','No Longer Here','N','Jeff Thiessen')
INSERT INTO LIVESupplemental.dbo.PlannersList VALUES ('SH','P1','2073','Shane Hassman','No Longer Here','N','Monica Dooley')
INSERT INTO LIVESupplemental.dbo.PlannersList VALUES ('SH','NA','1324','Steven Hopkinson','No Longer Here','N','NULL')
INSERT INTO LIVESupplemental.dbo.PlannersList VALUES ('SJG','Auburn','1043','Sharon Jaimis-Graeme','No Longer Here','N','Jeff Thiessen')
INSERT INTO LIVESupplemental.dbo.PlannersList VALUES ('SJG','Auburn','1043','Sharon Jaimis-Graeme','No Longer Here','N','Shannen Helle')
INSERT INTO LIVESupplemental.dbo.PlannersList VALUES ('SF','Auburn','1341','Sherry Fiedler','No Longer Here','N','Jeff Thiessen')
INSERT INTO LIVESupplemental.dbo.PlannersList VALUES ('SLF','Auburn','1341','Sherry Fiedler','No Longer Here','N','Jeff Thiessen')
INSERT INTO LIVESupplemental.dbo.PlannersList VALUES ('SLF','Auburn','1341','Sherry Fiedler','No Longer Here','N','Shannen Helle')
INSERT INTO LIVESupplemental.dbo.PlannersList VALUES ('SN','NA','1154','Shannon Naughton','No Longer Here','N','NULL')
INSERT INTO LIVESupplemental.dbo.PlannersList VALUES ('SRH','P2','2101','Shannen Helle','MFG','N','Shannen Helle')
INSERT INTO LIVESupplemental.dbo.PlannersList VALUES ('SV','Auburn','1303','Steve Van Matre','No Longer Here','N','NULL')
INSERT INTO LIVESupplemental.dbo.PlannersList VALUES ('TA','P1','1384','Teshome Abebe','FIN','N','Shannen Helle')
INSERT INTO LIVESupplemental.dbo.PlannersList VALUES ('TH','P1','1342','Traci Hammond','Quality','N','Shannen Helle')
INSERT INTO LIVESupplemental.dbo.PlannersList VALUES ('TK','NA','1972','Tyler Knowlden','No Longer Here','N','NULL')
INSERT INTO LIVESupplemental.dbo.PlannersList VALUES ('TMA','P1','1384','Teshome Abebe','FIN','N','Shannen Helle')
INSERT INTO LIVESupplemental.dbo.PlannersList VALUES ('TMP','NA','1485','Tom Pryor','No Longer Here','N','NULL')
INSERT INTO LIVESupplemental.dbo.PlannersList VALUES ('YT','Auburn','419','Yeng Thao','No Longer Here','N','NULL')
INSERT INTO LIVESupplemental.dbo.PlannersList VALUES ('BJH','Auburn','2152','Brian Heigh','No Longer Here','N','NULL')
INSERT INTO LIVESupplemental.dbo.PlannersList VALUES ('BLP','Auburn','1243','Betty Prentice','No Longer Here','N','NULL')
INSERT INTO LIVESupplemental.dbo.PlannersList VALUES ('BLS','P2','2549','Bob Sellers','MFG','N','Shannen Helle')
INSERT INTO LIVESupplemental.dbo.PlannersList VALUES ('CAF','Auburn','1643','Charlie Frampton','MFG','N','Shannen Helle')
INSERT INTO LIVESupplemental.dbo.PlannersList VALUES ('JKM','Auburn','1888','Jeff Morgan','No Longer Here','N','NULL')
INSERT INTO LIVESupplemental.dbo.PlannersList VALUES ('TCF','Auburn','2170','TC Forest','No Longer Here','N','NULL')
INSERT INTO LIVESupplemental.dbo.PlannersList VALUES ('AUB','Auburn','NULL','IGNORE','No Longer Here','N','NULL')
INSERT INTO LIVESupplemental.dbo.PlannersList VALUES ('CR','Auburn','NULL','IGNORE','No Longer Here','N','NULL')
INSERT INTO LIVESupplemental.dbo.PlannersList VALUES ('FRH','Auburn','NULL','IGNORE','No Longer Here','N','NULL')
INSERT INTO LIVESupplemental.dbo.PlannersList VALUES ('MG','Auburn','NULL','IGNORE','No Longer Here','N','NULL')
INSERT INTO LIVESupplemental.dbo.PlannersList VALUES ('NA','Auburn','NULL','IGNORE','No Longer Here','N','NULL')
INSERT INTO LIVESupplemental.dbo.PlannersList VALUES ('RPS','Auburn','NULL','IGNORE','No Longer Here','N','NULL')
INSERT INTO LIVESupplemental.dbo.PlannersList VALUES ('ZTW','Auburn','NULL','IGNORE','No Longer Here','N','NULL')

DELETE FROM LIVESUPPLEMENTAL.dbo.PlannersList WHERE FILTER_STRING = 'KSJ'
DELETE FROM LIVESUPPLEMENTAL.dbo.PlannersList WHERE FILTER_STRING = 'SF' AND EMPID = '1043' AND PLANNING_SUPERVISOR = 'Jeff Thiessen'-- LOCATION = 'NA'
*/
```