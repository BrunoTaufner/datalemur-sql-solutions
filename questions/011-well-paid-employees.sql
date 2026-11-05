-- Question: Well Paid Employees
-- Link: https://datalemur.com/questions/sql-well-paid-employees
--
-- Problem (summary):
-- Identify all employees who earn more than their direct managers.
-- Output the employee ID and employee name.
--
-- Table:
-- employee(
--   employee_id    integer,
--   name           string,
--   salary         integer,
--   department_id  integer,
--   manager_id     integer
-- )

-- Solution:
WITH employee_cte AS (
    SELECT *
    FROM employee
    WHERE manager_id IS NOT NULL
),
manager_cte AS (
    SELECT *
    FROM employee
    WHERE manager_id IS NULL
)
SELECT
    a.employee_id,
    a.name AS employee_name
FROM employee_cte a
LEFT JOIN manager_cte b
    ON a.manager_id = b.employee_id
WHERE a.salary > b.salary;
