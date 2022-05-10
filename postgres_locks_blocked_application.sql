--
--  Author: Hari Sekhon
--  Date: 2020-08-07 00:43:13 +0100 (Fri, 07 Aug 2020)
--
--  vim:ts=2:sts=2:sw=2:et:filetype=sql
--
--  https://github.com/harisekhon/sql
--
--  License: see accompanying Hari Sekhon LICENSE file
--
--  If you're using my code you're welcome to connect with me on LinkedIn and optionally send me feedback to help steer this or other code I publish
--
--  https://www.linkedin.com/in/HariSekhon
--

-- List PostgreSQL locks blocked with application name
--
-- Requires PostgreSQL 9.2+
--
-- Tested on PostgreSQL 9.2+, 10.x, 11.x, 12.x, 13.0

-- https://wiki.postgresql.org/wiki/Lock_Monitoring

SELECT
  blocked_locks.pid                   AS blocked_pid,
  blocked_activity.usename            AS blocked_user,
  blocking_locks.pid                  AS blocking_pid,
  blocking_activity.usename           AS blocking_user,
  blocked_activity.query              AS blocked_statement,
  blocking_activity.query             AS current_statement_in_blocking_process,
  blocked_activity.application_name   AS blocked_application,
  blocking_activity.application_name  AS blocking_application
FROM
  pg_catalog.pg_locks           blocked_locks
JOIN
  pg_catalog.pg_stat_activity   blocked_activity
ON
  blocked_activity.pid = blocked_locks.pid
JOIN
  pg_catalog.pg_locks           blocking_locks
ON
  blocking_locks.locktype = blocked_locks.locktype
  AND blocking_locks.DATABASE       IS NOT DISTINCT FROM blocked_locks.DATABASE
  AND blocking_locks.relation       IS NOT DISTINCT FROM blocked_locks.relation
  AND blocking_locks.page           IS NOT DISTINCT FROM blocked_locks.page
  AND blocking_locks.tuple          IS NOT DISTINCT FROM blocked_locks.tuple
  AND blocking_locks.virtualxid     IS NOT DISTINCT FROM blocked_locks.virtualxid
  AND blocking_locks.transactionid  IS NOT DISTINCT FROM blocked_locks.transactionid
  AND blocking_locks.classid        IS NOT DISTINCT FROM blocked_locks.classid
  AND blocking_locks.objid          IS NOT DISTINCT FROM blocked_locks.objid
  AND blocking_locks.objsubid       IS NOT DISTINCT FROM blocked_locks.objsubid
  AND blocking_locks.pid != blocked_locks.pid
JOIN
  pg_catalog.pg_stat_activity blocking_activity
ON
  blocking_activity.pid = blocking_locks.pid
WHERE
  NOT blocked_locks.granted;
