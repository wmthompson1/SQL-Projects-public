-- DDL template: LIVE.dbo.RECEIVABLE
-- Review and adjust types and constraints to match production
CREATE TABLE dbo.RECEIVABLE (
    INVOICE_ID        VARCHAR(50) NOT NULL PRIMARY KEY,
    CUSTOMER_ID       VARCHAR(50) NULL,
    POSTING_DATE      DATE NULL,
    INVOICE_DATE      DATE NULL,
    TOTAL_AMOUNT      DECIMAL(18,2) NULL,
    PAID_AMOUNT       DECIMAL(18,2) NULL,
    USER_9            VARCHAR(100) NULL,
    -- additional columns go here
);
