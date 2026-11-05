-- Question: IBM db2 Product Analytics
-- Link: https://datalemur.com/questions/sql-ibm-db2-product-analytics
--
-- Problem (summary):
-- Build a histogram of how many unique queries each employee ran in
-- Q3 2023 (July 1 to September 30). Include employees who ran no queries
-- (count 0). Output the number of unique queries and the number of
-- employees, sorted by the number of unique queries.
--
-- Tables:
-- queries(
--   employee_id      integer,
--   query_id         integer,
--   query_starttime  datetime,
--   execution_time   integer
-- )
-- employees(
--   employee_id  integer,
--   full_name    string,
--   gender       string ('Male', 'Female')
-- )

-- Solution:
WITH queries_per_user AS (
    SELECT
        employee_id,
        COUNT(DISTINCT query_id) AS unique_queries
    FROM queries
    WHERE query_starttime >= '2023-07-01'
      AND query_starttime < '2023-10-01'
    GROUP BY 1
)
SELECT
    COALESCE(unique_queries, 0) AS unique_queries,
    COUNT(DISTINCT a.employee_id) AS employee_count
FROM employees a
LEFT JOIN queries_per_user b
    ON a.employee_id = b.employee_id
GROUP BY b.unique_queries
ORDER BY 1;
