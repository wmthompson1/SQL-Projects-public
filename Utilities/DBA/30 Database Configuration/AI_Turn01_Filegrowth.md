Brent’s warning is **100% correct** — and it’s a *classic* SQL Server tuning issue for DBAs.

Here’s **what it means, why it matters, and exactly what to do**.

***

# ✅ What the warning means

Brent Ozar’s stored procedures (sp\_Blitz, sp\_BlitzFirst, sp\_BlitzIndex) flag this when:

*   A data file has an **auto‑growth increment of only 1MB**,  
    **AND**
*   The file has grown very large (in your case **8 GB**, meaning it has fired **\~8,000 auto‑growth events**).

This is a serious performance red flag because:

### ✔ SQL Server must zero‑initialize every new growth

Each 1 MB growth causes a blocking pause (short but frequent).  
Thousands of tiny growths = thousands of pauses.

### ✔ Causes file system fragmentation

1MB chunks = scattered extents on disk, poor read/write throughput.

### ✔ Bloats the log of growth events and causes intermittent waits

You’ll see:

*   **PREEMPTIVE\_OS\_WRITEFILEGATHER**
*   **WRITELOG**
*   When VLF or data‑file zeroing delays accumulate.

### ✔ CDC file specifically grows fast

CDC writes tend to be **append-heavy**, so growth events fire constantly.

***

# 🎯 What you should do

You need to set a **larger, fixed** filegrowth size on the CDC data file.

## Recommended filegrowth settings

For **data files** (MDF/NDF):

*   **512MB** or **1024MB** growth increments on active OLTP/CDC files.
*   Some environments use **2GB** for extremely busy write-heavy workloads.

For **log files**:

*   Typically **512MB–1GB** depending on workload & backup frequency.

***

# ✔ Exact T‑SQL to fix your filegrowth

Replace filename as needed:

```sql
USE [master];
GO

ALTER DATABASE [LIVE]
MODIFY FILE
(
    NAME = N'NEWLIVE_CDC',       -- Logical file name
    FILEGROWTH = 512MB           -- or 1024MB
);
```

If you’d like 1GB increments:

```sql
ALTER DATABASE [LIVE]
MODIFY FILE
(
    NAME = N'NEWLIVE_CDC',
    FILEGROWTH = 1024MB
);
```

You can verify after:

```sql
SELECT name, size*8/1024 AS SizeMB, growth*8/1024 AS GrowthMB
FROM sys.database_files
WHERE name = 'NEWLIVE_CDC';
```

***

# 🧠 Rule of thumb for DBAs

**Never leave 1MB or 10% auto-growth on production files.**

*   Small fixed amounts (like 1MB) → absurd number of growth events.
*   Percent growth (10%, 15%) → growth gets larger as DB grows and can cause huge pauses later.

***

# 🌟 Bonus — Should you pre-grow the file?

YES, for CDC files **pre-growing** is smart. Set the target size you expect (e.g., 16GB or 32GB), then:

```sql
ALTER DATABASE [LIVE]
MODIFY FILE
(
    NAME = N'NEWLIVE_CDC',
    SIZE = 16000MB     -- pre-grow to 16GB, change as desired
);
```

This avoids future auto-growth hits altogether.

***

# 📌 If you want, I can:

*   review **all** your data/log filegrowth settings and provide recommended values
*   generate a **standard DBA growth policy** for your environment
*   help calculate the ideal size based on CDC retention & workload

Just tell me!
