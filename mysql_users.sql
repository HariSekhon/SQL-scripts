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
-- Tested on MySQL 8.0

SELECT
  host,
  user,
  max_connections,
  max_user_connections,
  password_expired,
  password_last_changed,
  password_lifetime,
  account_locked,
  password_reuse_time,
  password_require_current
FROM
  mysql.user
ORDER BY
  host,
  user;
