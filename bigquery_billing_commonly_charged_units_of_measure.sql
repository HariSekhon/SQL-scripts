--
--  Author: Hari Sekhon
--  Date: 2020-02-02 00:37:06 +0000 (Sun, 02 Feb 2020)
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

-- BigQuery Billing Query - commonly charged units of measure

SELECT
  usage_unit,
  COUNT(*) AS billing_records
FROM
  `myproject.mydata.imported_billing_data`
WHERE
  cost > 0
GROUP BY
  usage_unit
ORDER BY
  billing_records DESC;
