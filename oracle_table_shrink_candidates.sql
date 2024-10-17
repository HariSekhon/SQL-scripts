--
--  Author: Hari Sekhon
--  Date: 2024-10-11 03:24:48 +0300 (Fri, 11 Oct 2024)
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

-- Oracle - Show Table Candidates to Move / Shrink in a given Tablespace
--
--          where the tables are over 20% utilized
--
-- Tested on Oracle 19c

SELECT
    segment_name,
    segment_type,
    ROUND(SUM(bytes)/1024/1024/1024, 2) AS size_gb
FROM
    dba_segments
WHERE
    tablespace_name = 'USERS' -- XXX: Edit
GROUP BY
    segment_name,
    segment_type
HAVING
    SUM(bytes)/1024/1024/1024 > 1
ORDER BY
    size_gb DESC;
