--
--  Author: Hari Sekhon
--  Date: 2020-09-16 08:41:30 +0100 (Wed, 16 Sep 2020)
--
--  vim:ts=2:sts=2:sw=2:et:filetype=sql
--
--  https://github.com/HariSekhon/sql
--
--  License: see accompanying Hari Sekhon LICENSE file
--
--  If you're using my code you're welcome to connect with me on LinkedIn and optionally send me feedback to help steer this or other code I publish
--
--  https://www.linkedin.com/in/HariSekhon
--

-- BigQuery Information Schema
--
-- Lists columns and their details in a given dataset
--
-- Processes 10MB of data when run


SELECT
  table_catalog,
  table_schema,
  table_name,
  column_name,
  ordinal_position,
  is_nullable,
  data_type,
  is_generated,
  generation_expression,
  is_stored,
  is_hidden,
  is_updatable,
  is_system_defined,
  is_partitioning_column,
  clustering_ordinal_position
FROM
  -- XXX: replace bigquery-public-data.github_repos with myproject.mydataset
 `bigquery-public-data.github_repos.INFORMATION_SCHEMA.COLUMNS`;
