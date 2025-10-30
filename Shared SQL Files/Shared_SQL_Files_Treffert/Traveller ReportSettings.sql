
DECLARE  @ReportSettings TABLE(
    [Resource] [nvarchar](15) NOT NULL,
    [barcode_etch] [int] NULL,
    [barcode_pre_etch] [int] NULL,
    [barcode_review] [int] NULL,
    [Chem_to_Prime_hrs] [int] NULL,
    [Clean_to_Solgel_hrs] [int] NULL,
    [FAI_NET_STAMP] [int] NULL,
    [FAI_STAMP] [int] NULL,
    [heightchange] [int] NULL,
    [printuser] [int] NULL,
    [QTY_IN] [int] NULL,
    [QTY_NOSHOW] [int] NULL,
    [QTY_OUT] [int] NULL,
    [SHIP_VIA] [int] NULL,
    [STAMP] [int] NULL,
    [Start_Op_to_SOLGEL] [int] NULL
    ) 
 
     INSERT INTO @ReportSettings

   SELECT Resource, [barcode_etch],[barcode_pre_etch],[barcode_review],[Chem_to_Prime_hrs],[Clean_to_Solgel_hrs]
    ,[FAI_NET_STAMP],[FAI_STAMP],[heightchange],[printuser],[QTY_IN],[QTY_NOSHOW],[QTY_OUT],[SHIP_VIA],[STAMP],[Start_Op_to_SOLGEL] 
FROM
        (
            SELECT Resource
                , CAST(Include AS INT)Include
                , Report_Section
            FROM (    SELECT [Resource_ID] AS Resource, [Report_Name], [Report_Section], [Reasoning], [Notes], [Include]
                    FROM [SQL-BI-1].LIVESupplemental.dbo.[ResourceID_ReportSettings] 
                ) a
            WHERE a.Report_Name = 'traveller'
        ) x
        pivot
        (  MAX(Include)
            for Report_Section in ([barcode_etch],[barcode_pre_etch],[barcode_review],[Chem_to_Prime_hrs],[Clean_to_Solgel_hrs],[FAI_NET_STAMP],[FAI_STAMP],[heightchange],[printuser],[QTY_IN],[QTY_NOSHOW],[QTY_OUT],[SHIP_VIA],[STAMP],[Start_Op_to_SOLGEL])
        )p 

SELECT * FROM @ReportSettings --WHERE RESOURCE IN ('P1F1-REVIEW', 'P1F1-REVIEWCM', 'P2M1-REVIEW', 'P2M1-REVIEWCM', 'P2M1-REVIEW-CMP', 'P2M1-STAGNG-CMP')