--
--  Author: Hari Sekhon
--  Date: 2020-09-06 09:59:49 +0100 (Sun, 06 Sep 2020)
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

-- evaluate model1
--
-- get the score for the ROC area under curve to check the quality of prediction
--
-- poor ROC auc only ~ 0.7x score  - go to model 2

SELECT
  roc_auc,
  CASE
    WHEN roc_auc > .9 THEN 'good'
    WHEN roc_auc > .8 THEN 'fair'
    WHEN roc_auc > .7 THEN 'not great'
  ELSE 'poor' END AS model_quality,
  accuracy,
  precision,
  recall
FROM
  ML.EVALUATE(
    MODEL ecommerce.classification_model1, (

      -- the test data is supplied below via a SELECT query for the model to compare its predictions to (notice this is non-overlapping with the training data)

      SELECT
        * EXCEPT(fullVisitorId)
      FROM

        -- features
        (
          SELECT
            fullVisitorId,
            IFNULL(totals.bounces, 0) AS bounces,
            IFNULL(totals.timeOnSite, 0) AS time_on_site
          FROM
            `data-to-insights.ecommerce.web_analytics`
          WHERE
            totals.newVisits = 1
            -- notice this time period doesn't overlap with the training data
            AND date BETWEEN '20170501' AND '20170630'
        )
        JOIN
        (
          SELECT
            fullvisitorid,
            IF(COUNTIF(totals.transactions > 0 AND totals.newVisits IS NULL) > 0, 1, 0) AS will_buy_on_return_visit
          FROM
            `data-to-insights.ecommerce.web_analytics`
          GROUP BY
            fullvisitorid
        )
        USING (fullVisitorId)
    )
  );
