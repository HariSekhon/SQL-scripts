--
--  Author: Hari Sekhon
--  Date: 2020-09-16 08:44:33 +0100 (Wed, 16 Sep 2020)
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

-- BigQuery Information Schema
--
-- Lists partitioned and/or clustered columns in a dataset
--
-- Processes 10MB of data when run


SELECT
    *
FROM
    -- XXX: replace bigquery-public-data.github_repos with myproject.mydataset
    `bigquery-public-data.github_repos.INFORMATION_SCHEMA.COLUMNS`
WHERE
    is_partitioning_column = 'YES'
      OR
    clustering_ordinal_position IS NOT NULL;
