USE compliance_sample;

-- Day 22: MySQL multi-table UPDATE JOIN, protected by a transaction.
START TRANSACTION;

UPDATE compliance_checks cc
JOIN employees e ON e.employee_id = cc.employee_id
JOIN departments d ON d.department_id = e.department_id
SET cc.remarks = CONCAT(COALESCE(cc.remarks, ''), ' [Day 22 review]')
WHERE cc.compliance_status = 'Fail'
  AND d.department_name = 'Finance';

SELECT cc.check_id, e.first_name, d.department_name,
       cc.compliance_status, cc.remarks
FROM compliance_checks cc
JOIN employees e ON e.employee_id = cc.employee_id
JOIN departments d ON d.department_id = e.department_id
WHERE cc.compliance_status = 'Fail'
  AND d.department_name = 'Finance';

ROLLBACK;

-- Task: update remarks for Pending checks in another department, then rollback.