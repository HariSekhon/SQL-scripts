--
--  Author: Hari Sekhon
--  Date: 2020-08-05 15:08:23 +0100 (Wed, 05 Aug 2020)
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

-- PostgreSQL % of times indexes are used on tables by table size descending (might want to tweak to list by % descending)
--
-- If not near 99% index usage on tables > 10,000 rows, consider adding an index to match your query patterns (CREATE INDEX CONCURRENTLY in prod to avoid locking table)
--
-- Tested on PostgreSQL 8.4, 9.x, 10.x, 11.x, 12.x, 13.0

SELECT
    relname AS table,
    100 * idx_scan / GREATEST(seq_scan + idx_scan, 1) AS percent_of_times_index_used,
    n_live_tup AS rows_in_table
FROM
    pg_stat_user_tables
WHERE
    seq_scan + idx_scan > 0
ORDER BY
    rows_in_table DESC,
    percent_of_times_index_used DESC;
