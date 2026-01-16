-- Voucher reporting template queries
-- Use these as starting points; adapt column lists and filters for your needs.

-- 1) Basic payable header with vendor and total
SELECT p.VOUCHER_ID,
       p.INVOICE_NO,
       p.VENDOR_ID,
       v.VENDOR_NAME,
       p.INVOICE_DATE,
       p.INVOICE_TOTAL
FROM dbo.PAYABLE p
LEFT JOIN dbo.VENDOR v ON v.VENDOR_ID = p.VENDOR_ID
WHERE p.INVOICE_DATE >= '2025-01-01'
ORDER BY p.INVOICE_DATE DESC;

-- 2) Payable distributions (GL-level) for a voucher
SELECT d.VOUCHER_ID,
       d.DIST_NO,
       d.ENTRY_NO,
       d.CURRENCY_ID,
       d.ACCT_ID /* distribution GL account placeholder */,
       d.AMOUNT
FROM dbo.PAYABLE_DIST d
WHERE d.VOUCHER_ID = @VoucherID;

-- 3) Payments applied to vouchers (cash disbursement links)
SELECT cd.DISBURSE_ID,
       cdl.VOUCHER_ID,
       cd.BANK_ACCOUNT_ID,
       cd.PAYMENT_DATE,
       cdl.AMOUNT AS APPLIED_AMOUNT
FROM dbo.CASH_DISBURSEMENT cd
JOIN dbo.CASH_DISBURSE_LINE cdl ON cdl.DISBURSE_ID = cd.DISBURSE_ID
WHERE cdl.VOUCHER_ID = @VoucherID;

-- 4) Summary: outstanding vouchers by vendor
SELECT p.VENDOR_ID,
       v.VENDOR_NAME,
       SUM(p.INVOICE_TOTAL - ISNULL(pm.PAID_AMOUNT,0)) AS OUTSTANDING
FROM dbo.PAYABLE p
LEFT JOIN dbo.VENDOR v ON v.VENDOR_ID = p.VENDOR_ID
LEFT JOIN (
    SELECT VOUCHER_ID, SUM(AMOUNT) AS PAID_AMOUNT
    FROM dbo.CASH_DISBURSE_LINE
    GROUP BY VOUCHER_ID
) pm ON pm.VOUCHER_ID = p.VOUCHER_ID
WHERE p.STATUS <> 'POSTED' -- adjust as your status model dictates
GROUP BY p.VENDOR_ID, v.VENDOR_NAME
ORDER BY OUTSTANDING DESC;

-- 5) Multi-currency detail for a voucher (uses PAYABLE_CURR)
SELECT pc.VOUCHER_ID,
       pc.CURRENCY_ID,
       pc.CURR_AMOUNT,
       pc.EXCHANGE_RATE
FROM dbo.PAYABLE_CURR pc
WHERE pc.VOUCHER_ID = @VoucherID;

-- Save this file as a starting point in Documentation/Data Models/ddl/queries/
