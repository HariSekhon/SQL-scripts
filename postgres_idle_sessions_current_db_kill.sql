--
--  Author: Hari Sekhon
--  Date: 2020-08-06 00:00:35 +0100 (Thu, 06 Aug 2020)
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

-- Kills idle PostgreSQL sessions for the currently select DB that haven't been used in > 15 minutes
--
-- Tested on PostgreSQL 12.3

SELECT
  pg_terminate_backend(pid)
FROM
  pg_stat_activity
WHERE
  -- don't kill yourself
  pid <> pg_backend_pid()
  --  AND
  -- don't kill your admin tools
  --application_name !~ '(?:psql)|(?:pgAdmin.+)'
  --  AND
  --usename not in ('postgres')
    AND
  datname = current_database()
    AND
  query in ('')
    AND
  state in ('idle', 'idle in transaction', 'idle in transaction (aborted)', 'disabled')
    AND
  --state_change < current_timestamp - INTERVAL '15' MINUTE;
  (
    (current_timestamp - query_start) > interval '15 minutes'
      OR
    (query_start IS NULL AND (current_timestamp - backend_start) > interval '15 minutes')
  )
;
