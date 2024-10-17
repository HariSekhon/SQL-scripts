--
--  Author: Hari Sekhon
--  Date: 2024-10-18 01:25:03 +0400 (Fri, 18 Oct 2024)
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

-- Oracle - get the Tablespace DDL

SELECT
    -- USERS tablespace was case sensitive
    dbms_metadata.get_ddl('TABLESPACE','USERS')
FROM dual;
