--
--  Author: Hari Sekhon
--  Date: 2020-08-06 02:13:54 +0100 (Thu, 06 Aug 2020)
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

-- MySQL sessions
--
-- Tested on MySQL 5.7, 8.0
--
-- sys doesn't exist in MySQL 5.6 or MariaDB 10.5

SELECT
  user,
  db,
  program_name,
  command,
  state,
  time,
  current_statement,
  current_memory,
  progress,
  lock_latency,
  rows_examined,
  rows_sent,
  rows_affected,
  tmp_tables,
  tmp_disk_tables,
  full_scan,
  last_statement,
  last_statement_latency,
  last_wait,
  last_wait_latency,
  trx_latency,
  trx_state
FROM
  sys.session
WHERE
  user <> 'sql/event_scheduler'
ORDER BY
  current_memory DESC;
