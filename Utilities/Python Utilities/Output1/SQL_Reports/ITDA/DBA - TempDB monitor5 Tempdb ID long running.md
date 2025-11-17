# DBA - TempDB monitor5 Tempdb ID long running

```sql
    -- idedntify long running snapshot transactions in TempDB
        SELECT
        st.session_id,
        st.transaction_id,
        st.transaction_sequence_num,
        st.is_snapshot,
        st.first_snapshot_sequence_num,
        s.login_name,
        s.host_name,
        s.program_name,
        s.last_request_start_time
    FROM sys.dm_tran_active_snapshot_database_transactions AS st
    JOIN sys.dm_exec_sessions AS s ON st.session_id = s.session_id
    ORDER BY st.transaction_sequence_num;
```