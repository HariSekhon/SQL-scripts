--
--  Author: Hari Sekhon
--  Date: 2020-02-02 00:37:06 +0000 (Sun, 02 Feb 2020)
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

-- BigQuery Billing Query
--
-- most frequently used products costing more than 1 dollar

SELECT
    product,
    COUNT(*) AS billing_records
FROM
    `myproject.mydataset.imported_billing_data`
WHERE
    cost > 1
GROUP BY
    product
ORDER BY
    billing_records DESC;
