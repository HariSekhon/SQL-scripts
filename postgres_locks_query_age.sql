--
--  Author: Hari Sekhon
--  Date: 2020-08-07 00:47:45 +0100 (Fri, 07 Aug 2020)
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

-- PostgreSQL locks with query and age
--
-- Requires PostgreSQL 9.2+
--
-- Tested on PostgreSQL 9.2+, 10.x, 11.x, 12.x

-- https://wiki.postgresql.org/wiki/Lock_Monitoring

SELECT
	a.datname,
  l.relation::regclass,
  l.transactionid,
  l.mode,
  l.GRANTED,
  a.usename,
  a.query,
  a.query_start,
  age(now(), a.query_start) AS "age",
  a.pid
FROM
	pg_stat_activity a
JOIN
	pg_locks l
ON
	l.pid = a.pid
ORDER BY
	a.query_start;
