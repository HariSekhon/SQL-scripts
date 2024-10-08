--
--  Author: Hari Sekhon
--  Date: 2020-08-05 18:34:44 +0100 (Wed, 05 Aug 2020)
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

-- List PostgreSQL stale connections that have been idle > 10 mins
--
-- Can be used to kill connections using the procpids returned, eg.
--
-- SELECT pg_terminate_backend(procpid)
--
-- Requires PostgreSQL <= 9.1
--
-- Tested on PostgreSQL 8.4, 9.0, 9.1

SELECT
    rank() over (partition by client_addr order by backend_start ASC) as rank,
    procpid,
    backend_start,
    query_start,
    waiting,
    datname,
    usename,
    client_addr
FROM
    pg_stat_activity
WHERE
    -- don't kill yourself
    procpid <> pg_backend_pid()
    --  AND
    -- don't kill your admin tools
    --application_name !~ '(?:psql)|(?:pgAdmin.+)'
    --  AND
    --usename not in ('postgres')
        AND
    current_query in ('')
        AND
    (
      (current_timestamp - query_start) > interval '10 minutes'
          OR
      (query_start IS NULL AND (current_timestamp - backend_start) > interval '10 minutes')
    )
;
