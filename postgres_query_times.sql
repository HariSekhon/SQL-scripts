--
--  Author: Hari Sekhon
--  Date: 2020-08-05 16:16:21 +0100 (Wed, 05 Aug 2020)
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

-- PostgreSQL query times from pg_stat_statements
--
-- Requires PostgreSQL 13+
--
-- For PostgreSQL 9.5 - 12.x  use postgres_query_times_pre13.sql
-- For PostgreSQL <= 9.4      use postgres_query_times_pre95.sql
--
-- Tested on PostgreSQL 13.0

-- postgresql.conf needs before start:
-- shared_preload_libraries = 'pg_stat_statements'
--
CREATE EXTENSION IF NOT EXISTS pg_stat_statements;

SELECT
  calls,
  rows,
  ROUND((total_exec_time::numeric / 1000), 4) AS total_secs,
  -- newer versions of PostgreSQL have mean_exec_time field, don't need to calculate
  --ROUND((total_exec_time / 1000 / calls)::numeric, 4) AS average_secs,
  ROUND(mean_exec_time::numeric / 1000, 4) AS average_secs,
  ROUND(min_exec_time::numeric / 1000, 4) AS min_secs,
  ROUND(max_exec_time::numeric / 1000, 4) AS max_secs,
  ROUND(stddev_exec_time::numeric / 1000, 4) AS stddev_secs,
  query
FROM
  pg_stat_statements
ORDER BY
  average_secs DESC,
  calls DESC,
  rows DESC
LIMIT 100;
