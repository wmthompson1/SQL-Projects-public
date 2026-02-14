-- Create_Calendar_and_Holidays.sql
-- Creates dbo.Calendar and dbo.Holidays, populates with a WHILE loop and year loop
SET NOCOUNT ON;
SET DATEFIRST 1; -- Week starts Monday (affects DATEPART(WEEKDAY))

/* NOTE: Variables must be declared in the same batch as the loops that use them.
   Declare range before populating the calendar below. */

/* DROP & CREATE Calendar (idempotent for demo) */
IF OBJECT_ID('dbo.Calendar','U') IS NOT NULL
    DROP TABLE dbo.Calendar;

CREATE TABLE dbo.Calendar (
    [Date] DATE NOT NULL PRIMARY KEY,
    [Year] INT NOT NULL,
    [Month] INT NOT NULL,
    [MonthName] NVARCHAR(20) NOT NULL,
    [Day] INT NOT NULL,
    [DayName] NVARCHAR(10) NOT NULL,
    [WeekOfYear] INT NOT NULL,
    [ISOWeek] INT NOT NULL,
    [WeekStart] DATE NOT NULL,
    [WeekEnd] DATE NOT NULL,
    [Quarter] INT NOT NULL,
    [IsWeekend] BIT NOT NULL,
    [IsWorkday] BIT NOT NULL,
    [IsHoliday] BIT NULL,
    [IsCurrentWeek] BIT NOT NULL,
    [IsCurrentMonth] BIT NOT NULL
);

/* Populate Calendar using WHILE loop */
/* Configure range here so variables are in scope for the population loop */
DECLARE @StartDate DATE = '2010-01-01';
DECLARE @EndDate   DATE = '2030-12-31';
DECLARE @d DATE = @StartDate;
WHILE @d <= @EndDate
BEGIN
    DECLARE @weekStart DATE = DATEADD(DAY, 1 - DATEPART(WEEKDAY, @d), @d); -- Monday start
    DECLARE @weekEnd DATE = DATEADD(DAY, 6, @weekStart);

    INSERT INTO dbo.Calendar (
        [Date],[Year],[Month],[MonthName],[Day],[DayName],
        [WeekOfYear],[ISOWeek],[WeekStart],[WeekEnd],[Quarter],
        [IsWeekend],[IsWorkday],[IsHoliday],[IsCurrentWeek],[IsCurrentMonth]
    )
    VALUES (
        @d,
        YEAR(@d),
        MONTH(@d),
        DATENAME(MONTH,@d),
        DAY(@d),
        DATENAME(WEEKDAY,@d),
        DATEPART(WEEK,@d),
        DATEPART(ISO_WEEK,@d),
        @weekStart,
        @weekEnd,
        DATEPART(QUARTER,@d),
        CASE WHEN DATEPART(WEEKDAY,@d) IN (6,7) THEN 1 ELSE 0 END,
        CASE WHEN DATEPART(WEEKDAY,@d) IN (6,7) THEN 0 ELSE 1 END,
        NULL, -- IsHoliday to be set after Holidays table populated
        CASE WHEN @d BETWEEN DATEADD(WEEK, DATEDIFF(WEEK, 0, GETDATE()), 0)
                        AND DATEADD(DAY, 6, DATEADD(WEEK, DATEDIFF(WEEK, 0, GETDATE()), 0))
             THEN 1 ELSE 0 END,
        CASE WHEN YEAR(@d) = YEAR(GETDATE()) AND MONTH(@d) = MONTH(GETDATE()) THEN 1 ELSE 0 END
    );

    SET @d = DATEADD(DAY,1,@d);
END

CREATE INDEX IX_Calendar_WeekStart ON dbo.Calendar(WeekStart);
CREATE INDEX IX_Calendar_YearMonth ON dbo.Calendar([Year],[Month]);

/* Create Holidays table */
IF OBJECT_ID('dbo.Holidays','U') IS NOT NULL
    DROP TABLE dbo.Holidays;

CREATE TABLE dbo.Holidays (
    HolidayDate DATE NOT NULL,
    ObservedDate DATE NOT NULL,
    HolidayName NVARCHAR(100) NOT NULL,
    [Year] INT NOT NULL,
    PRIMARY KEY (ObservedDate, HolidayName)
);


/* Populate US Federal holidays (observed) for each year in range */
DECLARE @y INT = YEAR(@StartDate);
DECLARE @maxY INT = YEAR(@EndDate);

WHILE @y <= @maxY
BEGIN
    DECLARE @d_newyear DATE = DATEFROMPARTS(@y,1,1);
    DECLARE @d_mlk DATE;
    DECLARE @d_pres DATE;
    DECLARE @d_memorial DATE;
    DECLARE @d_juneteenth DATE = DATEFROMPARTS(@y,6,19);
    DECLARE @d_indep DATE = DATEFROMPARTS(@y,7,4);
    DECLARE @d_laborday DATE;
    DECLARE @d_columbus DATE;
    DECLARE @d_veterans DATE = DATEFROMPARTS(@y,11,11);
    DECLARE @d_thanksgiving DATE;
    DECLARE @d_christmas DATE = DATEFROMPARTS(@y,12,25);

    -- Helper: nth weekday in month (DATEFIRST = 1, Monday=1..Sunday=7)
    DECLARE @first DATE;
    DECLARE @offset INT;

    -- MLK Day: third Monday in January
    SET @first = DATEFROMPARTS(@y,1,1);
    SET @offset = (1 - DATEPART(WEEKDAY,@first) + 7) % 7; -- Monday target = 1
    SET @d_mlk = DATEADD(DAY, @offset + (3-1)*7, @first);

    -- Presidents' Day: third Monday in February
    SET @first = DATEFROMPARTS(@y,2,1);
    SET @offset = (1 - DATEPART(WEEKDAY,@first) + 7) % 7;
    SET @d_pres = DATEADD(DAY, @offset + (3-1)*7, @first);

    -- Memorial Day: last Monday in May
    DECLARE @lastMay DATE = EOMONTH(DATEFROMPARTS(@y,5,1));
    DECLARE @wkld INT = DATEPART(WEEKDAY,@lastMay);
    DECLARE @daysBack INT = (@wkld - 1 + 7) % 7; -- back to Monday
    SET @d_memorial = DATEADD(DAY, -@daysBack, @lastMay);

    -- Labor Day: first Monday in September
    SET @first = DATEFROMPARTS(@y,9,1);
    SET @offset = (1 - DATEPART(WEEKDAY,@first) + 7) % 7;
    SET @d_laborday = DATEADD(DAY, @offset, @first);

    -- Columbus Day (second Monday in October)
    SET @first = DATEFROMPARTS(@y,10,1);
    SET @offset = (1 - DATEPART(WEEKDAY,@first) + 7) % 7;
    SET @d_columbus = DATEADD(DAY, @offset + (2-1)*7, @first);

    -- Thanksgiving: fourth Thursday in November (Thursday target = 4)
    SET @first = DATEFROMPARTS(@y,11,1);
    SET @offset = (4 - DATEPART(WEEKDAY,@first) + 7) % 7;
    SET @d_thanksgiving = DATEADD(DAY, @offset + (4-1)*7, @first);

    -- Observed function: Saturday -> Friday prior; Sunday -> Monday after
    DECLARE @obs_newyear DATE = CASE WHEN DATEPART(WEEKDAY,@d_newyear) = 6 THEN DATEADD(DAY,-1,@d_newyear)
                                     WHEN DATEPART(WEEKDAY,@d_newyear) = 7 THEN DATEADD(DAY,1,@d_newyear)
                                     ELSE @d_newyear END;

    DECLARE @obs_juneteenth DATE = CASE WHEN DATEPART(WEEKDAY,@d_juneteenth) = 6 THEN DATEADD(DAY,-1,@d_juneteenth)
                                        WHEN DATEPART(WEEKDAY,@d_juneteenth) = 7 THEN DATEADD(DAY,1,@d_juneteenth)
                                        ELSE @d_juneteenth END;

    DECLARE @obs_indep DATE = CASE WHEN DATEPART(WEEKDAY,@d_indep) = 6 THEN DATEADD(DAY,-1,@d_indep)
                                   WHEN DATEPART(WEEKDAY,@d_indep) = 7 THEN DATEADD(DAY,1,@d_indep)
                                   ELSE @d_indep END;

    DECLARE @obs_veterans DATE = CASE WHEN DATEPART(WEEKDAY,@d_veterans) = 6 THEN DATEADD(DAY,-1,@d_veterans)
                                      WHEN DATEPART(WEEKDAY,@d_veterans) = 7 THEN DATEADD(DAY,1,@d_veterans)
                                      ELSE @d_veterans END;

    DECLARE @obs_christmas DATE = CASE WHEN DATEPART(WEEKDAY,@d_christmas) = 6 THEN DATEADD(DAY,-1,@d_christmas)
                                       WHEN DATEPART(WEEKDAY,@d_christmas) = 7 THEN DATEADD(DAY,1,@d_christmas)
                                       ELSE @d_christmas END;

    -- Insert rows (use MERGE-like idempotency via NOT EXISTS)
    IF NOT EXISTS (SELECT 1 FROM dbo.Holidays WHERE ObservedDate = @obs_newyear AND HolidayName = 'New Year''s Day')
        INSERT INTO dbo.Holidays(HolidayDate,ObservedDate,HolidayName,[Year]) VALUES(@d_newyear,@obs_newyear,'New Year''s Day',@y);

    IF NOT EXISTS (SELECT 1 FROM dbo.Holidays WHERE ObservedDate = @d_mlk AND HolidayName = 'Martin Luther King Jr. Day')
        INSERT INTO dbo.Holidays(HolidayDate,ObservedDate,HolidayName,[Year]) VALUES(@d_mlk,@d_mlk,'Martin Luther King Jr. Day',@y);

    IF NOT EXISTS (SELECT 1 FROM dbo.Holidays WHERE ObservedDate = @d_pres AND HolidayName = 'Presidents'' Day')
        INSERT INTO dbo.Holidays(HolidayDate,ObservedDate,HolidayName,[Year]) VALUES(@d_pres,@d_pres,'Presidents'' Day',@y);

    IF NOT EXISTS (SELECT 1 FROM dbo.Holidays WHERE ObservedDate = @d_memorial AND HolidayName = 'Memorial Day')
        INSERT INTO dbo.Holidays(HolidayDate,ObservedDate,HolidayName,[Year]) VALUES(@d_memorial,@d_memorial,'Memorial Day',@y);

    IF NOT EXISTS (SELECT 1 FROM dbo.Holidays WHERE ObservedDate = @obs_juneteenth AND HolidayName = 'Juneteenth')
        INSERT INTO dbo.Holidays(HolidayDate,ObservedDate,HolidayName,[Year]) VALUES(@d_juneteenth,@obs_juneteenth,'Juneteenth',@y);

    IF NOT EXISTS (SELECT 1 FROM dbo.Holidays WHERE ObservedDate = @obs_indep AND HolidayName = 'Independence Day')
        INSERT INTO dbo.Holidays(HolidayDate,ObservedDate,HolidayName,[Year]) VALUES(@d_indep,@obs_indep,'Independence Day',@y);

    IF NOT EXISTS (SELECT 1 FROM dbo.Holidays WHERE ObservedDate = @d_laborday AND HolidayName = 'Labor Day')
        INSERT INTO dbo.Holidays(HolidayDate,ObservedDate,HolidayName,[Year]) VALUES(@d_laborday,@d_laborday,'Labor Day',@y);

    IF NOT EXISTS (SELECT 1 FROM dbo.Holidays WHERE ObservedDate = @d_columbus AND HolidayName = 'Columbus Day')
        INSERT INTO dbo.Holidays(HolidayDate,ObservedDate,HolidayName,[Year]) VALUES(@d_columbus,@d_columbus,'Columbus Day',@y);

    IF NOT EXISTS (SELECT 1 FROM dbo.Holidays WHERE ObservedDate = @obs_veterans AND HolidayName = 'Veterans Day')
        INSERT INTO dbo.Holidays(HolidayDate,ObservedDate,HolidayName,[Year]) VALUES(@d_veterans,@obs_veterans,'Veterans Day',@y);

    IF NOT EXISTS (SELECT 1 FROM dbo.Holidays WHERE ObservedDate = @d_thanksgiving AND HolidayName = 'Thanksgiving Day')
        INSERT INTO dbo.Holidays(HolidayDate,ObservedDate,HolidayName,[Year]) VALUES(@d_thanksgiving,@d_thanksgiving,'Thanksgiving Day',@y);

    IF NOT EXISTS (SELECT 1 FROM dbo.Holidays WHERE ObservedDate = @obs_christmas AND HolidayName = 'Christmas Day')
        INSERT INTO dbo.Holidays(HolidayDate,ObservedDate,HolidayName,[Year]) VALUES(@d_christmas,@obs_christmas,'Christmas Day',@y);

    SET @y = @y + 1;
END

CREATE INDEX IX_Holidays_ObservedDate ON dbo.Holidays(ObservedDate);

/* Update Calendar.IsHoliday where date equals observed or actual holiday date */
UPDATE c
SET IsHoliday = 1
FROM dbo.Calendar c
JOIN (
    SELECT ObservedDate AS d FROM dbo.Holidays
    UNION
    SELECT HolidayDate AS d FROM dbo.Holidays
) h ON c.[Date] = h.d;

/* Quick validation queries */
SELECT TOP 10 * FROM dbo.Holidays ORDER BY [Year], ObservedDate;
SELECT TOP 10 * FROM dbo.Calendar WHERE IsHoliday = 1 ORDER BY [Date];

/* Examples: filter operations by last week using calendar */
DECLARE @LastWeekStart DATE = DATEADD(WEEK, DATEDIFF(WEEK, 0, GETDATE()) - 1, 0);
DECLARE @LastWeekEnd   DATE = DATEADD(DAY, 6, @LastWeekStart);

SELECT @LastWeekStart AS LastWeekStart, @LastWeekEnd AS LastWeekEnd;

-- Example: join operations to calendar to get only last week's operations
-- SELECT o.*, c.*
-- FROM DATAWAREHOUSE.dbo.OPERATION o
-- JOIN dbo.Calendar c ON CAST(o.CLOSE_DATE AS DATE) = c.[Date]
-- WHERE c.[Date] BETWEEN @LastWeekStart AND @LastWeekEnd;
