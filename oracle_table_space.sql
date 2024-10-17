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

-- Oracle - Show Tables' Space Used vs Free and Percentage Percentage where they are at lease 20% utilized
--
-- Tested on Oracle 19c

SELECT
    owner,
    table_name,
    -- each block is 8KB, multiply it to GB, round to two decimal places
    ROUND(blocks * 8 / 1024 / 1024, 2) AS total_gb,
    -- estimate data size from rows vs average row size, round to two decimal places
    ROUND(num_rows * avg_row_len / 1024 / 1024 / 1024, 2) AS actual_data_gb,
    -- estimate free space by subtracting the two above calculations
    ROUND((blocks * 8 / 1024 / 1024) - (num_rows * avg_row_len / 1024 / 1024 / 1024), 2) AS free_space_gb,
    -- calculate free space percentage from the above three calculations
    ROUND(
        ( (blocks * 8 / 1024 / 1024) - (num_rows * avg_row_len / 1024 / 1024 / 1024) ) /
        (blocks * 8 / 1024 / 1024) * 100, 2) AS free_space_pct
FROM
    dba_tables
WHERE
    blocks > 0
        AND
    num_rows > 0
        AND
    ((blocks * 8 / 1024 / 1024) - (num_rows * avg_row_len / 1024 / 1024 / 1024)) /
    (blocks * 8 / 1024 / 1024) > 0.2  -- TUNE: currently only showing tables with over 20% free space
        AND
    owner NOT IN
      ('SYS', 'SYSTEM', 'SYSAUX', 'RDSADMIN')
ORDER BY
    free_space_gb DESC,
    total_gb DESC;
