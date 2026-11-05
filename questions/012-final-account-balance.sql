-- Question: Final Account Balance
-- Link: https://datalemur.com/questions/final-account-balance
--
-- Problem (summary):
-- Calculate the final balance for each account, where deposits add
-- to the balance and withdrawals subtract from it.
-- Output the account ID and final balance.
--
-- Table:
-- transactions(
--   transaction_id    integer,
--   account_id        integer,
--   amount            decimal,
--   transaction_type  varchar ('Deposit', 'Withdrawal')
-- )

-- Solution:
SELECT
    account_id,
    SUM(
        CASE
            WHEN transaction_type = 'Deposit' THEN amount
            WHEN transaction_type = 'Withdrawal' THEN amount * -1
        END
    ) AS final_balance
FROM transactions
GROUP BY account_id;
