-- Question: Duplicate Job Listings
-- Link: https://datalemur.com/questions/duplicate-job-listings
--
-- Problem (summary):
-- Count the number of companies that have posted duplicate job listings,
-- i.e. two or more listings with the same title and description.
--
-- Table:
-- job_listings(
--   job_id       integer,
--   company_id   integer,
--   title        string,
--   description  string
-- )

-- Solution:
WITH job_count_cte AS (
    SELECT
      COUNT(*) AS job_count,
      company_id,
      title,
      description
    FROM job_listings 
    GROUP BY 
      company_id,
      title,
      description
)
SELECT COUNT(DISTINCT company_id) AS duplicate_companies
FROM job_count_cte
WHERE job_count > 1;
