--
--  Author: Hari Sekhon
--  Date: 2020-08-06 02:45:44 +0100 (Thu, 06 Aug 2020)
--
--  vim:ts=2:sts=2:sw=2:et:filetype=sql
--
--  https://github.com/harisekhon/sql
--
--  License: see accompanying Hari Sekhon LICENSE file
--
--  If you're using my code you're welcome to connect with me on LinkedIn and optionally send me feedback to help steer this or other code I publish
--
--  https://www.linkedin.com/in/HariSekhon
--

-- MySQL system views
--
-- Tested on MySQL 5.5, 5.6, 5.7, 8.0 and MariaDB 5.5, 10.0 - 10.5

SELECT
  table_schema,
  table_name,
  table_type,
  engine,
  table_rows,
  avg_row_length,
  data_length,
  max_data_length,
  index_length,
  data_free,
  auto_increment,
  create_time,
  update_time,
  table_comment
FROM
  information_schema.tables
WHERE
  table_type = 'SYSTEM VIEW'
ORDER BY
  table_schema,
  table_name;
