USE compliance_sample;

-- Day 21: EXISTS finds employees who have at least one failed compliance check.
SELECT e.employee_id, e.first_name, e.last_name
FROM employees e
WHERE EXISTS (
    SELECT 1
    FROM compliance_checks cc
    WHERE cc.employee_id = e.employee_id
      AND cc.compliance_status = 'Fail'
)
ORDER BY e.employee_id;

-- NOT EXISTS finds employees who have no checks yet (the result may be empty).
SELECT e.employee_id, e.first_name, e.last_name
FROM employees e
WHERE NOT EXISTS (
    SELECT 1
    FROM compliance_checks cc
    WHERE cc.employee_id = e.employee_id
);

-- Task: find policies that have no failed checks.