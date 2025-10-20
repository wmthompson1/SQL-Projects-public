SELECT
      Part1 = Substring(Macro,1,8000)
    , Part2 = Substring(Macro,8001,16000)
    , Part3 = Substring(Macro,16001,24000)
    , Part4 = Substring(Macro,24001,32000)
    ,[ROWID]
    ,[USER_ID]
    ,[PROGRAM_ID]
    ,[NAME]
FROM (
    SELECT 
         Macro = convert(Nvarchar(max),convert(varbinary(max),[MACRO]))
        ,[ROWID]
        ,[USER_ID]
        ,[PROGRAM_ID]
        ,[NAME]
    FROM [dbo].[MACRO]
) as M

WHERE PROGRAM_ID in(@ProgramID)

ORDER BY PROGRAM_ID, NAME, USER_ID
