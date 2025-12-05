-- DDL template: LIVEAccounting.dbo.boe_pay_summary_history
-- Note: original column names contained non-breaking spaces and special characters.
CREATE TABLE dbo.boe_pay_summary_history (
    ID                        INT IDENTITY(1,1) PRIMARY KEY,
    supplier_invoice_num      VARCHAR(200) NULL, -- normalized from "supplier invoice num"
    boeing_invoice_num        VARCHAR(200) NULL, -- "boeing invoice num"
    boeing_purchase_order_num VARCHAR(200) NULL, -- "boeing purchase order num"
    payment_settlement_date   DATETIME NULL,
    invoice_received_date     DATETIME NULL,
    invoice_net_amt           DECIMAL(18,2) NULL,
    invoice_gross_amt         DECIMAL(18,2) NULL,
    [check_trace_num]         VARCHAR(200) NULL, -- normalized from "check/trace num"
    payment                   DECIMAL(18,2) NULL
);
