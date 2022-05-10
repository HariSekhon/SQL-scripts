--
--  Author: Hari Sekhon
--  Date: 2020-09-06 09:22:11 +0100 (Sun, 06 Sep 2020)
--
--  vim:ts=2:sts=2:sw=2:et:filetype=sql
--
--  https://github.com/HariSekhon/SQL-scripts
--
--  License: see accompanying Hari Sekhon LICENSE file
--
--  If you're using my code you're welcome to connect with me on LinkedIn and optionally send me feedback to help steer this or other code I publish
--
--  https://www.linkedin.com/in/HariSekhon
--

WITH visitors AS(
  SELECT
  COUNT(DISTINCT fullVisitorId) AS total_visitors
  FROM `data-to-insights.ecommerce.web_analytics`
),

purchasers AS(
  SELECT
  COUNT(DISTINCT fullVisitorId) AS total_purchasers
  FROM `data-to-insights.ecommerce.web_analytics`
  WHERE totals.transactions IS NOT NULL
)

SELECT
  total_visitors,
  total_purchasers,
  total_purchasers / total_visitors AS conversion_rate,
  ROUND(total_purchasers / total_visitors * 100, 2) AS conversion_percentage
FROM
  visitors,
  purchasers
;
