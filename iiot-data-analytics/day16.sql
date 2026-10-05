USE compliance_sample;

-- Day 16: DELETE inside a transaction; the final ROLLBACK restores the row.
START TRANSACTION;

SELECT check_id, policy_id, employee_id, compliance_status
FROM compliance_checks
WHERE check_id = 5;

DELETE FROM compliance_checks
WHERE check_id = 5;

SELECT check_id, policy_id, employee_id, compliance_status
FROM compliance_checks
WHERE check_id = 5;

ROLLBACK;

-- Task: practice deleting a different check by its primary key, then rollback.