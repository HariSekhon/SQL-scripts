--
--  Author: Hari Sekhon
--  Date: 2024-10-17 23:06:57 +0400 (Thu, 17 Oct 2024)
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

-- Oracle - Show User Sessions Using Temporary Tablespace
--
-- Check there are none before dropping an old temp tablespace file to avoid disruptions
--
-- Tested on Oracle 19c

SELECT
    s.sid,
    s.username,
    t.tablespace,
    t.blocks,
    t.segfile#,
    t.segblk#,
    t.contents,
    t.sql_id
FROM
    v$sort_usage t,
    v$session s
WHERE
    t.session_addr = s.saddr;
