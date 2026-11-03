-- Question: Teams Power Users
-- Link: https://datalemur.com/questions/teams-power-users
--
-- Problem (summary):
-- Find the top 2 Microsoft Teams power users who sent the most messages
-- in August 2022. Output their sender IDs and message counts,
-- sorted in descending order by count.
--
-- Table:
-- messages(
--   message_id   integer,
--   sender_id    integer,
--   receiver_id  integer,
--   content      varchar,
--   sent_date    datetime
-- )

-- Solution:
SELECT
    sender_id,
    COUNT(*) AS total
FROM messages
WHERE EXTRACT(YEAR FROM sent_date) = 2022
  AND EXTRACT(MONTH FROM sent_date) = 8
GROUP BY sender_id
ORDER BY total DESC
LIMIT 2;
