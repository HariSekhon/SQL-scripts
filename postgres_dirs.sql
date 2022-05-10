--
--  Author: Hari Sekhon
--  Date: 2020-08-06 10:34:23 +0100 (Thu, 06 Aug 2020)
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

-- Useful PostgreSQL dir info
--
-- Requires PostgreSQL >= 11.9
--
-- Tested on PostgreSQL 11.9, 12.x, 13.0

SELECT
  current_setting('config_file') AS "config_file",
  current_setting('hba_file') AS "hba_file",
  current_setting('ident_file') AS "ident_file";

SELECT
  current_setting('data_directory') AS "data_directory",
  current_setting('external_pid_file') AS "external_pid_file";

SELECT
  current_setting('unix_socket_directories') AS "unix_socket_directories",
  current_setting('unix_socket_permissions') AS "unix_socket_permissions",
  current_setting('unix_socket_group') AS "unix_socket_group";

SELECT
  -- not available on PostgreSQL < 10
  pg_current_logfile(),
  current_setting('log_directory') AS "log_directory",  -- log
  current_setting('log_filename') AS "log_filename";    -- postgresql-%Y-%m-%d_%H%M%S.log

SELECT
  -- CASE WHEN pg_current_logfile() IS NOT NULL THEN pg_ls_logdir() END AS pg_ls_logdir,
  pg_ls_waldir(),
  -- not available on PostgreSQL <= 11.8
  pg_ls_archive_statusdir(),
  pg_ls_tmpdir();
