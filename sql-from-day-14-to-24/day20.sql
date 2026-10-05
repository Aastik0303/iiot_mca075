USE compliance_sample;

-- Day 20: aggregate check outcomes by policy and keep groups with at least one check.
SELECT p.policy_name, cc.compliance_status,
       COUNT(*) AS total_checks
FROM policies p
JOIN compliance_checks cc ON cc.policy_id = p.policy_id
GROUP BY p.policy_id, p.policy_name, cc.compliance_status
HAVING COUNT(*) >= 1
ORDER BY p.policy_name, cc.compliance_status;

-- Task: calculate the total checks per department and sort highest first.