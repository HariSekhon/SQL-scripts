--
--  Author: Hari Sekhon
--  Date: 2020-08-06 00:23:40 +0100 (Thu, 06 Aug 2020)
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

-- PostgreSQL count of sessions in each state
--
-- Tested on PostgreSQL 12.3

SELECT
  count(1),
  state
FROM
  pg_stat_activity
GROUP BY
  state
ORDER BY
  1 DESC;
