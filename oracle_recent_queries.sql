--
--  Author: Hari Sekhon
--  Date: 2024-10-12 06:17:50 +0300 (Sat, 12 Oct 2024)
--
--  vim:ts=4:sts=4:sw=4:et:filetype=sql
--
--  https///github.com/HariSekhon/SQL-scripts
--
--  License: see accompanying Hari Sekhon LICENSE file
--
--  If you're using my code you're welcome to connect with me on LinkedIn and optionally send me feedback to help steer this or other code I publish
--
--  https://www.linkedin.com/in/HariSekhon
--

-- Oracle - Show Recent Queries
--
-- Tested on Oracle 19c

SELECT
    sql_text,
    executions
FROM
    v$sql
ORDER BY
    last_active_time
DESC;
