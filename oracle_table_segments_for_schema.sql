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

-- Oracle - Show Tables' Segments Size in a given Tablespace
--
-- Tested on Oracle 19c

SELECT
    segment_name,
    segment_type,
    tablespace_name,
    bytes/1024/1024/1024 AS size_gb,
    blocks
FROM
    dba_segments
WHERE
    owner = 'USERS'  -- XXX: Edit this
        AND
    segment_type = 'TABLE'
        AND
    blocks > 8
    -- to look at only specific tables
    --  AND
    --segment_name IN
    --('MY_TABLE_1',
    -- 'MY_TABLE_2',
    -- 'MY_TABLE_3',
    -- 'MY_TABLE_4')
ORDER BY
    size_gb DESC;
