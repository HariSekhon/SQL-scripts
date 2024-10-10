--
--  Author: Hari Sekhon
--  Date: 2020-08-06 00:18:01 +0100 (Thu, 06 Aug 2020)
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

-- PostgreSQL index cardinality with schema name
--
-- Tested on PostgreSQL 8.4, 9.x, 10.x 11.x, 12.x, 13.0

SELECT
    schema_name,
    relname,
    reltuples AS "cardinality (reltuples)",
    relpages
FROM (
    SELECT
        pg_catalog.pg_namespace.nspname AS schema_name,
        relname,
        reltuples,
        relpages
    FROM
        pg_class
    JOIN
        pg_namespace ON relnamespace = pg_namespace.oid
    WHERE
        relkind = 'i'
) t
WHERE
    schema_name NOT ILIKE 'pg_%'
      AND
    schema_name <> 'information_schema'
--    AND
--  relname LIKE 'someprefix%';
      AND
    relname NOT ILIKE 'pg_%'
ORDER BY
    3 DESC,
    schema_name,
    relname;
