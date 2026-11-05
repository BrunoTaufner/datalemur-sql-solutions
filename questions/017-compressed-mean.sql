-- Question: Compressed Mean
-- Link: https://datalemur.com/questions/alibaba-compressed-mean
--
-- Problem (summary):
-- Given a table of how many items each order contained (item_count) and
-- how often that happened (order_occurrences), compute the mean number
-- of items per order, rounded to 1 decimal place.
--
-- Table:
-- items_per_order(
--   item_count         integer,
--   order_occurrences  integer
-- )

-- Solution:
SELECT
    ROUND(
        SUM(item_count::DECIMAL * order_occurrences)
        / SUM(order_occurrences),
        1
    ) AS mean
FROM items_per_order;
