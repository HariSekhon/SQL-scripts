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

-- Oracle - Show Tablespace

SELECT
    df.tablespace_name "Tablespace",
    df.bytes / (1024 * 1024 * 1024) "Size (GB)",
    (df.bytes - SUM(fs.bytes)) / (1024 * 1024 * 1024) "Used (GB)",
    SUM(fs.bytes) / (1024 * 1024 * 1024) "Free (GB)",
    ROUND(SUM(fs.bytes) / df.bytes * 100, 2) "Free %"
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
GROUP BY
     df.tablespace_name,
     df.bytes
ORDER BY
     "Free %";
