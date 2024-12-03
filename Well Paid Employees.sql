SELECT 
  e.employee_id AS employee_id,
  e.name AS employee_name
FROM employee AS m
INNER JOIN employee AS e
  ON m.employee_id = e.manager_id
WHERE e.salary > m.salary;
