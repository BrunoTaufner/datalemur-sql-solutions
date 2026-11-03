-- Question: Page With No Likes
-- Link: https://datalemur.com/questions/sql-page-with-no-likes
--
-- Problem (summary):
-- Return the IDs of the Facebook pages that have zero likes,
-- sorted in ascending order by page ID.
--
-- Tables:
-- pages(
--   page_id   integer,
--   page_name varchar
-- )
-- page_likes(
--   user_id  integer,
--   page_id  integer,
--   liked_date datetime
-- )

-- Solution:
WITH total_likes AS (
    SELECT
        a.page_id,
        SUM(CASE WHEN b.page_id IS NULL THEN 0 ELSE 1 END) AS likes
    FROM pages a
    LEFT JOIN page_likes b
        ON a.page_id = b.page_id
    GROUP BY a.page_id
)
SELECT
    page_id
FROM total_likes
WHERE likes = 0
ORDER BY page_id;
