--
--  Author: Hari Sekhon
--  Date: 2020-08-05 18:16:55 +0100 (Wed, 05 Aug 2020)
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

-- List PostgreSQL Locks
--
-- Tested on PostgreSQL 8.4, 9.x, 10.x, 11.x, 12.x, 13.0

-- https://wiki.postgresql.org/wiki/Lock_Monitoring

SELECT
  t.schemaname,
  t.relname,
  -- l.database, -- id number is less useful, take schemaname from join instead
  l.locktype,
  page,
  virtualtransaction,
  pid,
  mode,
  granted
FROM
  pg_locks l,
  --pg_stat_user_tables t
  pg_stat_all_tables t
WHERE
  l.relation = t.relid
ORDER BY
  relation ASC;

SELECT
  relation::regclass AS relation_regclass,
  *
FROM
  pg_locks
WHERE
  NOT granted;
