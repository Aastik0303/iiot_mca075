USE compliance_sample;

-- Day 17: INNER JOIN returns employees that have a matching department.
SELECT e.employee_id, e.first_name, e.last_name, e.role_title,
       d.department_name
FROM employees e
INNER JOIN departments d ON d.department_id = e.department_id
ORDER BY d.department_name, e.last_name;

-- Task: include each department's organization name in the result.