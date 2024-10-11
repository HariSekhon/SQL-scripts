--
--  Author: Hari Sekhon
--  Date: 2024-10-11 03:50:00 +0300 (Fri, 11 Oct 2024)
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

-- Oracle - Show All Users Recyclebins via DBA Recyclebin

SELECT
    username,
    original_name,
    type,
    drop_time,
    is_parent,
    recyclebin_name
FROM
    dba_recyclebin
ORDER BY
    username, drop_time
DESC;
