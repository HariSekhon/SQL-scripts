--
--  Author: Hari Sekhon
--  Date: 2020-08-08 09:54:19 +0100 (Sat, 08 Aug 2020)
--
--  vim:ts=4:sts=4:sw=4:et:filetype=sql
--
--  https://github.com/HariSekhon/SQL-scripts
--
--  License: see accompanying Hari Sekhon LICENSE file
--
--  If you're using my code you're welcome to connect with me on LinkedIn and optionally send me feedback to help steer this or other code I publish
--
--  https://www.linkedin.com/in/HariSekhon
--

-- MySQL views across schemas (useful for finding views)
--
-- Tested on MySQL 5.5, 5.6, 5.7, 8.0 and MariaDB 5.5, 10.0 - 10.5

SELECT
  -- table_catalog,
  table_schema,
  table_name,
  IS_UPDATABLE,
  DEFINER,
  SECURITY_TYPE
FROM
  information_schema.views
ORDER BY
  table_schema,
  table_name;
