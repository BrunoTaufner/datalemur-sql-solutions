-- Question: Average Post Hiatus (Part 1)
-- Link: https://datalemur.com/questions/sql-average-post-hiatus-1
--
-- Problem (summary):
-- For each user who posted at least twice in 2021, find the number of
-- days between their first and last post of the year.
-- Output: user_id, days_between.
--
-- Table:
-- posts(
--   user_id      integer,
--   post_id      integer,
--   post_content text,
--   post_date    timestamp
-- )

-- Solution:
SELECT
    user_id,
    MAX(post_date)::date - MIN(post_date)::date AS days_between
FROM posts
WHERE EXTRACT(YEAR FROM post_date) = 2021
GROUP BY user_id
HAVING COUNT(*) > 1;
