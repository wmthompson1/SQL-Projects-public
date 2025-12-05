-- DDL template: LIVE.dbo.CUSTOMER
CREATE TABLE dbo.CUSTOMER (
    ID            VARCHAR(50) NOT NULL PRIMARY KEY,
    [NAME]        NVARCHAR(200) NULL,
    SALESREP_ID   VARCHAR(50) NULL,
    ACTIVE_FLAG   CHAR(1) NULL,
    USER_9        VARCHAR(100) NULL
    -- additional columns omitted
);
