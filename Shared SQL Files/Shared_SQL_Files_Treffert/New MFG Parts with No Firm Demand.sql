use live
go

SELECT
    p.ID,
    p.PLANNER_USER_ID,
    p.BUYER_USER_ID,
    p.USER_8,
    udf.Material_Type,
    p.COMMODITY_CODE,
    cpe.CUSTOMER_ID,
    cpe.customer_part_id,
    cpe.EFFECTIVE_DATE,
    cpe.DISCONTINUE_DATE
FROM	   part p
INNER JOIN
    CUST_PRICE_EFFECT cpe
    on P.ID = CPE.PART_ID
INNER JOIN 
    [SKILLS_PART_UDF] udf
    ON P.ID = UDF.PART_ID
WHERE
    p.BUYER_USER_ID like 'TBD%'
