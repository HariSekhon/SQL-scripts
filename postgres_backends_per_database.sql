--
--  Author: Hari Sekhon
--  Date: 2020-08-17 20:17:18 +0100 (Mon, 17 Aug 2020)
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

-- PostgreSQL number of backends connected to each database
--
-- Tested on PostgreSQL 8.4, 9.x, 10.x, 11.x, 12.x, 13.0

SELECT
  datname,
  numbackends
FROM
  pg_catalog.pg_stat_database
ORDER BY
  numbackends DESC,
  datname ASC;
