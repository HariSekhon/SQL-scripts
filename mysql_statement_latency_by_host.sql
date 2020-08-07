--
--  Author: Hari Sekhon
--  Date: 2020-08-06 01:51:14 +0100 (Thu, 06 Aug 2020)
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

-- MySQL statement latency stats per host
--
-- Tested on MySQL 8.0

SELECT
  *
FROM
  -- sys doesn't exist in MariaDB 10.5
  sys.host_summary_by_statement_latency
ORDER BY
  total_latency DESC;
