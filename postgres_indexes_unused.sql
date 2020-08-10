--
--  Author: Hari Sekhon
--  Date: 2020-08-05 23:48:47 +0100 (Wed, 05 Aug 2020)
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

-- PostgreSQL unused indexes
--
-- Tested on PostgreSQL 8.4, 9.x, 10.x, 11.x, 12.x

SELECT
  relname AS table,
  indexrelname AS index,
  idx_scan,
  idx_tup_read,
  idx_tup_fetch,
  pg_size_pretty(pg_relation_size(indexrelname::regclass))
FROM
  pg_stat_all_indexes
WHERE
  schemaname = 'public'
    AND
  idx_scan = 0
    AND
  idx_tup_read = 0
    AND
  idx_tup_fetch = 0
ORDER BY
  pg_relation_size(indexrelname::regclass) DESC;
