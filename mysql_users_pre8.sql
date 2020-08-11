--
--  Author: Hari Sekhon
--  Date: 2020-08-06 09:51:00 +0100 (Thu, 06 Aug 2020)
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

-- List MySQL users ordered by host, user similar to auth resolution
--
-- Requires MySQL 5.6+
--
-- Tested on MySQL 5.6, 5.7, 8.0 and MariaDB 10.0 - 10.5

SELECT
  host,
  user,
  max_connections,
  max_user_connections,
  -- not available on MySQL 5.5
  password_expired
  -- these fields don't exist in MySQL < 8.0 / MariaDB 10
  -- password_last_changed,
  -- password_lifetime,
  -- account_locked,
  -- password_reuse_time,
  -- password_require_current
FROM
  mysql.user
ORDER BY
  host,
  user;
