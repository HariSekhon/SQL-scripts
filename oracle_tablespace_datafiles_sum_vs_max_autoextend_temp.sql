--
--  Author: Hari Sekhon
--  Date: 2024-10-18 01:18:50 +0400 (Fri, 18 Oct 2024)
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

-- Oracle - Temp Tablespace Datafiles Sum vs Max and AutoExtend


SELECT
    tablespace_name,
    ROUND(SUM(BYTES)/(1024*1024*1024),2) Total_GB,
    ROUND(MAXBYTES/(1024*1024*1024),2) Max_GB,
    autoextensible
FROM
    dba_temp_files
GROUP BY
    tablespace_name,
    maxbytes,
    autoextensible;
