/*
The mission if you choose to accept it is to create a logging solution using triggers so that any change to the table is logged in SampleAuditLog.  
SampleAuditLog contains fields for UserID, LogDate, the Action (meaning INSERT, UPDATE, DELETE) and value before and after.  

Something to keep in mind while you’re working.  It’s common to think of a trigger dealing with a single record insert, update or delete.  
It’s much more likely that the table will get hit with batch updates/inserts/deletes so you will want to make sure your triggers can handle that. 
*/

DROP TRIGGER str_AuditRecsINS 
DROP TRIGGER str_AuditRecsUPD 
DROP TRIGGER str_AuditRecsDEL 

TRUNCATE TABLE SampleLookupTable
TRUNCATE TABLE SampleAuditLog

/*
CREATE TRIGGER str_AuditRecsINS ON SampleLookupTable
AFTER INSERT
AS
BEGIN
	SET NOCOUNT ON;
	IF EXISTS (SELECT 1 FROM inserted)
		BEGIN
--			SELECT * FROM inserted;
			INSERT INTO SampleAuditLog (LogDate, UserID, Action, ValueBefore, ValueAfter)
				SELECT GETDATE(), SUSER_SNAME(), 'Insert', '',  i.[Description] 
				FROM inserted i 
		END
END
GO
*/

CREATE TRIGGER str_AuditRecsINS ON SampleLookupTable
AFTER INSERT
AS
BEGIN
	if @@rowcount = 0
		RETURN;
	SET NOCOUNT ON;
--	IF EXISTS (SELECT 1 FROM inserted)  -- this replaced with "if @@rowcount"
--			SELECT * FROM inserted;
	INSERT INTO SampleAuditLog (LogDate, UserID, Action, ValueBefore, ValueAfter)
		SELECT GETDATE(), SUSER_SNAME(), 'Insert', '',  i.[Description] 
		FROM inserted i 
END
GO

CREATE TRIGGER str_AuditRecsUPD ON SampleLookupTable
AFTER UPDATE
AS
BEGIN
	if @@rowcount = 0
		RETURN;
	SET NOCOUNT ON;
--			SELECT * FROM INSERTED;
			INSERT INTO SampleAuditLog (LogDate, UserID, Action, ValueBefore, ValueAfter)
				SELECT GETDATE(), SUSER_SNAME(), 'Update', d.[Description],  i.[Description] 
				FROM inserted i 
					INNER JOIN deleted d
						ON i.Code = d.Code
END
GO

CREATE TRIGGER str_AuditRecsDEL ON SampleLookupTable
AFTER DELETE
AS
BEGIN
	if @@rowcount = 0
		RETURN;
	SET NOCOUNT ON;
--			SELECT * FROM deleted;
			INSERT INTO SampleAuditLog (LogDate, UserID, Action, ValueBefore, ValueAfter)
				SELECT GETDATE(), SUSER_SNAME(), 'Delete',  d.[Description] , ''
				FROM deleted d
END
GO

-- testing
INSERT INTO SampleLookupTable VALUES ('1', 'First Code')
INSERT INTO SampleLookupTable VALUES ('2', 'Second Code')
INSERT INTO SampleLookupTable VALUES ('3', 'Third Code')
INSERT INTO SampleLookupTable VALUES ('4', 'Fourth Code'), ('5', 'Fifth Code'), ('A', 'A Code'), ('B', 'B Code'), ('C', 'C Code')

SELECT * FROM SampleLookupTable
SELECT * FROM SampleAuditLog 

UPDATE SampleLookupTable 
SET [Description] = 'Update Desc'
WHERE Code = '1'

SELECT * FROM SampleLookupTable
SELECT * FROM SampleAuditLog 

DELETE FROM SampleLookupTable 
WHERE Code = '2'

SELECT * FROM SampleLookupTable
SELECT * FROM SampleAuditLog 

UPDATE SampleLookupTable 
SET [Description] = 'Odd Desc'
WHERE Code in ('1', '3', '5')

SELECT * FROM SampleLookupTable
SELECT * FROM SampleAuditLog 

DELETE FROM SampleLookupTable 
WHERE Code in ('A', 'C', 'G') 

SELECT * FROM SampleLookupTable
SELECT * FROM SampleAuditLog 