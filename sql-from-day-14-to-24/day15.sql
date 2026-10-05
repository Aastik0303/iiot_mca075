USE compliance_sample;

-- Day 15: UPDATE inside a transaction; the final ROLLBACK preserves sample data.
START TRANSACTION;

UPDATE compliance_checks
SET remarks = 'Training confirmation received (Day 15 practice update)'
WHERE check_id = 4;

SELECT check_id, compliance_status, remarks
FROM compliance_checks
WHERE check_id = 4;

ROLLBACK;

-- Task: change the remarks for another check, then verify the result before rollback.