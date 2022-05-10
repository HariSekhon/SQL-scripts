--
--  Author: Hari Sekhon
--  Date: 2020-08-05 17:30:04 +0100 (Wed, 05 Aug 2020)
--
--  vim:ts=2:sts=2:sw=2:et:filetype=sql
--
--  https://github.com/HariSekhon/SQL-scripts
--
--  License: see accompanying Hari Sekhon LICENSE file
--
--  If you're using my code you're welcome to connect with me on LinkedIn and optionally send me feedback to help steer this or other code I publish
--
--  https://www.linkedin.com/in/HariSekhon
--

-- PostgreSQL Vacuum info for tables with deleted rows
--
-- Requires PostgreSQL 9.1+ (see postgres_last_vacuum_pre91.sql for earlier versions)
--
-- Tested on PostgreSQL 9.1+, 10.x, 11.x, 12.x, 13.0

SELECT
  schemaname,
  relname,
  n_live_tup,
  n_dead_tup,
  n_dead_tup / GREATEST(n_live_tup + n_dead_tup, 1)::float * 100 AS dead_percentage,
  last_vacuum,
  last_autovacuum,
  -- not available on PostgreSQL <= 9.0
  vacuum_count,
  autovacuum_count
FROM pg_stat_user_tables
WHERE
  n_dead_tup > 0
ORDER BY
  n_dead_tup DESC,
  last_vacuum DESC,
  last_autovacuum DESC;
