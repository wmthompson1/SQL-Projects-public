--All Image Masters with indicator for assignment
SELECT im.BASE_ID, im.LOT_ID, im.OrderNum, im.PerspectiveID
    , CASE WHEN ia.Attribute_ID IS NULL THEN 'NO' ELSE 'YES' END AS IsAssigned
FROM Image_Master im
    LEFT JOIN Image_Attributes ia
        ON ia.Image_ID = im.Image_ID
