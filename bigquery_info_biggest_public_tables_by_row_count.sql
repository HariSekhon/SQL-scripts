--
--  Author: Hari Sekhon
--  Date: 2020-09-16 08:48:42 +0100 (Wed, 16 Sep 2020)
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
-- Lists Top 10 tables from a list of public projects by their row count

-- For a script that auto-generates this SQL for all datasets in the current project, see
--
--     bigquery_generate_query_biggest_tables_across_datasets_by_row_count.sh
--     bigquery_generate_query_biggest_tables_across_datasets_by_size.sh
--
-- in the DevOps Bash tools repo:
--
--     https://github.com/HariSekhon/DevOps-Bash-tools

-- Unfortunately we can't do this trick for the bigquery-public-data project because of this error:
--
-- bq ls -j bigquery-public-data
--
-- BigQuery error in ls operation: Access Denied: Project bigquery-public-data: User does not have bigquery.jobs.list permission in project bigquery-public-data.

WITH ALL__TABLES__ AS (
    SELECT * FROM `bigquery-public-data.baseball.__TABLES__` UNION ALL
    SELECT * FROM `bigquery-public-data.bls.__TABLES__` UNION ALL
    SELECT * FROM `bigquery-public-data.census_bureau_usa.__TABLES__` UNION ALL
    SELECT * FROM `bigquery-public-data.cloud_storage_geo_index.__TABLES__` UNION ALL
    SELECT * FROM `bigquery-public-data.cms_codes.__TABLES__` UNION ALL
    SELECT * FROM `bigquery-public-data.fec.__TABLES__` UNION ALL
    SELECT * FROM `bigquery-public-data.genomics_cannabis.__TABLES__` UNION ALL
    SELECT * FROM `bigquery-public-data.ghcn_d.__TABLES__` UNION ALL
    SELECT * FROM `bigquery-public-data.ghcn_m.__TABLES__` UNION ALL
    SELECT * FROM `bigquery-public-data.github_repos.__TABLES__` UNION ALL
    SELECT * FROM `bigquery-public-data.hacker_news.__TABLES__` UNION ALL
    SELECT * FROM `bigquery-public-data.irs_990.__TABLES__` UNION ALL
    SELECT * FROM `bigquery-public-data.medicare.__TABLES__` UNION ALL
    SELECT * FROM `bigquery-public-data.new_york.__TABLES__` UNION ALL
    SELECT * FROM `bigquery-public-data.nlm_rxnorm.__TABLES__` UNION ALL
    SELECT * FROM `bigquery-public-data.noaa_gsod.__TABLES__` UNION ALL
    SELECT * FROM `bigquery-public-data.open_images.__TABLES__` UNION ALL
    SELECT * FROM `bigquery-public-data.samples.__TABLES__` UNION ALL
    SELECT * FROM `bigquery-public-data.san_francisco.__TABLES__` UNION ALL
    SELECT * FROM `bigquery-public-data.stackoverflow.__TABLES__` UNION ALL
    SELECT * FROM `bigquery-public-data.usa_names.__TABLES__` UNION ALL
    SELECT * FROM `bigquery-public-data.utility_us.__TABLES__`
)
SELECT
    project_id,
    dataset_id,
    table_id,
    row_count,
    ROUND(size_bytes/pow(10,9),2) as size_gb,
    TIMESTAMP_MILLIS(creation_time) AS creation_time,
    TIMESTAMP_MILLIS(last_modified_time) as last_modified_time,
    CASE
        WHEN type = 1 THEN 'table'
        WHEN type = 2 THEN 'view'
    ELSE NULL
    END AS type
FROM
    ALL__TABLES__
ORDER BY
    row_count DESC,
    size_gb DESC
LIMIT 10;
