--
--  Author: Hari Sekhon
--  Date: 2020-08-07 01:00:25 +0100 (Fri, 07 Aug 2020)
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

-- MySQL databases by size descending
--
-- Tested on MySQL 5.5, 5.6, 5.7, 8.0 and MariaDB 5.5, 10.0 - 10.5

SELECT
  table_schema,
  ROUND(SUM(data_length + index_length) / 1024 / 1024, 3) AS 'Database Size (MB)',
  ROUND(SUM(data_free) / 1024 / 1024, 3) AS 'Free Space (MB)'
FROM
  information_schema.tables
GROUP BY
  table_schema
ORDER BY
  2 DESC;
