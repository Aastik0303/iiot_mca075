USE compliance_sample;

-- Day 19: join checks to employees, departments, policies, and organizations.
SELECT cc.check_id, e.first_name, e.last_name, d.department_name,
       o.organization_name, p.policy_name,
       cc.compliance_status, cc.check_date
FROM compliance_checks cc
JOIN employees e ON e.employee_id = cc.employee_id
JOIN departments d ON d.department_id = e.department_id
JOIN organizations o ON o.organization_id = d.organization_id
JOIN policies p ON p.policy_id = cc.policy_id
ORDER BY cc.check_date, cc.check_id;

-- Task: filter this report to show only checks belonging to one organization.