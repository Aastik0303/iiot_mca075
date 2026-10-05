USE compliance_sample;

-- Day 18: LEFT JOIN keeps every policy, including policies with no checks.
SELECT p.policy_id, p.policy_name,
       COUNT(cc.check_id) AS total_checks
FROM policies p
LEFT JOIN compliance_checks cc ON cc.policy_id = p.policy_id
GROUP BY p.policy_id, p.policy_name
ORDER BY p.policy_name;

-- Task: adapt this query to show every employee and their number of checks.