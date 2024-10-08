--
--  Author: Hari Sekhon
--  Date: 2020-08-06 00:32:45 +0100 (Thu, 06 Aug 2020)
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

-- Restarts all PostgreSQL sequences
--
-- Tested on PostgreSQL 8.4, 9.x, 10.x, 11.x, 12.x, 13.0

SELECT
    'ALTER SEQUENCE ' || relname || ' RESTART;'
FROM
    pg_class
WHERE
    relkind = 'S';
