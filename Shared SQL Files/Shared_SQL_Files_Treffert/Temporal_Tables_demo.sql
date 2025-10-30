
------------------------------------ Begin Setup ------------------------------------

-- abort if accidentally execute the entire script
SET NOEXEC ON;

/****

SET NOEXEC OFF;

****/

IF @@SERVERNAME NOT IN ('SURFACEBOOK\SQL2017', 'SURFACEPRO\SQL2017') SET NOEXEC ON;
GO

USE master;
GO

IF EXISTS(SELECT * FROM sys.databases
		WHERE [name] = 'WideWorldImporters')
BEGIN
	EXEC ('USE WideWorldImporters;
		ALTER DATABASE WideWorldImporters SET SINGLE_USER WITH ROLLBACK IMMEDIATE;');
	USE master;
	DROP DATABASE WideWorldImporters;
END;
GO

USE master;
GO

IF NOT EXISTS(SELECT * FROM sys.databases
		WHERE [name] = 'WideWorldImporters')
BEGIN
	-- change source and destinations as necessary
	RESTORE DATABASE WideWorldImporters
		FROM  DISK = N'C:\Downloads\WideWorldImporters\WideWorldImporters-Full.bak'
		WITH  FILE = 1,
		MOVE N'WWI_Primary' TO N'C:\MSSQL\Data\WideWorldImporters.mdf',
		MOVE N'WWI_UserData' TO N'C:\MSSQL\Data\WideWorldImporters_UserData.ndf',
		MOVE N'WWI_Log' TO N'C:\MSSQL\Log\WideWorldImporters.ldf',
		MOVE N'WWI_InMemory_Data_1' TO N'C:\MSSQL\Data\WideWorldImporters_InMemory_Data_1',
		NOUNLOAD,  STATS = 5

	ALTER DATABASE WideWorldImporters SET MULTI_USER;
END;
GO -- 30 seconds

USE WideWorldImporters;
GO

IF OBJECTPROPERTY(OBJECT_ID(N'dbo.Department', N'U'), N'TableTemporalType') = 2
BEGIN
	DECLARE @HistoryTableName nvarchar(100);
	SELECT @HistoryTableName = OBJECT_NAME(t.history_table_id)
		FROM sys.tables AS t
		WHERE t.[name] = 'Department'
		AND t.[schema_id] = 1;
    ALTER TABLE dbo.Department SET ( SYSTEM_VERSIONING = OFF );
	EXEC ('DROP TABLE dbo.' + @HistoryTableName);
END;

DROP TABLE IF EXISTS dbo.Department;
GO

IF OBJECTPROPERTY(OBJECT_ID(N'dbo.Employee', N'U'), N'TableTemporalType') = 2
BEGIN
	DECLARE @HistoryTableName nvarchar(100);
	SELECT @HistoryTableName = OBJECT_NAME(t.history_table_id)
		FROM sys.tables AS t
		WHERE t.[name] = 'Employee'
		AND t.[schema_id] = 1;
    ALTER TABLE dbo.Employee SET ( SYSTEM_VERSIONING = OFF );
	EXEC ('DROP TABLE dbo.' + @HistoryTableName);
END;

DROP TABLE IF EXISTS dbo.Employee;
GO

SET NOCOUNT ON;
SET STATISTICS IO OFF;
SET STATISTICS TIME OFF;
GO

CREATE TABLE dbo.Employee
(
	EmployeeNumber int NOT NULL
		CONSTRAINT PK_Employee PRIMARY KEY CLUSTERED,
	FirstName varchar(50) NULL,
	LastName varchar(50) NOT NULL,
	SysStartTimestamp datetime2(0)
		GENERATED ALWAYS AS ROW START NOT NULL,
	SysEndTimestamp datetime2(0)
		GENERATED ALWAYS AS ROW END NOT NULL,
	PERIOD FOR SYSTEM_TIME (SysStartTimestamp, SysEndTimestamp)
)
WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = dbo.EmployeeHistory));
GO

INSERT INTO dbo.Employee (EmployeeNumber, FirstName, LastName)
	VALUES (1, 'Donold', 'Tramp'),
		(2, 'Elan', 'Musc'),
		(3, 'Kimm', 'Davus'),
		(4, 'Debbie', 'Cuerden');
GO

-- SHILLING

------------------------------------ End Setup ------------------------------------

/**************************************
Basic CREATE
**************************************/

USE WideWorldImporters;
GO

CREATE TABLE dbo.Department 
(
	DepartmentNumber char(10) NOT NULL
		CONSTRAINT PK_Department PRIMARY KEY CLUSTERED,
	DepartmentName varchar(50) NOT NULL,
	ManagerID int NULL,
	SysStartTimestamp datetime2(0)
		GENERATED ALWAYS AS ROW START HIDDEN NOT NULL,
	SysEndTimestamp datetime2(0)
		GENERATED ALWAYS AS ROW END HIDDEN NOT NULL,
	PERIOD FOR SYSTEM_TIME (SysStartTimestamp, SysEndTimestamp)
)
WITH (SYSTEM_VERSIONING = ON);
GO

-- show in SSMS, Object Explorer

IF OBJECTPROPERTY(OBJECT_ID(N'dbo.Department', N'U'), N'TableTemporalType') = 2
BEGIN
	DECLARE @HistoryTableName nvarchar(100);
	SELECT @HistoryTableName = OBJECT_NAME(t.history_table_id)
		FROM sys.tables AS t
		WHERE t.[name] = 'Department'
		AND t.[schema_id] = 1;
    ALTER TABLE dbo.Department SET ( SYSTEM_VERSIONING = OFF );
	EXEC ('DROP TABLE dbo.' + @HistoryTableName);
END;

DROP TABLE IF EXISTS dbo.Department;
GO

/**************************************
Specifying history table name
**************************************/

USE WideWorldImporters;
GO

CREATE TABLE dbo.Department 
(
	DepartmentNumber char(10) NOT NULL
		CONSTRAINT PK_Department PRIMARY KEY CLUSTERED,
	DepartmentName varchar(50) NOT NULL,
	ManagerID int NULL,
	SysStartTimestamp datetime2(0)
		GENERATED ALWAYS AS ROW START NOT NULL,
	SysEndTimestamp datetime2(0)
		GENERATED ALWAYS AS ROW END NOT NULL,
	PERIOD FOR SYSTEM_TIME (SysStartTimestamp, SysEndTimestamp)
)
WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = dbo.DepartmentHistory));
GO

-- show in SSMS, Object Explorer

IF OBJECTPROPERTY(OBJECT_ID(N'dbo.Department', N'U'), N'TableTemporalType') = 2
BEGIN
	DECLARE @HistoryTableName nvarchar(100);
	SELECT @HistoryTableName = OBJECT_NAME(t.history_table_id)
		FROM sys.tables AS t
		WHERE t.[name] = 'Department'
		AND t.[schema_id] = 1;
    ALTER TABLE dbo.Department SET ( SYSTEM_VERSIONING = OFF );
	EXEC ('DROP TABLE dbo.' + @HistoryTableName);
END;

DROP TABLE IF EXISTS dbo.Department;
GO

/**************************************
Specifying history table name for existing table 
**************************************/

USE WideWorldImporters;
GO

CREATE TABLE dbo.DepartmentHistory
(
	DepartmentNumber char(11) NOT NULL,
	DepartmentName varchar(50) NOT NULL,
	ManagerID int NULL,
	SysStartTimestamp datetime2(0) NOT NULL,
	SysEndTimestamp datetime2(0) NOT NULL
)
GO

INSERT INTO dbo.DepartmentHistory (DepartmentNumber,
	DepartmentName,
	ManagerID,
	SysStartTimestamp,
	SysEndTimestamp)
VALUES ('123',
	'IT',
	42,
	'2015-08-12',
	'9999-12-31')
GO

CREATE TABLE dbo.Department 
(
	DepartmentNumber char(10) NOT NULL
		CONSTRAINT PK_Department PRIMARY KEY CLUSTERED,
	DepartmentName varchar(50) NOT NULL,
	ManagerID int NULL,
	SysStartTimestamp datetime2(0)
		GENERATED ALWAYS AS ROW START NOT NULL,
	SysEndTimestamp datetime2(0)
		GENERATED ALWAYS AS ROW END NOT NULL,
	PERIOD FOR SYSTEM_TIME (SysStartTimestamp, SysEndTimestamp)
)
WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = dbo.DepartmentHistory));
GO

ALTER TABLE dbo.DepartmentHistory
	ALTER COLUMN DepartmentNumber char(10) NOT NULL;
GO

CREATE TABLE dbo.Department 
(
	DepartmentNumber char(10) NOT NULL
		CONSTRAINT PK_Department PRIMARY KEY CLUSTERED,
	DepartmentName varchar(50) NOT NULL,
	ManagerID int NULL,
	SysStartTimestamp datetime2(0)
		GENERATED ALWAYS AS ROW START NOT NULL,
	SysEndTimestamp datetime2(0)
		GENERATED ALWAYS AS ROW END NOT NULL,
	PERIOD FOR SYSTEM_TIME (SysStartTimestamp, SysEndTimestamp)
)
WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = dbo.DepartmentHistory));
GO

UPDATE dbo.DepartmentHistory
	SET SysEndTimestamp = '2015-09-10';
GO

CREATE TABLE dbo.Department 
(
	DepartmentNumber char(10) NOT NULL
		CONSTRAINT PK_Department PRIMARY KEY CLUSTERED,
	DepartmentName varchar(50) NOT NULL,
	ManagerID int NULL,
	SysStartTimestamp datetime2(0)
		GENERATED ALWAYS AS ROW START NOT NULL,
	SysEndTimestamp datetime2(0)
		GENERATED ALWAYS AS ROW END NOT NULL,
	PERIOD FOR SYSTEM_TIME (SysStartTimestamp, SysEndTimestamp)
)
WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = dbo.DepartmentHistory));
GO

/**************************************
ALTER existing base and history table
**************************************/

USE WideWorldImporters;
GO

-- cannot directly add column to history table
ALTER TABLE dbo.DepartmentHistory
	ADD Col12 int NULL;
GO

SELECT * FROM dbo.Department;
SELECT * FROM dbo.DepartmentHistory;
GO

--Read error message after - although current table is empty, history table isn't
ALTER TABLE dbo.Department
	ADD Location varchar(100) NOT NULL;
GO

ALTER TABLE dbo.Department
	ADD Location varchar(100) NOT NULL
	CONSTRAINT DF_Department_Location DEFAULT ('XYZ');
GO

-- show that History records were populated with default value
SELECT * FROM dbo.Department;
SELECT * FROM dbo.DepartmentHistory;
GO

IF OBJECTPROPERTY(OBJECT_ID(N'dbo.Department', N'U'), N'TableTemporalType') = 2
BEGIN
	DECLARE @HistoryTableName nvarchar(100);
	SELECT @HistoryTableName = OBJECT_NAME(t.history_table_id)
		FROM sys.tables AS t
		WHERE t.[name] = 'Department'
		AND t.[schema_id] = 1;
    ALTER TABLE dbo.Department SET ( SYSTEM_VERSIONING = OFF );
	EXEC ('DROP TABLE dbo.' + @HistoryTableName);
END;

DROP TABLE IF EXISTS dbo.Department;
GO

/**************************************
FOR SYSTEM_TIME AS OF
**************************************/
 
-- explain dbo.Employee, show script that created/loaded
 
USE WideWorldImporters;
GO

SELECT E.EmployeeNumber, E.FirstName, E.LastName FROM dbo.Employee AS E;
SELECT H.EmployeeNumber, H.FirstName, H.LastName FROM dbo.EmployeeHistory AS H;
GO

UPDATE dbo.Employee
	SET LastName = CASE EmployeeNumber
		WHEN 1 THEN 'Trump'
		WHEN 2 THEN 'Musk'
		WHEN 3 THEN 'Davis'
		WHEN 4 THEN 'Rabe'
		END;
GO

SELECT E.EmployeeNumber, E.FirstName, E.LastName FROM dbo.Employee AS E;
SELECT H.EmployeeNumber, H.FirstName, H.LastName FROM dbo.EmployeeHistory AS H;
GO

UPDATE dbo.Employee
	SET FirstName = CASE EmployeeNumber
		WHEN 1 THEN 'Donald'
		WHEN 2 THEN 'Elon'
		WHEN 3 THEN 'Kim'
		WHEN 4 THEN 'Debby'
		END;
GO

SELECT E.EmployeeNumber, E.FirstName, E.LastName FROM dbo.Employee AS E;
SELECT H.EmployeeNumber, H.FirstName, H.LastName FROM dbo.EmployeeHistory AS H;
GO

SELECT * FROM dbo.Employee
	FOR SYSTEM_TIME AS OF '2018-02-09 1:10PM' -- set to 15 minutes ago
GO

DECLARE @DT datetime2(0) = DATEADD(MINUTE, -10, SYSUTCDATETIME());
SELECT E.EmployeeNumber, E.FirstName, E.LastName FROM dbo.Employee
	FOR SYSTEM_TIME AS OF @DT AS E;
GO

/**************************************
FOR SYSTEM_TIME FROM ... TO
**************************************/

USE WideWorldImporters;
GO

DECLARE @DT1 datetime2(0) = DATEADD(HOUR, -2, SYSUTCDATETIME()),
	@DT2 datetime2(0) = SYSUTCDATETIME();
SELECT * FROM dbo.Employee
	FOR SYSTEM_TIME FROM @DT1 TO @DT2;
GO

/**************************************
FOR SYSTEM_TIME ALL
**************************************/

USE WideWorldImporters;
GO

SELECT * FROM dbo.Employee
	FOR SYSTEM_TIME ALL;
GO

/**************************************
Recovering from accidental delete
**************************************/

USE WideWorldImporters;
GO

SELECT * FROM dbo.Employee;
SELECT * FROM dbo.EmployeeHistory;
GO

DELETE dbo.Employee; -- OOPS!!!
GO

SELECT * FROM dbo.Employee;
SELECT * FROM dbo.EmployeeHistory;
GO

DECLARE @DT datetime2(0) = DATEADD(MINUTE, -3, SYSUTCDATETIME());

INSERT INTO dbo.Employee (
	EmployeeNumber,
	FirstName,
	LastName)
SELECT E.EmployeeNumber,
	E.FirstName,
	E.LastName
	FROM dbo.Employee
	FOR SYSTEM_TIME AS OF @DT AS E
GO

SELECT * FROM dbo.Employee;
GO

SELECT * FROM dbo.Employee
	FOR SYSTEM_TIME ALL
	WHERE EmployeeNumber = 4
	ORDER BY SysStartTimestamp;
GO
-- point out System Period gap

/**************************************
Metadata - sys.periods
**************************************/

USE WideWorldImporters;
GO

SELECT OBJECT_NAME(p.[object_id]), p.*
	FROM sys.periods AS p
	WHERE OBJECT_NAME(object_id) = 'Employee';
GO

------------------------------------ Begin Cleanup ------------------------------------

USE WideWorldImporters;
GO

IF OBJECTPROPERTY(OBJECT_ID(N'dbo.Department', N'U'), N'TableTemporalType') = 2
BEGIN
	DECLARE @HistoryTableName nvarchar(100);
	SELECT @HistoryTableName = OBJECT_NAME(t.history_table_id)
		FROM sys.tables AS t
		WHERE t.[name] = 'Department'
		AND t.[schema_id] = 1;
    ALTER TABLE dbo.Department SET ( SYSTEM_VERSIONING = OFF );
	EXEC ('DROP TABLE dbo.' + @HistoryTableName);
END;

DROP TABLE IF EXISTS dbo.Department;
DROP TABLE IF EXISTS dbo.DepartmentHistory;
GO

IF OBJECTPROPERTY(OBJECT_ID(N'dbo.Employee', N'U'), N'TableTemporalType') = 2
BEGIN
	DECLARE @HistoryTableName nvarchar(100);
	SELECT @HistoryTableName = OBJECT_NAME(t.history_table_id)
		FROM sys.tables AS t
		WHERE t.[name] = 'Employee'
		AND t.[schema_id] = 1;
    ALTER TABLE dbo.Employee SET ( SYSTEM_VERSIONING = OFF );
	EXEC ('DROP TABLE dbo.' + @HistoryTableName);
END;

DROP TABLE IF EXISTS dbo.Employee;
DROP TABLE IF EXISTS dbo.EmployeeHistory;
GO

------------------------------------ End Cleanup ------------------------------------

