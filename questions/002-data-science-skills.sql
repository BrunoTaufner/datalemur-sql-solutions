-- Question: Data Science Skills
-- Link: https://datalemur.com/questions/matching-skills
--
-- Problem (summary):
-- Find the candidates who are proficient in Python, Tableau and PostgreSQL.
-- Return their IDs sorted in ascending order.
--
-- Table:
-- candidates(
--   candidate_id integer,
--   skill        varchar
-- )

-- Solution:
WITH candidate_skills AS (
    SELECT
        candidate_id,
        STRING_AGG(skill, ',') AS skills
    FROM candidates
    GROUP BY candidate_id
)
SELECT
    candidate_id
FROM candidate_skills
WHERE skills LIKE '%Python%'
  AND skills LIKE '%Tableau%'
  AND skills LIKE '%PostgreSQL%'
ORDER BY candidate_id;
