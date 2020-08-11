--
--  Author: Hari Sekhon
--  Date: 2020-08-06 18:07:25 +0100 (Thu, 06 Aug 2020)
--
--  vim:ts=2:sts=2:sw=2:et:filetype=sql
--
--  https://github.com/harisekhon/sql
--
--  License: see accompanying Hari Sekhon LICENSE file
--
--  If you're using my code you're welcome to connect with me on LinkedIn and optionally send me feedback to help steer this or other code I publish
--
--  https://www.linkedin.com/in/harisekhon
--

-- Show PostgreSQL authentication settings eg. password_encryption, krb_server_keyfile
--
-- Requires PostgreSQL 9.5+
--
-- Tested on PostgreSQL 9.5, 9.6, 10.x 11.x, 12.x

-- https://www.postgresql.org/docs/12/runtime-config-connection.html#RUNTIME-CONFIG-CONNECTION-AUTHENTICATION

SELECT
  name,
  setting,
  -- category,
  vartype,
  short_desc,
  -- enumvals,
  source,
  min_val,
  max_val,
  boot_val,
  reset_val,
  -- not available on PostgreSQL < 9.5
  pending_restart
FROM
  pg_settings
WHERE
  -- Connections and Authentication / Authentication
  category ILIKE '% / Authentication%';
