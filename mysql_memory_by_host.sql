--
--  Author: Hari Sekhon
--  Date: 2020-08-06 02:13:54 +0100 (Thu, 06 Aug 2020)
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

-- MySQL memory used per host
--
-- Requires MySQL 5.7+
-- Requires MariaDB N/A
--
-- Tested on MySQL 5.7, 8.0
--
-- sys doesn't exist in MySQL <= 5.6 or MariaDB 10.5

SELECT
  *
FROM
  sys.memory_by_host_by_current_bytes
WHERE
  host <> 'background'
ORDER BY
  total_allocated DESC;
