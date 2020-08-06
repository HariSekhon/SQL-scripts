--
--  Author: Hari Sekhon
--  Date: 2020-08-06 18:07:25 +0100 (Thu, 06 Aug 2020)
--
--  vim:ts=2:sts=2:sw=2:et:filetype=sql
--
--  https://github.com/harisekhon/sql
--
--  License: see accompanying Hari Sekhon LICENSE file
--
--  If you're using my code you're welcome to connect with me on LinkedIn and optionally send me feedback to help steer this or other code I publish
--
--  https://www.linkedin.com/in/harisekhon
--

-- Show PostgreSQL auto vacuum settings eg. autovacuum, log_autovacuum_min_duration, autovacuum_naptime, autovacuum_max_workers, autovacuum_vacuum_threshold, autovacuum_analyze_threshold
--
-- Tested on PostgreSQL 12.3

-- https://www.postgresql.org/docs/12/runtime-config-autovacuum.html

SELECT
  name,
  setting,
  -- category,
  vartype,
  short_desc,
  -- enumvals,
  source,
  min_val,
  max_val,
  boot_val,
  reset_val,
  pending_restart
FROM
  pg_settings
WHERE
  category ILIKE '%Autovacuum%';
