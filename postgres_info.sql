--
--  Author: Hari Sekhon
--  Date: 2020-08-06 10:34:23 +0100 (Thu, 06 Aug 2020)
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

-- Useful PostgreSQL functions & info
--
-- Requires PostgreSQL 10+ (see postgres_info_pre10.sql for PostgreSQL 8/9)
--
-- Tested on PostgreSQL 10.x, 11.x, 12.x, 13.0

-- https://www.postgresql.org/docs/12/functions.html

\timing off

-- ========================================================================== --
--                                 V e r s i o n
-- ========================================================================== --

--\pset title 'PostgreSQL Version'

-- version() returns a long human readable string, hence we split from others SELECTs eg.
-- PostgreSQL 12.3 (Debian 12.3-1.pgdg100+1) on x86_64-pc-linux-gnu, compiled by gcc (Debian 8.3.0-6) 8.3.0, 64-bit
SELECT
  version(),
  current_setting('server_version') AS "server_version",
  current_setting('server_version_num') AS "server_version_num";

-- ========================================================================== --
--                          S e r v e r   D e t a i l s
-- ========================================================================== --

\echo
--\pset title 'PostgreSQL Server Details'

SELECT
  pg_postmaster_start_time(),
  pg_conf_load_time(),
  current_setting('logging_collector') AS "logging_collector",
  current_setting('log_destination') AS "log_destination",
  -- not available in Postgres 9
  -- doesn't work because it still checks if pg_current_logfile() is valid and neither eval or execute seem to work around this
  -- CASE WHEN current_setting('server_version_num')::int > 100000 THEN pg_current_logfile() ELSE NULL END as pg_current_logfile
  pg_current_logfile()
  -- current_setting('log_directory') AS "log_directory",  -- log
  -- current_setting('log_filename') AS "log_filename",    -- postgresql-%Y-%m-%d_%H%M%S.log
  -- not available on Postgres 10
  --pg_jit_available()
;

-- SELECT pg_reload_conf(), pg_rotate_logfile();

-- pg_sleep(1.5)
-- pg_sleep_for('5 minutes')
-- pg_sleep_until('tomorrow 03:00')

-- ======================================================
-- https://www.postgresql.org/docs/12/runtime-config.html

-- set runtime config at system, database, or user level, or even user level for a specific database (eg. for an ETL user to set different memory settings for use in a given DB)
-- ALTER SYSTEM SET timezone = 'UTC';
-- ALTER DATABASE test SET timezone = 'UTC';
-- ALTER USER hari SET timezone = 'UTC';
-- ALTER USER hari IN DATABASE test SET timezone = 'UTC';

-- session level:
-- SET myParam TO 'myValue';
-- UPDATE pg_settings SET setting = 'myValue' WHERE name = 'myParam';

-- \x
-- SELECT * from pg_settings;

-- SHOW ALL;
-- SHOW one_param;

\echo
--\pset title 'Config Files'

SELECT
  current_setting('config_file') AS "config_file",
  current_setting('hba_file') AS "hba_file",
  current_setting('ident_file') AS "ident_file";

\echo
--\pset title 'PostgreSQL Data Directory & Unix Sockets'

SELECT
  current_setting('data_directory') AS "data_directory",
  current_setting('unix_socket_directories') AS "unix_socket_directories",
  current_setting('unix_socket_permissions') AS "unix_socket_permissions",
  current_setting('unix_socket_group') AS "unix_socket_group";

-- ========================================================================== --
--                   B u f f e r s   &   C o n n e c t i o n s
-- ========================================================================== --

\echo
--\pset title 'Buffers & Connections'

SELECT
  current_setting('shared_buffers') AS "shared_buffers",
  current_setting('work_mem') AS "work_mem",
  current_setting('max_connections') AS "max_connections",
  current_setting('max_files_per_process') AS "max_files_per_process", -- should be less than ulimit nofiles to avoid “Too many open files” failures
  current_setting('track_activities') AS "track_activities", -- for pg_stat / pg_statio family of system views that are used in many other adjacent scripts
  current_setting('track_counts') AS "track_counts", -- needed for the autovacuum daemon
  current_setting('password_encryption') AS "password_encryption";


-- ========================================================================== --
--                                    U s e r
-- ========================================================================== --

\echo
--\pset title 'Users, Sessions & Queries'

-- in SQL the following have special syntax and should be called without parens: current_catalog, current_role, current_schema, current_user, session_user
SELECT
  current_user,  -- aka user, current_role - this is the effective user for permission checking
  session_user,  -- connection user before superuser SET SESSION AUTHORIZATION
  current_schema,
  current_catalog, -- SQL standard, same as current_database()
  pg_backend_pid(),
  current_query();

\echo
--\pset title 'Schema search list'

SELECT current_schemas(true) AS "current_schemas(true) - auto-searched schemas"; -- true to include implicit schemas eg. pg_catalog


-- ========================================================================== --
--                       B a c k u p   &   R e c o v e r y
-- ========================================================================== --

\echo
--\pset title 'Backup & Recovery'

SELECT
  pg_is_in_backup(),
  pg_is_in_recovery(),
  pg_backup_start_time(),
  'see postgres_recovery.sql for more info' AS "info";
  -- use postgres_recovery.sql instead of having a big blank table distracting us here
  -- the following recovery control functions can only be executed during recovery - to get just the above use postgres_funcs.sql
  --( CASE WHEN pg_is_in_recovery() THEN pg_is_wal_replay_paused() END)       AS "pg_is_wal_replay_paused()",
  --( CASE WHEN pg_is_in_recovery() THEN pg_last_wal_receive_lsn() END)       AS "pg_last_wal_receive_lsn()",
  --( CASE WHEN pg_is_in_recovery() THEN pg_last_wal_replay_lsn() END)        AS "pg_last_wal_replay_lsn()",
  --( CASE WHEN pg_is_in_recovery() THEN pg_last_xact_replay_timestamp() END) AS "pg_last_xact_replay_timestamp()"

--SELECT
--  pg_ls_logdir(),
--  pg_ls_waldir(),
--  pg_ls_archive_statusdir(),
--  pg_ls_tmpdir();


-- ========================================================================== --
--                                 N e t w o r k
-- ========================================================================== --

\echo
--\pset title 'Networking'

SELECT
  inet_client_addr(),
  inet_client_addr(),
  inet_server_addr(),
  inet_server_port();

-- causes 0 rows when mixed with other select funcs
--SELECT pg_listening_channels();


-- ========================================================================== --
--                             D a t e   &   T i m e
-- ========================================================================== --

-- CURRENT_TIME and CURRENT_TIMESTAMP deliver values with time zone; LOCALTIME and LOCALTIMESTAMP deliver values without time zone.
-- CURRENT_TIME, CURRENT_TIMESTAMP, LOCALTIME, and LOCALTIMESTAMP can optionally take a precision parameter, which causes the result to be rounded to that many fractional digits in the seconds field

\echo
--\pset title 'Date & Time'

SELECT
  -- current timestamps even inside transactions/functions
  now(),
  timeofday(),  -- human string timestamp with timezone

  -- at start of current transaction for consistency, includes +offset timezone
  current_timestamp(2) AS "current_timestamp(2)", -- secs precision of 2 decimal places, includes +offset timezone
  current_date,
  current_time(1) AS "current_time(1)", -- includes +offset timezone
  localtime,
  localtimestamp(1) AS "localtimestamp(1)",

  -- provide current timestamps even inside transactions/functions
  -- now()
  -- timeofday(),  -- human string timestamp with timezone
  clock_timestamp(), -- current date + time (changes throughout function)
  statement_timestamp(),
  transaction_timestamp()  -- same as CURRENT_TIMESTAMP
;

--\pset title
