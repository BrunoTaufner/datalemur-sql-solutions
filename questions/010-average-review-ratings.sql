-- Question: Average Review Ratings
-- Link: https://datalemur.com/questions/sql-avg-review-ratings
--
-- Problem (summary):
-- For each month and product, calculate the average review rating
-- (stars), rounded to 2 decimal places. Output the month, product ID
-- and average rating, sorted by month and then product ID.
--
-- Table:
-- reviews(
--   review_id    integer,
--   user_id      integer,
--   submit_date  datetime,
--   product_id   integer,
--   stars        integer (1-5)
-- )

-- Solution:
SELECT
    EXTRACT(MONTH FROM submit_date) AS mth,
    product_id,
    ROUND(AVG(stars), 2) AS avg_stars
FROM reviews
GROUP BY
    EXTRACT(MONTH FROM submit_date),
    product_id
ORDER BY
    mth,
    product_id;
