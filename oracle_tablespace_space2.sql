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

-- Oracle - Show Tablespace Size, Space Used vs Free in GB and as a Percentage

SELECT
    tablespace_name "Tablespace",
    -- convert used_space in blocks to GB as each block is 8KB
    ROUND(used_space * 8 / 1024 / 1024, 2) AS "Used Space (GB)",
    -- convert tablespace_size in blocks to GB as each block is 8KB
    ROUND(tablespace_size * 8 / 1024 / 1024, 2) AS "Total Space (GB)",
    ROUND(used_percent, 2) AS "Used Space %"
FROM
    dba_tablespace_usage_metrics
ORDER BY
    "Used %"
DESC;
