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

-- PostgreSQL Vacuum and Analyze info
--
-- Requires PostgreSQL 9.4+ (see postgres_last_vacuum_analyze_pre94.sql for earlier versions)
--
-- Tested on PostgreSQL 9.4+, 10.x, 11.x, 12.x, 13.0

SELECT
  schemaname,
  relname,
  n_live_tup,
  n_dead_tup,
  n_dead_tup / GREATEST(n_live_tup + n_dead_tup, 1)::float * 100 AS dead_percentage,
  n_mod_since_analyze,
  last_vacuum,
  last_autovacuum,
  last_analyze,
  last_autoanalyze,
  vacuum_count,
  autovacuum_count,
  analyze_count,
  autoanalyze_count
FROM
  pg_stat_user_tables
ORDER BY
  n_dead_tup DESC,
  n_mod_since_analyze DESC,
  last_vacuum DESC,
  last_analyze DESC,
  last_autovacuum DESC,
  last_autoanalyze DESC;
