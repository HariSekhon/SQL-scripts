--
--  Author: Hari Sekhon
--  Date: 2020-08-05 15:33:36 +0100 (Wed, 05 Aug 2020)
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

-- PostgreSQL number of active queries
--
-- If COUNT consistently > CPU Cores, then upgrade/scale
--
-- Requires PostgreSQL >= 9.2 for state column in pg_stat_activity
--
-- Tested on PostgreSQL 9.2+, 10.x, 11.x, 12.x, 13.0

SELECT
    COUNT(*) as active_query_count
FROM
    pg_stat_activity
WHERE
    state='active';
