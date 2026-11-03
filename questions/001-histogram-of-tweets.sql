-- Question: Histogram of Tweets
-- Link: https://datalemur.com/questions/sql-histogram-tweets
--
-- Problem (summary):
-- For each number of tweets posted per user in 2022, count how many
-- users posted that number. Each tweet count is a bucket.
--
-- Table:
-- tweets(
--   tweet_id   integer,
--   user_id    integer,
--   msg        string,
--   tweet_date timestamp
-- )

-- Solution:
WITH tweets_per_user AS (
    SELECT
        user_id,
        COUNT(*) AS tweet_bucket
    FROM tweets
    WHERE EXTRACT(YEAR FROM tweet_date) = 2022
    GROUP BY user_id
)
SELECT
    tweet_bucket,
    COUNT(*) AS users_num
FROM tweets_per_user
GROUP BY tweet_bucket
ORDER BY tweet_bucket;
