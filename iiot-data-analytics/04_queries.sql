USE compliance_sample;

-- 1. All employees
SELECT * FROM employees;

-- 2. All compliance policies
SELECT * FROM policies;

-- 3. Employees and their department details
SELECT e.employee_id, e.first_name, e.last_name, d.department_name
FROM employees e
JOIN departments d ON e.department_id = d.department_id;

-- 4. Policy compliance summary
SELECT p.policy_name, c.compliance_status, COUNT(*) AS total_checks
FROM compliance_checks c
JOIN policies p ON c.policy_id = p.policy_id
GROUP BY p.policy_name, c.compliance_status;

-- 5. All failed checks
SELECT e.first_name, e.last_name, p.policy_name, cc.compliance_status, cc.remarks
FROM compliance_checks cc
JOIN employees e ON cc.employee_id = e.employee_id
JOIN policies p ON cc.policy_id = p.policy_id
WHERE cc.compliance_status = 'Fail';

-- 6. Policy owner details
SELECT p.policy_name, e.first_name, e.last_name, e.email
FROM policies p
JOIN employees e ON p.owner_employee_id = e.employee_id;
