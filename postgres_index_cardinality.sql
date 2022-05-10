--
--  Author: Hari Sekhon
--  Date: 2020-08-06 00:18:01 +0100 (Thu, 06 Aug 2020)
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

-- PostgreSQL index cardinality
--
-- Tested on PostgreSQL 8.4, 9.x, 10.x, 11.x, 12.x, 13.0

SELECT
  relname,
  --relkind,
  reltuples AS "cardinality (reltuples)",
  relpages
FROM
  pg_class
WHERE
  relkind = 'i'
--    AND
--  relname LIKE 'someprefix%';
    AND
  relname NOT ILIKE 'pg_%'
ORDER BY
  2 DESC;
