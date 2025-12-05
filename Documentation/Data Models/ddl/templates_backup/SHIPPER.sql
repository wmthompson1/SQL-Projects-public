-- DDL template: SHIPPER
CREATE TABLE dbo.SHIPPER (
    PACKLIST_ID VARCHAR(100) NOT NULL PRIMARY KEY,
    INVOICE_ID  VARCHAR(50) NULL,
    -- other columns as used in joins
);
