--
--  Author: Hari Sekhon
--  Date: 2020-08-06 11:36:42 +0100 (Thu, 06 Aug 2020)
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

-- PostgreSQL recovery info
--
-- Requires PostgreSQL 10+
--
-- Tested on PostgreSQL 10.x, 11.x, 12.x, 13.0

SELECT
    pg_is_in_backup(),
    pg_is_in_recovery(),
    pg_backup_start_time(),
    -- the following recovery control functions can only be executed during recovery - to get just the above use postgres_funcs.sql
    ( CASE WHEN pg_is_in_recovery() THEN pg_is_wal_replay_paused() END)       AS "pg_is_wal_replay_paused()",
    ( CASE WHEN pg_is_in_recovery() THEN pg_last_wal_receive_lsn() END)       AS "pg_last_wal_receive_lsn()",
    ( CASE WHEN pg_is_in_recovery() THEN pg_last_wal_replay_lsn() END)        AS "pg_last_wal_replay_lsn()",
    ( CASE WHEN pg_is_in_recovery() THEN pg_last_xact_replay_timestamp() END) AS "pg_last_xact_replay_timestamp()"
;
