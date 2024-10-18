--
--  Author: Hari Sekhon
--  Date: 2024-10-18 04:24:34 +0400 (Fri, 18 Oct 2024)
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

-- Oracle - Show Tablespace size of the Undo Tablespace
--
-- Tested on Oracle 19c

SELECT
    df.tablespace_name "Tablespace",
    df.bytes / (1024 * 1024 * 1024) "Size (GB)",
    (df.bytes - SUM(fs.bytes)) / (1024 * 1024 * 1024) "Used Space (GB)",
    ROUND(SUM(fs.bytes) / (1024 * 1024 * 1024), 2) "Free Space (GB)",
    ROUND(SUM(fs.bytes) / df.bytes * 100, 2) "Free Space %"
FROM
    dba_free_space fs,
    (SELECT
        tablespace_name,
        SUM(bytes) bytes
    FROM
        dba_data_files
    GROUP BY
        tablespace_name) df
WHERE
    fs.tablespace_name (+) = df.tablespace_name
        AND
    UPPER(fs.tablespace_name) LIKE '%UNDO%'
GROUP BY
     df.tablespace_name,
     df.bytes
ORDER BY
     "Free Space (GB)" DESC,
     "Used Space (GB)" DESC;
