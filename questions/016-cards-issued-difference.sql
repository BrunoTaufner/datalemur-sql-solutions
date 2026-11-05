-- Question: Cards Issued Difference
-- Link: https://datalemur.com/questions/cards-issued-difference
--
-- Problem (summary):
-- For each credit card, find the difference between the highest and
-- lowest monthly issued amounts. Output the card name and the
-- difference, sorted from largest to smallest difference.
--
-- Table:
-- monthly_cards_issued(
--   card_name      string,
--   issued_amount  integer,
--   issue_month    integer,
--   issue_year     integer
-- )

-- Solution:
SELECT
    card_name,
    ABS(MAX(issued_amount) - MIN(issued_amount)) AS difference
FROM monthly_cards_issued
GROUP BY 1
ORDER BY 2 DESC;
