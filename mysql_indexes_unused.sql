--
--  Author: Hari Sekhon
--  Date: 2020-08-06 02:41:02 +0100 (Thu, 06 Aug 2020)
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

-- MySQL unused indexes
--
-- Requires MySQL 5.7+
-- Requires MariaDB N/A
--
-- Tested on MySQL 5.7, 8.0
--
-- sys doesn't exist in MySQL <= 5.6 or MariaDB 10.5

-- requires Performance Schema to be enabled
--
-- in my.cnf:
--
-- [mysqld]
-- performance_schema=ON
--
-- 1 = true, 0 = false
SELECT IF (@@performance_schema, 'TRUE', 'FALSE') AS 'Performance Schema enabled';

SELECT
  *
FROM
  sys.schema_unused_indexes
ORDER BY
  object_schema,
  object_name,
  index_name;
