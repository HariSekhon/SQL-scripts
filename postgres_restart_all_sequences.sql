--
--  Author: Hari Sekhon
--  Date: 2020-08-06 00:32:45 +0100 (Thu, 06 Aug 2020)
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

-- Restarts all PostgreSQL sequences
--
-- Tested on PostgreSQL 12.3

SELECT
  'ALTER SEQUENCE ' || relname || ' RESTART;'
FROM
  pg_class
WHERE
  relkind = 'S';
