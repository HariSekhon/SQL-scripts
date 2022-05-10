--
--  Author: Hari Sekhon
--  Date: 2020-08-06 18:07:25 +0100 (Thu, 06 Aug 2020)
--
--  vim:ts=2:sts=2:sw=2:et:filetype=sql
--
--  https://github.com/HariSekhon/SQL-scripts
--
--  License: see accompanying Hari Sekhon LICENSE file
--
--  If you're using my code you're welcome to connect with me on LinkedIn and optionally send me feedback to help steer this or other code I publish
--
--  https://www.linkedin.com/in/HariSekhon
--

-- Show PostgreSQL version and platform compatibility settings
--
-- eg. backslash_quote, escape_string_warning, transform_null_equals
--
-- Requires PostgreSQL 9.5+
--
-- Tested on PostgreSQL 9.5, 9.6, 10.x 11.x, 12.x, 13.0

-- https://www.postgresql.org/docs/12/runtime-config-compatible.html

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
  -- Version and Platform Compatibility / Previous PostgreSQL Versions
  -- Version and Platform Compatibility / Other Platforms and Clients
  category ILIKE '%Compatibility%';
