# AI Turn 02

- Created: 2026-01-19
- Purpose: Placeholder for AI Turn 02 notes and observations.

_the Brent Ozar sproc also noticed the IO freezes (as I did) --&gt;  13 snapshot-looking backups have occurred in the last two weeks, indicating that IO may be freezing up._

## Notes

You’re absolutely right to pay attention to that Brent Ozar warning.  
When **sp\_Blitz** says:

> “13 snapshot‑looking backups have occurred in the last two weeks, indicating that IO may be freezing up.”

…it’s alerting you to **I/O stalls so severe that SQL Server *behaves as if* VSS snapshot backups occurred**, even when no real snapshot backup was taken.

This is one of the most important early‑warning signs of underlying storage pressure.

Let me break it down clearly and give you the exact steps I’d take as a senior DBA.

***

# ✅ **What the Warning Actually Means**

SQL Server maintains a counter called:

### `LastDifferentialBackupLSN` and VSS-related freeze metrics

These values change when:

*   A VSS backup **freezes I/O** (“freeze” phase)
*   SQL Server experiences an **unexpected stall in writing pages** that *resembles* a VSS freeze

Brent’s proc reads from:

*   `msdb..backupset`
*   `sys.dm_os_volume_stats`
*   internal freeze stats exposed to the engine

When you see **many “snapshot-looking backups”** but you KNOW you’re not doing VSS-level backups (like Windows Backup, VM-level snapshots, SAN snapshots), then SQL Server is telling you:

# 🚨 **“Your storage froze writes long enough that it looked like a VSS freeze.”**

***

# 🔍 **Root Causes of Snapshot‑Looking Backup Events**

This pattern is almost always caused by ONE of the following:

***

## 1️⃣ **Underlying storage stalls (most common)**

These stalls are typically:

*   Latency spikes > 500 ms
*   IO subsystem pausing briefly
*   Storage controller firmware pauses
*   SAN pathing interruptions
*   VM host-level storage contention (especially in VMWare/Hyper-V)

SQL Server isn’t making this up — the engine literally could not write for a freeze interval.

***

## 2️⃣ **VM or SAN snapshots actually happening**

Even if you didn’t schedule them:

*   VM replication solutions
*   Hyper‑V default checkpoints
*   Veeam / Rubrik / Commvault trigger VSS freezes
*   SAN array consistency snapshots
*   Cloud backup integration (Azure Backup, Druva, Cohesity)

Sometimes, **another team** is taking snapshots without DBA visibility.

***

## 3️⃣ **ANTI‑VIRUS or EDR scanning MDF/LDF/NDK/TempDB**

Examples:

*   Defender real-time scanning
*   CrowdStrike
*   Carbon Black
*   McAfee ENS

These tools sometimes lock data/log files briefly enough to simulate a freeze.

***

## 4️⃣ **Bad TempDB configuration + large autogrowth stalls**

Given your earlier findings:

*   **Your tempdb data files had zero auto-growth**
*   **Your tempdb log was too small for your workload**

This combination can **absolutely cause freeze-like stalls**, especially when:

*   Queries spill
*   Index rebuilds spill
*   CDC cleanup uses tempdb for worktables
*   AG read-only replicas pressure tempdb

When tempdb hits internal resource stress, the entire SQL instance can freeze briefly.

***

## 5️⃣ **Actual VSS backup misconfigurations**

For example:

*   SQL Server VSS Writer enabled unintentionally
*   Windows Server Backup running shadow copies
*   Third-party backup agent installed and unmonitored

***

# 📌 **Why this matters**

When SQL Server detects a freeze-like event, it assumes:

*   A snapshot backup might be occurring,
*   Flushes dirty buffers
*   Temporarily quiesces the engine
*   Suspends new write activity

These pauses show up in:

*   **PREEMPTIVE\_OS\_FLUSHFILEBUFFERS waits**
*   **WRITELOG**
*   **IO\_COMPLETION**
*   **HADR\_SYNC\_COMMIT stalls** in AGs
*   Application latency spikes (users see “hangs”)

You mentioned your own observation of IO freezes — this absolutely aligns.

***

# 🛠 **How to Investigate (Step-by-Step)**

Here is the DBA playbook I use for resolving these events.

***

## 1️⃣ **Check who is taking VSS snapshots**

Run:

```powershell
vssadmin list writers
vssadmin list shadows
```

Look for:

*   “SQLServerWriter”
*   “Microsoft Hyper-V VSS Writer”
*   “VMware VSS Writer”
*   Snapshot providers from backup vendors

If snapshots exist → confirm the schedule with IT/storage.

***

## 2️⃣ **Check Windows Event Viewer (System + Application)**

Look for:

*   Disk warnings: 7, 51, 55, 129, 153
*   NVMe timeout events
*   Storage controller resets
*   “Disk is not ready” events
*   VSS freeze/thaw events

These correlate almost exactly with sp\_Blitz warnings.

***

## 3️⃣ **On SQL Server: Check I/O stalls**

```sql
SELECT *
FROM sys.dm_io_virtual_file_stats(NULL, NULL)
ORDER BY io_stall DESC;
```

Look for:

*   Very high `io_stall_write_ms`
*   Particularly on `tempdb.mdf`, data files, and log files

***

## 4️⃣ **Check for “stall” waits**

```sql
SELECT *
FROM sys.dm_os_wait_stats
WHERE wait_type IN ('WRITELOG','IO_COMPLETION','PREEMPTIVE_OS_FLUSHFILEBUFFERS')
ORDER BY wait_time_ms DESC;
```

This will confirm repeated freezes.

***

## 5️⃣ **Validate with sp\_BlitzFirst (5-second sample)**

Run:

```sql
EXEC sp_BlitzFirst @ExpertMode = 1;
```

If the “Top Waits” include:

*   WRITELOG
*   IO\_COMPLETION
*   PAGEIOLATCH\_XX

You have real I/O pauses.

***

# 🧩 **How Your TempDB Situation Fits In**

You previously had:

*   **Data files with 0 MB growth**
*   **A 2 GB tempdb log**
*   **Large queries + CDC cleanup + index maintenance**

These can create:

*   Version store pressure
*   Internal spills
*   Emergency growth of log/tempdb (which stalls)
*   Contention spikes
*   I/O freeze-like conditions

Fixing tempdb autogrowth (as we did earlier) will **dramatically reduce freeze events**.

***

# 🛠 **Recommended Fix Plan**

### ✔ Confirm if VSS snapshots are truly happening

If a backup product is doing them → adjust schedule.

### ✔ Ensure AV/EDR exclusions

Excluding:

*   `*.mdf`, `*.ndf`, `*.ldf`
*   SQL Server binaries
*   SQL data directories
*   TempDB directory

### ✔ Fix storage pathing

Check:

*   MPIO
*   SAN zoning
*   VMware vSphere latency
*   Disk queue depth
*   Controller firmware

### ✔ Apply the TempDB fixes we defined earlier

The zero-growth condition very likely contributed to freeze events.

### ✔ Check for AG synchronous commit stalls

If this is an AG environment:  
Freeze on primary → freeze on secondaries.

***

# 🌟 If you want, I can:

✔ Review your **wait stats** if you paste them  
✔ Examine your **IO stall DMV output**  
✔ Provide a **full IO stabilization plan**  
✔ Generate a **cross-team diagnostic note** for storage/VM admins

Just tell me — want me to analyze V3 (IO stats)?

