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
    COUNT(*) AS message_count
FROM messages
WHERE sent_date >= '2022-08-01'
  AND sent_date < '2022-09-01'
GROUP BY sender_id
ORDER BY message_count DESC
LIMIT 2;
