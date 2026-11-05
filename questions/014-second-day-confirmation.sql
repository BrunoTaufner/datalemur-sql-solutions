-- Question: Second Day Confirmation
-- Link: https://datalemur.com/questions/second-day-confirmation
--
-- Problem (summary):
-- Find the user IDs of those who did not confirm their sign-up on the
-- first day, but confirmed on the second day (the day after signing up).
--
-- Tables:
-- emails(
--   email_id     integer,
--   user_id      integer,
--   signup_date  datetime
-- )
-- texts(
--   text_id        integer,
--   email_id       integer,
--   signup_action  string ('Confirmed', 'Not confirmed'),
--   action_date    datetime
-- )

-- Solution:
SELECT DISTINCT user_id
FROM emails
INNER JOIN texts
    ON emails.email_id = texts.email_id
WHERE texts.action_date = emails.signup_date + INTERVAL '1 day'
  AND texts.signup_action = 'Confirmed';
