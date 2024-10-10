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

-- PostgreSQL query times from pg_stat_statements for PostgreSQL <= 9.4
--
-- Also works on later versions up to PostgreSQL 12, but primarily written to be able to be able to query earlier PostgreSQL versions
--
-- For PostgreSQL >= 9.5 recommend postgres_query_times_pre13.sql instead which returns more available information
--
-- Requires 9.1 <= PostgreSQL <= 12
--
-- Tested on PostgreSQL 9.1+, 10.x, 11.x, 12.x, 13.0

-- postgresql.conf needs before start:
-- shared_preload_libraries = 'pg_stat_statements'
--
CREATE EXTENSION IF NOT EXISTS pg_stat_statements;

SELECT
  calls,
  rows,
  ROUND(total_time::numeric / 1000, 4) AS total_secs,
  -- newer versions of PostgreSQL have mean_time field, but we have to calculate on PostgreSQL <= 9.4
  ROUND(total_time::numeric / 1000 / GREATEST(calls, 1), 4) AS average_secs,
  query
FROM
  pg_stat_statements
ORDER BY
  average_secs DESC,
  calls DESC,
  rows DESC
LIMIT 100;
