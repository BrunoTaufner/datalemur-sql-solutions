-- Question: App Click-through Rate (CTR)
-- Link: https://datalemur.com/questions/click-through-rate
--
-- Problem (summary):
-- Calculate the click-through rate (CTR) for each app in 2022,
-- rounded to 2 decimal places.
-- CTR = 100.0 * number of clicks / number of impressions.
--
-- Table:
-- events(
--   app_id      integer,
--   event_type  string ('impression', 'click'),
--   timestamp   datetime
-- )

-- Solution:
SELECT
    app_id,
    ROUND(
        100.0 *
        SUM(CASE WHEN event_type = 'click' THEN 1 ELSE 0 END) /
        SUM(CASE WHEN event_type = 'impression' THEN 1 ELSE 0 END),
        2
    ) AS ctr_rate
FROM events
WHERE timestamp >= '2022-01-01'
  AND timestamp < '2023-01-01'
GROUP BY app_id;
