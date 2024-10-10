--
--  Author: Hari Sekhon
--  Date: 2020-09-06 10:02:02 +0100 (Sun, 06 Sep 2020)
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

-- ran in 2 mins

-- better feature selection than model 1

CREATE OR REPLACE MODEL `ecommerce.classification_model_2`
OPTIONS (
    model_type='logistic_reg',
    labels = ['will_buy_on_return_visit']
) AS

-- training data provided below via SELECT statements

WITH all_visitor_stats AS (
    SELECT
        fullvisitorid,
        IF(COUNTIF(totals.transactions > 0 AND totals.newVisits IS NULL) > 0, 1, 0) AS will_buy_on_return_visit
        FROM `data-to-insights.ecommerce.web_analytics`
        GROUP BY fullvisitorid
)

-- select features
SELECT * EXCEPT(unique_session_id) FROM (

    SELECT
        CONCAT(fullvisitorid, CAST(visitId AS STRING)) AS unique_session_id,

        -- labels
        will_buy_on_return_visit,

        MAX(CAST(h.eCommerceAction.action_type AS INT64)) AS latest_ecommerce_progress,

        -- behavior on the site
        IFNULL(totals.bounces, 0) AS bounces,
        IFNULL(totals.timeOnSite, 0) AS time_on_site,
        totals.pageviews,

        -- where the visitor came from
        trafficSource.source,
        trafficSource.medium,
        channelGrouping,

        -- mobile or desktop
        device.deviceCategory,

        -- geographic
        IFNULL(geoNetwork.country, "") AS country

    FROM `data-to-insights.ecommerce.web_analytics`,
        UNNEST(hits) AS h

    JOIN
        all_visitor_stats
    USING
        (fullvisitorid)

    WHERE 1=1
        -- only predict for new visits
        AND totals.newVisits = 1
        -- train on subset of the data so we can test on the rest of the data
        AND date BETWEEN '20160801' AND '20170430'

    GROUP BY
      unique_session_id,
      will_buy_on_return_visit,
      bounces,
      time_on_site,
      totals.pageviews,
      trafficSource.source,
      trafficSource.medium,
      channelGrouping,
      device.deviceCategory,
      country
);
