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
-- Tested on MySQL 8.0

SELECT
  *
FROM
  schema_unused_indexes
ORDER BY
  object_schema,
  object_name,
  index_name;
