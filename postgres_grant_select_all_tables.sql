--
--  Author: Hari Sekhon
--  Date: 2021-02-01 17:33:17 +0000 (Mon, 01 Feb 2021)
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

-- 3rd party ETL tools often need a postgres user account with SELECT on all tables in a database, and this also handles granting it to future tables
--
-- XXX: replace 'fivetran' with the postgres user account used by the 3rd party ETL tool
--
-- https://fivetran.com/docs/databases/postgresql/gcs-setup-guide?embed=true#grantreadonlyaccess
--
-- Requires PostgreSQL 9.0+
--
-- Tested on PostgreSQL 9.x, 10.x, 11.x, 12.x, 13.0

CREATE USER fivetran;

GRANT USAGE ON SCHEMA "public" TO fivetran;
GRANT SELECT ON ALL TABLES IN SCHEMA "public" TO fivetran;
ALTER DEFAULT PRIVILEGES IN SCHEMA "public" GRANT SELECT ON TABLES TO fivetran;
