--
--  Author: Hari Sekhon
--  Date: 2020-09-06 09:39:05 +0100 (Sun, 06 Sep 2020)
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

--  visitors who bought on a return visit (could have bought on first as well)
WITH all_visitor_stats AS (
SELECT
  fullvisitorid,
  IF(
    COUNTIF(totals.transactions > 0
    AND
    totals.newVisits IS NULL) > 0, 1, 0
    ) AS will_buy_on_return_visit
  FROM
    `data-to-insights.ecommerce.web_analytics`
  GROUP BY
    fullvisitorid
)

SELECT
  COUNT(DISTINCT fullvisitorid) AS total_visitors,
  will_buy_on_return_visit
FROM
  all_visitor_stats
GROUP BY
  will_buy_on_return_visit;
