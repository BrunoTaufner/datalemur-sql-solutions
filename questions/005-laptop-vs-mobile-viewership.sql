-- Question: Laptop vs. Mobile Viewership
-- Link: https://datalemur.com/questions/laptop-mobile-viewership
--
-- Problem (summary):
-- Calculate the number of views on laptops and on mobile devices,
-- where mobile is the sum of tablet and phone views.
-- Output: laptop_views, mobile_views.
--
-- Table:
-- viewership(
--   user_id     integer,
--   device_type string ('laptop', 'tablet', 'phone'),
--   view_time   timestamp
-- )

-- Solution:
WITH agg_devices AS (
    SELECT
        user_id,
        device_type
    FROM viewership
    GROUP BY user_id, device_type
)
SELECT
    SUM(CASE WHEN device_type = 'laptop' THEN 1 END) AS laptop_views,
    SUM(CASE WHEN device_type != 'laptop' THEN 1 END) AS tablet_views
FROM agg_devices;
