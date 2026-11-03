-- Question: Unfinished Parts
-- Link: https://datalemur.com/questions/tesla-unfinished-parts
--
-- Problem (summary):
-- Find the parts that have begun the assembly process but are not yet
-- finished. Return each part and its unfinished assembly step.
--
-- Table:
-- parts_assembly(
--   part          string,
--   finish_date   datetime,
--   assembly_step integer
-- )

-- Solution:
SELECT
    part,
    assembly_step
FROM parts_assembly
WHERE finish_date IS NULL
ORDER BY part, assembly_step;
