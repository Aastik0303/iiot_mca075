USE compliance_sample;

-- Day 14: INSERT ... SELECT. Rerunning this statement will not duplicate the check.
INSERT INTO compliance_checks
    (policy_id, employee_id, compliance_status, check_date, remarks)
SELECT p.policy_id, e.employee_id, 'Pass', '2025-03-10',
       'Privacy review completed (Day 14 practice)'
FROM policies p
JOIN employees e ON e.email = 'meera.iyer@technova.com'
WHERE p.policy_name = 'Data Privacy Policy'
  AND NOT EXISTS (
      SELECT 1
      FROM compliance_checks existing
      WHERE existing.policy_id = p.policy_id
        AND existing.employee_id = e.employee_id
        AND existing.check_date = '2025-03-10'
  );

SELECT check_id, policy_id, employee_id, compliance_status, check_date, remarks
FROM compliance_checks
WHERE check_date = '2025-03-10';

-- Task: add one more check for a different employee and policy.