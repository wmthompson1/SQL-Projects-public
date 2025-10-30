
------------------------------------ Begin Setup ------------------------------------

-- don't allow execution of entire script

/****

SET NOEXEC OFF;

****/

IF @@SERVERNAME NOT IN ('SURFACEPRO\SQL2017','SURFACEBOOK\SQL2017') SET NOEXEC ON;
GO

USE master;
GO

-- change target folder as appropriate
IF NOT EXISTS(SELECT * FROM sys.databases WHERE [name] = 'Utility')
BEGIN
	CREATE DATABASE Utility
		CONTAINMENT = NONE
		ON PRIMARY
		( NAME = N'Utility', FILENAME = N'C:\MSSQL2017\Data\Utility.mdf' , SIZE = 5000000KB , MAXSIZE = UNLIMITED, FILEGROWTH = 500000KB )
		LOG ON 
		( NAME = N'Utility_log', FILENAME = N'C:\MSSQL2017\Log\Utility_log.ldf' , SIZE = 700000KB , MAXSIZE = UNLIMITED, FILEGROWTH = 70000KB)END;
GO

ALTER DATABASE Utility SET RECOVERY SIMPLE;
GO

USE Utility;
GO

IF OBJECT_ID('dbo.Numbers','U') IS NULL
BEGIN
	CREATE TABLE dbo.Numbers (Number int NOT NULL);

	WITH
		L0   AS(SELECT 1 AS c UNION ALL SELECT 1),
		L1   AS(SELECT 1 AS c FROM L0 AS A CROSS JOIN L0 AS B),
		L2   AS(SELECT 1 AS c FROM L1 AS A CROSS JOIN L1 AS B),
		L3   AS(SELECT 1 AS c FROM L2 AS A CROSS JOIN L2 AS B),
		L4   AS(SELECT 1 AS c FROM L3 AS A CROSS JOIN L3 AS B),
		L5   AS(SELECT 1 AS c FROM L4 AS A CROSS JOIN L4 AS B),
		Nums AS(SELECT ROW_NUMBER() OVER(ORDER BY (SELECT NULL)) AS n FROM L5)
	INSERT INTO dbo.Numbers (Number)
		SELECT n FROM Nums WHERE n <= 10000000;

	ALTER TABLE dbo.Numbers ADD  CONSTRAINT XPKNumbers PRIMARY KEY CLUSTERED
	( Number ASC );
END;
GO

IF EXISTS(SELECT * FROM sys.databases
		WHERE [name] = 'AdventureWorks2014')
BEGIN
	EXEC ('USE AdventureWorks2014;
		ALTER DATABASE AdventureWorks2014 SET SINGLE_USER WITH ROLLBACK IMMEDIATE;');
	USE master;
	DROP DATABASE AdventureWorks2014;
END;
GO

IF NOT EXISTS(SELECT * FROM sys.databases
		WHERE [name] = 'AdventureWorks2014')
BEGIN
	-- change source and destinations as necessary
	RESTORE DATABASE AdventureWorks2014
		FROM  DISK = N'C:\Downloads\AdventureWorks\AdventureWorks2014.bak'
		WITH  FILE = 1,
		MOVE N'AdventureWorks2014_Data' TO N'C:\MSSQL2017\Data\AdventureWorks2014_Data.mdf',
		MOVE N'AdventureWorks2014_Log' TO N'C:\MSSQL2017\Log\AdventureWorks2014_Log.ldf',
		NOUNLOAD,  STATS = 10;

	ALTER DATABASE AdventureWorks2014 SET MULTI_USER;
END;
GO

USE AdventureWorks2014;
GO

SET NOCOUNT ON;
SET STATISTICS IO OFF;
SET STATISTICS TIME OFF;
GO

IF EXISTS(SELECT * FROM sys.indexes WHERE [name] = 'IX_Person_ModifiedDate')
BEGIN
	DROP INDEX IX_Person_ModifiedDate ON Person.Person;
END;
GO

CREATE NONCLUSTERED INDEX IX_Person_ModifiedDate ON [Person].[Person]
	(ModifiedDate);
GO

-- Sales.SalesOrderDetail
IF NOT EXISTS(SELECT * FROM INFORMATION_SCHEMA.COLUMNS
		WHERE TABLE_SCHEMA = 'Sales'
		AND TABLE_NAME = 'SalesOrderDetail'
		AND COLUMN_NAME = 'SalesOrderNum')
BEGIN
	ALTER TABLE Sales.SalesOrderDetail
		ADD SalesOrderNum varchar(25) NULL;

	CREATE NONCLUSTERED INDEX XIE1_SalesOrderDetail_SalesOrderNum
		ON Sales.SalesOrderDetail (SalesOrderNum);
END;
GO

UPDATE Sales.SalesOrderDetail
	SET SalesOrderNum = SalesOrderID
	WHERE SalesOrderNum IS NULL;
GO

SET STATISTICS IO OFF;

USE AdventureWorks2014;
GO

------------------------------------ End Setup ------------------------------------

-- SQL Server 2017, AdventureWorks2014 database, hardware

/***************************************************
Accuracy teaser
***************************************************/

DECLARE @dOne decimal(19,4) = 1,
	@dThree decimal(19,4) = 3,
	@mOne money = 1,
	@mThree money = 3,
	@fOne float = 1,
	@fThree float = 3;

SELECT @dOne / @dThree * @dThree AS DecimalResult,
	@mOne / @mThree * @mThree AS MoneyResult,
	@fOne / @fThree * @fThree AS FloatResult;
GO

/***************************************************
Performance example
***************************************************/

USE AdventureWorks2014;
GO

SET NOCOUNT ON;
SET STATISTICS IO OFF;
GO

IF OBJECT_ID('dbo.Decimal1','U') IS NOT NULL DROP TABLE dbo.Decimal1;
IF OBJECT_ID('dbo.Decimal2','U') IS NOT NULL DROP TABLE dbo.Decimal2;
GO

CREATE TABLE dbo.Decimal1 (DecCol decimal(9,3) NULL);
CREATE TABLE dbo.Decimal2 (DecCol decimal(29,3) NULL);
GO

INSERT INTO dbo.Decimal1
SELECT N.Number
	FROM Utility.dbo.Numbers AS N
	WHERE N.Number BETWEEN 1 AND 500000;

INSERT INTO dbo.Decimal2
SELECT N.Number
	FROM Utility.dbo.Numbers AS N
	WHERE N.Number BETWEEN 1 AND 500000;
GO

-- how much storage is used for each table?
EXEC sp_spaceused 'dbo.Decimal1';
EXEC sp_spaceused 'dbo.Decimal2';
GO

-- Show actual execution plan

SET STATISTICS IO ON;
SELECT * FROM dbo.Decimal1 WHERE DecCol = 1 OPTION (RECOMPILE);
SELECT * FROM dbo.Decimal2 WHERE DecCol = 1 OPTION (RECOMPILE);
GO -- show statistics and execution plan

/***************************************************
SARGable (implicit conversion)
***************************************************/

USE AdventureWorks2014;
GO

SET STATISTICS IO ON;

-- Show actual execution plan

-- SARGable
DECLARE @i int = 2;
SELECT *
	FROM Utility.dbo.Numbers
	WHERE Number = @i + 1;
SELECT *
	FROM Utility.dbo.Numbers
	WHERE Number - 1 = @i;
GO -- show statistics and execution plan

-- SARGable
SELECT Title, FirstName, LastName
	FROM Person.Person
	WHERE LastName LIKE 'Murr%';

SELECT Title, FirstName, LastName
	FROM Person.Person
	WHERE LEFT(LastName, 4) = 'Murr';
GO -- show statistics and execution plan

-- SARGable + implicit converstion
DECLARE @IntegerSalesOrderNum int = 43659,
	@VarcharSalesOrderNum varchar(25) = 43659;

SELECT * FROM Sales.SalesOrderDetail AS SD
	WHERE SD.SalesOrderNum = @VarcharSalesOrderNum;

SELECT * FROM Sales.SalesOrderDetail AS SD
	WHERE SD.SalesOrderNum = @IntegerSalesOrderNum;
GO -- show statistics and execution plan

/***************************************************
Float issues
***************************************************/

-- Float is imprecise/approximate

-- turn Actual Execution Plan off

SET STATISTICS IO OFF;
GO

USE AdventureWorks2014;
GO

IF OBJECT_ID('dbo.I','U') IS NOT NULL DROP TABLE dbo.I;
IF OBJECT_ID('dbo.R','U') IS NOT NULL DROP TABLE dbo.R;
GO

CREATE TABLE dbo.I (i int);
CREATE TABLE dbo.R (r real);
GO

INSERT INTO dbo.I (i) VALUES(314159263);
INSERT INTO dbo.I (i) VALUES(314159264);
INSERT INTO dbo.I (i) VALUES(314159265);
INSERT INTO dbo.I (i) VALUES(314159266);
INSERT INTO dbo.I (i) VALUES(314159267);
INSERT INTO dbo.I (i) VALUES(314159268);
INSERT INTO dbo.I (i) VALUES(314159269);
INSERT INTO dbo.I (i) VALUES(314159270);

INSERT INTO dbo.R (r) VALUES(314159264);
GO

SELECT i
	FROM dbo.I
	WHERE i = (SELECT r FROM dbo.R);
GO

SELECT CAST(CAST(314159263 AS real) AS int)
UNION ALL
SELECT CAST(CAST(314159264 AS real) AS int)
UNION ALL
SELECT CAST(CAST(314159265 AS real) AS int)
UNION ALL
SELECT CAST(CAST(314159266 AS real) AS int)
UNION ALL
SELECT CAST(CAST(314159267 AS real) AS int)
UNION ALL
SELECT CAST(CAST(314159268 AS real) AS int)
UNION ALL
SELECT CAST(CAST(314159269 AS real) AS int)
UNION ALL
SELECT CAST(CAST(314159270 AS real) AS int);
GO

SELECT 79 AS Input, CAST(CAST(314159279 AS real) AS int)
UNION ALL
SELECT 80 AS Input, CAST(CAST(314159280 AS real) AS int);
GO

/***************************************************
Money Has Rounding Surprises - communative property
***************************************************/

-- remember this ? (dropped float)
DECLARE @dOne   decimal(19,4) = 1,
	@dThree decimal(19,4) = 3,
	@mOne   money = 1,
	@mThree money = 3;

SELECT @dOne / @dThree * @dThree AS DecimalResult,
	@mOne / @mThree * @mThree AS MoneyResult;
GO

-- Query to identify the data type of a column/variable

DECLARE @var decimal(19,4) = 0;
SELECT SQL_VARIANT_PROPERTY(@var, 'BaseType') AS BaseType,
	SQL_VARIANT_PROPERTY(@var, 'Precision') As [Precision],
	SQL_VARIANT_PROPERTY(@var, 'Scale') AS Scale;
GO

DECLARE @var money = 0;
SELECT SQL_VARIANT_PROPERTY(@var, 'BaseType') AS BaseType,
	SQL_VARIANT_PROPERTY(@var, 'Precision') As [Precision],
	SQL_VARIANT_PROPERTY(@var, 'Scale') AS Scale;
GO

-- Data type, precision, scale of operator output

DECLARE @dOne decimal(19,4) = 1,
	@dThree decimal(19,4) = 3,
	@mOne money = 1,
	@mThree money = 3;
	
SELECT @dOne/@dThree*@dThree AS DecimalResult,
	CAST(SQL_VARIANT_PROPERTY(@dOne/@dThree*@dThree, 'BaseType') AS varchar(9))
		+ '(' + CAST(SQL_VARIANT_PROPERTY(@dOne/@dThree*@dThree, 'Precision') AS varchar(5))
		+ ', ' + CAST(SQL_VARIANT_PROPERTY(@dOne/@dThree*@dThree, 'Scale') AS varchar(5)) + ')' AS DecDataType,
	@mOne/@mThree*@mThree AS MoneyResult,
	CAST(SQL_VARIANT_PROPERTY(@mOne/@mThree*@mThree, 'BaseType') AS varchar(5))
		+ '(' + CAST(SQL_VARIANT_PROPERTY(@mOne/@mThree*@mThree, 'Precision') AS varchar(5))
		+ ', ' + CAST(SQL_VARIANT_PROPERTY(@mOne/@mThree*@mThree, 'Scale') AS varchar(5)) + ')' AS MoneyDataType;
GO

/***************************************************
More rounding surprises
***************************************************/

DECLARE @SmallD decimal(2,1) = 1.1,
	@BigD decimal(9,1) = 1.1;

SELECT @SmallD * @SmallD * @SmallD * @SmallD * @SmallD * @SmallD * @SmallD * @SmallD * @SmallD * @SmallD AS [SmallDResult (correct)],
	@BigD * @BigD * @BigD * @BigD * @BigD * @BigD * @BigD * @BigD * @BigD * @BigD AS [BigD (incorrect)];
GO

DECLARE @SmallD decimal(2,1) = 1.1,
	@BigD decimal(9,1) = 1.1;

SELECT @SmallD * @SmallD * @SmallD * @SmallD * @SmallD * @SmallD * @SmallD * @SmallD * @SmallD * @SmallD AS SmallDResult,
	CAST(SQL_VARIANT_PROPERTY(@SmallD * @SmallD * @SmallD * @SmallD * @SmallD * @SmallD * @SmallD * @SmallD * @SmallD * @SmallD, 'BaseType') AS varchar(9))
		+ '(' + CAST(SQL_VARIANT_PROPERTY(@SmallD * @SmallD * @SmallD * @SmallD * @SmallD * @SmallD * @SmallD * @SmallD * @SmallD * @SmallD, 'Precision') AS varchar(5))
		+ ', ' + CAST(SQL_VARIANT_PROPERTY(@SmallD * @SmallD * @SmallD * @SmallD * @SmallD * @SmallD * @SmallD * @SmallD * @SmallD * @SmallD, 'Scale') AS varchar(5)) + ')' AS SmallDDataType,
	@BigD * @BigD * @BigD * @BigD * @BigD * @BigD * @BigD * @BigD * @BigD * @BigD AS BigDResult,
	CAST(SQL_VARIANT_PROPERTY(@BigD * @BigD * @BigD * @BigD * @BigD * @BigD * @BigD * @BigD * @BigD * @BigD, 'BaseType') AS varchar(9))
		+ '(' + CAST(SQL_VARIANT_PROPERTY(@BigD * @BigD * @BigD * @BigD * @BigD * @BigD * @BigD * @BigD * @BigD * @BigD, 'Precision') AS varchar(5))
		+ ', ' + CAST(SQL_VARIANT_PROPERTY(@BigD * @BigD * @BigD * @BigD * @BigD * @BigD * @BigD * @BigD * @BigD * @BigD, 'Scale') AS varchar(5)) + ')' AS BigDDataType;
GO

/***************************************************
(var)char(small) vs. (var)char(big)
***************************************************/

-- turn off Actual Execution Plan

-- execute while explaining

SET STATISTICS IO OFF;

USE AdventureWorks2014;
GO

IF OBJECT_ID('dbo.SmallVarchar','U') IS NOT NULL DROP TABLE dbo.SmallVarchar;
IF OBJECT_ID('dbo.BigVarchar','U') IS NOT NULL DROP TABLE dbo.BigVarchar;
GO

CREATE TABLE dbo.SmallVarchar (i int, filler varchar(500), vc varchar(60) NOT NULL);
CREATE TABLE dbo.BigVarchar (i int, filler varchar(500), vc varchar(2000) NOT NULL);
GO

INSERT INTO dbo.SmallVarchar (i, filler, vc)
	SELECT Number, REPLICATE('X', 500), '' FROM Utility.dbo.Numbers WHERE Number <= 1000000;
INSERT INTO dbo.BigVarchar (i, filler, vc)
	SELECT Number, REPLICATE('X', 500), '' FROM Utility.dbo.Numbers WHERE Number <= 1000000;
GO -- takes ~ 60 sec

CREATE CLUSTERED INDEX XIE1Small ON dbo.SmallVarchar (vc) WITH (PAD_INDEX = ON);
CREATE CLUSTERED INDEX XIE1Big ON dbo.BigVarchar (vc) WITH (PAD_INDEX = ON);
GO -- takes ~ 30 sec

EXEC sp_spaceused N'dbo.SmallVarchar'; -- index size = 1280
EXEC sp_spaceused N'dbo.BigVarchar'; -- index size = 1688
GO

/***************************************************
(var)char vs. (var)char(n)
***************************************************/

USE AdventureWorks2014;
GO

-- variable - no truncation warning!!, even if size specified
DECLARE @c varchar;
SET @c = REPLICATE('a', 100);
SELECT @c;
SELECT SQL_VARIANT_PROPERTY(@c, 'BaseType') AS BaseType,
	SQL_VARIANT_PROPERTY(@c, 'MaxLength') AS MaxLength;
GO

-- table (data definition) - we do get a truncation warning.
IF OBJECT_ID('dbo.WithoutN','U') IS NOT NULL DROP TABLE dbo.WithoutN;
GO

CREATE TABLE dbo.WithoutN (c varchar);
GO

INSERT INTO dbo.WithoutN (c) SELECT REPLICATE('a', 100);
GO

INSERT INTO dbo.WithoutN (c) VALUES('a');
GO

SELECT c, SQL_VARIANT_PROPERTY(c, 'BaseType') AS BaseType,
	SQL_VARIANT_PROPERTY(c, 'MaxLength') AS MaxLength
	FROM dbo.WithoutN;
GO

-- CAST - no truncation warning!!, even if size specified
SELECT CAST(REPLICATE('a', 100) AS varchar),
	SQL_VARIANT_PROPERTY(CAST(REPLICATE('a', 100) AS varchar), 'MaxLength') AS MaxLength;
GO

/***************************************************
Date literals
***************************************************/

SET LANGUAGE British;
SELECT CONVERT(varchar(20), CAST('9/12/13' AS datetime), 107) AS BritishDatetime;
SELECT CONVERT(varchar(20), CAST('9/12/13' AS date), 107) AS BritishDate;
SET LANGUAGE US_English;
SELECT CONVERT(varchar(20), CAST('9/12/13' AS datetime), 107) AS USDatetime;
SELECT CONVERT(varchar(20), CAST('9/12/13' AS date), 107) AS USDate;
GO

SET LANGUAGE British;
SELECT CONVERT(varchar(20), CAST('09-12-2013' AS datetime), 107) AS BritishDatetime;
SELECT CONVERT(varchar(20), CAST('09-12-2013' AS date), 107) AS BritishDate;
SET LANGUAGE US_English;
SELECT CONVERT(varchar(20), CAST('09-12-2013' AS datetime), 107) AS USDatetime;
SELECT CONVERT(varchar(20), CAST('09-12-2013' AS date), 107) AS USDate;
GO

SET LANGUAGE British;
SELECT CONVERT(varchar(20), CAST('2013-09-12' AS datetime), 107) AS BritishDatetime;
SELECT CONVERT(varchar(20), CAST('2013-09-12' AS date), 107) AS BritishDate;
SET LANGUAGE US_English;
SELECT CONVERT(varchar(20), CAST('2013-09-12' AS datetime), 107) AS USDatetime;
SELECT CONVERT(varchar(20), CAST('2013-09-12' AS date), 107) AS USDate;
GO

SET LANGUAGE British;
SELECT CONVERT(varchar(20), CAST('20130912' AS datetime), 107) AS BritishDatetime;
SELECT CONVERT(varchar(20), CAST('20130912' AS date), 107) AS BritishDatetime;
SET LANGUAGE US_English;
SELECT CONVERT(varchar(20), CAST('20130912' AS datetime), 107) AS USDatetime;
SELECT CONVERT(varchar(20), CAST('20130912' AS date), 107) AS USDatetime;
GO

-- or the ANSI/ISO standard
SET LANGUAGE British;
SELECT CONVERT(varchar(20), CAST('2013-09-12T12:00:00' AS datetime), 107) AS BritishDatetime;
SELECT CONVERT(varchar(20), CAST('2013-09-12T12:00:00' AS date), 107) AS BritishDatetime;
SET LANGUAGE US_English;
SELECT CONVERT(varchar(20), CAST('2013-09-12T12:00:00' AS datetime), 107) AS USDatetime;
SELECT CONVERT(varchar(20), CAST('2013-09-12T12:00:00' AS date), 107) AS USDatetime;
GO

/***************************************************
Using BETWEEN to identify day
***************************************************/

USE AdventureWorks2014;
GO

SET LANGUAGE US_English;
GO

DECLARE @BeginDateTime datetime = '2017-01-01 00:00:00',
	@EndDateTime datetime = '2017-01-01 23:59:59.999',
	@TestDateTime datetime = '2017-01-02 00:00:00';

SELECT CASE
		WHEN @TestDateTime BETWEEN @BeginDateTime AND @EndDateTime
			THEN 'In Between'
		ELSE 'Not In Between'
		END;
GO

IF OBJECT_ID('dbo.OldDatetime','U') IS NOT NULL DROP TABLE dbo.OldDatetime;
GO

CREATE TABLE dbo.OldDatetime (DTString varchar(30), DTDatetime datetime);
INSERT INTO dbo.OldDatetime (DTString)
	VALUES
	('2017-01-01 23:59:59.990'),
	('2017-01-01 23:59:59.991'),
	('2017-01-01 23:59:59.992'),
	('2017-01-01 23:59:59.993'),
	('2017-01-01 23:59:59.994'),
	('2017-01-01 23:59:59.995'),
	('2017-01-01 23:59:59.996'),
	('2017-01-01 23:59:59.997'),
	('2017-01-01 23:59:59.998'),
	('2017-01-01 23:59:59.999'),
	('2017-01-02 00:00:00.000');

UPDATE dbo.OldDatetime
	SET DTDatetime = CAST(DTString AS datetime);

SELECT DTString, DTDatetime
	FROM dbo.OldDatetime
	ORDER BY DTString;
GO

-- the right way to do it (with datetime data type) (or use date data type)
DECLARE @BeginDateTime datetime = '2017-01-01 00:00:00',
	@EndDateTime datetime = '2017-01-02 00:00:00',
	@TestDateTime datetime = '2017-01-02 00:00:00';

SELECT CASE
		WHEN @TestDateTime >= @BeginDateTime
			AND @TestDateTime < @EndDateTime
				THEN 'In Between'
		ELSE 'Not In Between'
		END;
GO

/***************************************************
Adding days
***************************************************/

DECLARE @d datetime = '2017-01-01T00:00:00';
SELECT @d, @d + 1;
GO

DECLARE @d date = '2017-01-01';
SELECT @d, @d + 1;
GO

DECLARE @d datetime2(0) = '2017-01-01';
SELECT @d, @d + 1;
GO

--- use dateadd...
DECLARE @d date = '2017-01-01';
SELECT DATEADD(DAY, 1, @d);
GO

/***************************************************
What date/time is 0, empty string
***************************************************/

SELECT CAST(0 AS datetime);
SELECT CAST(0 AS smalldatetime);
SELECT CAST('' AS datetime);
SELECT CAST('' AS smalldatetime);
GO

SELECT CAST(0 AS datetime2(0));
GO

SELECT CAST(0 AS date);
GO

SELECT CAST('' AS datetime2(0));
GO

SELECT CAST('' AS date);
GO

-- solution (TRY_CAST covered later)
DECLARE @EmptyString varchar(20) = '';
SELECT CAST(NULLIF(@EmptyString, '') AS date) AS EmptyToDate;
GO

/***************************************************
Eliminating time from datetime
***************************************************/

-- truncating the time from datetime (or smalldatetime)
DECLARE @d AS datetime = '2013-01-02T14:23:49';
SELECT DATEADD(DAY, DATEDIFF(DAY, 0, @d), 0);
GO

-- DATEDIFF is a datetime (not datetime2) function so...
-- for datetime2, this works because @d is also a valid datetime, so DATEDIFF implicitly converts 0 to datetime
DECLARE @d AS datetime2(0) = '2013-01-02T14:23:49';
SELECT DATEADD(DAY, DATEDIFF(DAY, 0, @d), 0);
GO 

-- for datetime2, this doesn't work because @d is not a valid datetime, so DATEDIFF tries to implicitly convert 0 to datetime2, and fails
DECLARE @d AS datetime2(0) = '1400-01-02T14:23:49';
SELECT DATEADD(DAY, DATEDIFF(DAY, 0, @d), 0);
GO

-- or simply use CAST to date
DECLARE @d AS datetime2(0) = '2013-01-02T14:23:49';
SELECT CAST(@d AS date);
GO

/***************************************************
ISNUMERIC  -  can parameter be converted to at least one of float, real, (small)money, or integer types?
***************************************************/

SELECT ISNUMERIC('¤+24,') AS [¤+24,],
	ISNUMERIC('+42.5E7') AS [+42.5E7],
	ISNUMERIC('4,5,6,7,.3,3,2') AS [4,5,6,7,.3,3,2],
	ISNUMERIC(' - ') AS [ - ];
GO

-- ISNUMERIC solution
--	pre-2012, roll your own

/***************************************************
TRY_CONVERT / TRY_CAST
***************************************************/

-- are these valid decimal(6,2)?
DECLARE @Good varchar(9) = '1276.94',
	@Bad varchar(9) = '+42.5E7';
SELECT TRY_CAST(@Good AS decimal(6,2)) AS GoodDecimal, TRY_CAST(@Bad AS decimal(6,2)) AS BadDecimal;
GO

---- want to catch invalid values?
--DECLARE @Good varchar(9) = '1276.94',
--	@Bad varchar(9) = '+42.5E7',
--	@Null varchar(9) = NULL;
--SELECT CASE
--		WHEN @Good IS NOT NULL AND TRY_CAST(@Good AS decimal(6,2)) IS NULL THEN -1
--		ELSE TRY_CAST(@Good AS decimal(6,2))
--		END AS GoodVal,
--	CASE
--		WHEN @Bad IS NOT NULL AND TRY_CAST(@Bad AS decimal(6,2)) IS NULL THEN -1
--		ELSE TRY_CAST(@Bad AS decimal(6,2))
--		END AS BadVal,
--	CASE
--		WHEN @Null IS NOT NULL AND TRY_CAST(@Null AS decimal(6,2)) IS NULL THEN -1
--		ELSE TRY_CAST(@Null AS decimal(6,2))
--		END AS NullVal;
--GO

/***************************************************
ISDATE
***************************************************/

-- ISDATE - returns datetime, not datetime2, so not complete date range
DECLARE @s varchar(10) = '1752-12-31';
SELECT @s, ISDATE(@s);
SET @s = '1753-01-01';
SELECT @s, ISDATE(@s);
GO

DECLARE @s varchar(50) = '2017-09-12T08:23:22.1234';
SELECT @s, ISDATE(@s);
SET @s = '2017-09-12T08:23:22.123';
SELECT @s, ISDATE(@s);
GO

-- use TRY_CAST
DECLARE @s varchar(50) = '2017-09-12T08:23:22.1234';
SELECT @s AS InputVariable,
	TRY_CAST(@s AS datetime) AS [datetime],
	TRY_CAST(@s AS datetime2(7)) AS [datetime2];
GO

/***************************************************
ISNULL vs. COALESCE
***************************************************/

-- ISNULL returns varchar (data type of first argument)
-- COALESCE returns int (highest precedence data type)
DECLARE @a varchar(100) = '22',
	@b int = 45;

SELECT ISNULL(@a, @b), SQL_VARIANT_PROPERTY(ISNULL(@a, @b), 'BaseType') AS ISNULLtype,
	COALESCE(@a, @b), SQL_VARIANT_PROPERTY(COALESCE(@a, @b), 'BaseType') AS COALESCEtype;
GO

/***************************************************
CURRENT_TIMESTAMP vs. GET_DATE() vs. SYSDATETIME()...
***************************************************/

SELECT 'CURRENT_TIMESTAMP' AS FunctionName,
	CURRENT_TIMESTAMP AS FunctionOutput,
	SQL_VARIANT_PROPERTY(CURRENT_TIMESTAMP, 'BaseType') AS DataType
UNION ALL
SELECT 'GETDATE' AS FunctionName,
	GETDATE() AS FunctionOutput,
	SQL_VARIANT_PROPERTY(GETDATE(), 'BaseType') AS DataType
UNION ALL
SELECT 'GETUTCDATE' AS FunctionName,
	GETUTCDATE() AS FunctionOutput,
	SQL_VARIANT_PROPERTY(GETUTCDATE(), 'BaseType') AS DataType;

SELECT 'SYSDATETIME' AS FunctionName,
	SYSDATETIME() AS FunctionOutput,
	SQL_VARIANT_PROPERTY(SYSDATETIME(), 'BaseType') AS DataType
UNION ALL
SELECT 'SYSUTCDATETIME' AS FunctionName,
	SYSUTCDATETIME() AS FunctionOutput,
	SQL_VARIANT_PROPERTY(SYSUTCDATETIME(), 'BaseType') AS DataType;
GO

-- GMT vs. UTC - French TUC (for "temps universel coordonné")

------------------------------------ Begin Cleanup ------------------------------------

USE AdventureWorks2014;
GO

IF OBJECT_ID('dbo.Decimal1','U') IS NOT NULL DROP TABLE dbo.Decimal1;
IF OBJECT_ID('dbo.Decimal2','U') IS NOT NULL DROP TABLE dbo.Decimal2;
IF OBJECT_ID('dbo.I','U') IS NOT NULL DROP TABLE dbo.I;
IF OBJECT_ID('dbo.R','U') IS NOT NULL DROP TABLE dbo.R;
IF OBJECT_ID('dbo.SmallVarchar','U') IS NOT NULL DROP TABLE dbo.SmallVarchar;
IF OBJECT_ID('dbo.BigVarchar','U') IS NOT NULL DROP TABLE dbo.BigVarchar;
IF OBJECT_ID('dbo.WithoutN','U') IS NOT NULL DROP TABLE dbo.WithoutN;
IF OBJECT_ID('dbo.VariableString','U') IS NOT NULL DROP TABLE dbo.VariableString;
IF OBJECT_ID('dbo.FixedString','U') IS NOT NULL DROP TABLE dbo.FixedString;
IF OBJECT_ID('dbo.OldDatetime','U') IS NOT NULL DROP TABLE dbo.OldDatetime;
GO

------------------------------------ End Cleanup ------------------------------------
