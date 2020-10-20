--
--  Author: Hari Sekhon
--  Date: 2020-10-20 11:01:44 +0100 (Tue, 20 Oct 2020)
--
--  vim:ts=2:sts=2:sw=2:et:filetype=sql
--
--  https://github.com/HariSekhon/sql
--
--  License: see accompanying Hari Sekhon LICENSE file
--
--  If you're using my code you're welcome to connect with me on LinkedIn and optionally send me feedback to help steer this or other code I publish
--
--  https://www.linkedin.com/in/HariSekhon
--

-- Finds PostgreSQL columns that contain only NULLs
--
-- Tested on PostgreSQL 8.4, 9.x, 10.x, 11.x, 12.x, 13.0


SELECT
  nspname,
  relname,
  attname,
  typname,
  (stanullfrac*100)::int AS null_percent
FROM
  pg_class c
JOIN
  pg_namespace ns
ON
  (ns.oid=relnamespace)
JOIN
  pg_attribute
ON
  (c.oid=attrelid)
JOIN
  pg_type t
ON
  (t.oid=atttypid)
JOIN
  pg_statistic
ON
  (c.oid=starelid AND staattnum=attnum)
WHERE
  (stanullfrac*100)::int = 100
    AND
  nspname NOT LIKE E'pg\\_%'
    AND
  nspname != 'information_schema'
    AND
  relkind = 'r'
    AND
  NOT attisdropped
    AND
  attstattarget != 0
  --  AND
  --reltuples >= 100
ORDER BY
  nspname,
  relname,
  attname;
