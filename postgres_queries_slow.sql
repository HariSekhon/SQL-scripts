--
--  Author: Hari Sekhon
--  Date: 2020-08-05 17:24:59 +0100 (Wed, 05 Aug 2020)
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

-- PostgreSQL queries currently executing that have taken over 30 secs
--
-- a current snapshot alternative to slow query log
--
-- Requires PostgreSQL 9.6+ (see postgres_queries_slow_pre96.sql and postgres_queries_slow_pre92.sql)
--
-- Tested on PostgreSQL 9.6+, 10x, 11.x, 12.x, 13.0

SELECT
    now() - query_start as "runtime",
    usename,
    datname,
    -- not available on PostgreSQL < 9.6
    wait_event,
    -- not available on PostgreSQL < 9.2
    state,
    -- current_query on PostgreSQL < 9.2
    query
FROM
    pg_stat_activity
WHERE
    -- can't use 'runtime' here
    now() - query_start > '30 seconds'::interval
ORDER BY
    runtime DESC;
