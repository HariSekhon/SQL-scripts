--
--  Author: Hari Sekhon
--  Date: 2020-09-16 08:29:55 +0100 (Wed, 16 Sep 2020)
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
-- Lists datasets in a given project along with their description sorted by last modified time
--
-- Processes 20MB

SELECT
  s.*,
  TIMESTAMP_DIFF(CURRENT_TIMESTAMP(), creation_time, DAY) AS days_live,
  option_value AS dataset_description
FROM
  -- XXX: prefix INFORMATION_SCHEMA with your '<project_id>.'
  `INFORMATION_SCHEMA.SCHEMATA` AS s
  LEFT JOIN `INFORMATION_SCHEMA.SCHEMATA_OPTIONS` AS so
  USING (schema_name)
WHERE
	so.option_name = 'description'
ORDER BY
	last_modified_time DESC
LIMIT 15;
