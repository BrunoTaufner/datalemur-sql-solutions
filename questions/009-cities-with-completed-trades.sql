-- Question: Cities With Completed Trades
-- Link: https://datalemur.com/questions/completed-trades
--
-- Problem (summary):
-- Find the top 3 cities with the highest number of completed trade orders,
-- sorted in descending order by order count.
--
-- Tables:
-- trades(
--   order_id   integer,
--   user_id    integer,
--   quantity   integer,
--   status     string ('Completed', 'Cancelled'),
--   date       timestamp,
--   price      decimal(5,2)
-- )
-- users(
--   user_id    integer,
--   city       string,
--   email      string,
--   signup_date datetime
-- )

-- Solution:
SELECT users.city, COUNT(trades.order_id) AS total_orders
FROM trades
LEFT JOIN users
ON trades.user_id = users.user_id
WHERE trades.status = 'Completed'
GROUP BY users.city
ORDER BY COUNT(trades.order_id) DESC
LIMIT 3;
