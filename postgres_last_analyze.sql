--
--  Author: Hari Sekhon
--  Date: 2020-08-05 17:30:04 +0100 (Wed, 05 Aug 2020)
--
--  vim:ts=4:sts=4:sw=4:et:filetype=sql
--
--  https://github.com/HariSekhon/SQL-scripts
--
--  License: see accompanying Hari Sekhon LICENSE file
--
--  If you're using my code you're welcome to connect with me on LinkedIn and optionally send me feedback to help steer this or other code I publish
--
--  https://www.linkedin.com/in/HariSekhon
--

-- PostgreSQL Analyze info for tables with rows modified since last analyze
--
-- Requires PostgreSQL 9.4+ (see postgres_last_analyze_pre94.sql for earlier versions)
--
-- Tested on PostgreSQL 9.4+, 10.x, 11.x, 12.x, 13.0

SELECT
  schemaname,
  relname,
  -- not available on PostgreSQL <= 9.3
  n_mod_since_analyze,
  last_analyze,
  last_autoanalyze,
  -- not available on PostgreSQL <= 9.0
  analyze_count,
  autoanalyze_count
FROM pg_stat_user_tables
ORDER BY
  n_mod_since_analyze DESC,
  last_analyze DESC,
  last_autoanalyze DESC;
