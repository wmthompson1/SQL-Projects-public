SELECT * 
FROM Log
WHERE LogDate >= ISNULL(@StartDate, '1/1/1900') 
    AND UserName = ISNULL(@UserName, UserName)
ORDER BY LogDate DESC
