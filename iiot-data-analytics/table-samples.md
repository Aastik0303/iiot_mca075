# Table Samples

Database: `compliance_sample`

Run this before the queries:

```sql
USE compliance_sample;
```

## 1. organizations

```sql
SELECT * FROM organizations;
```

| organization_id | organization_name | location |
|---:|---|---|
| 1 | TechNova Pvt Ltd | Bengaluru |
| 2 | BluePeak Solutions | Hyderabad |

## 2. departments

```sql
SELECT * FROM departments;
```

| department_id | organization_id | department_name | head_name |
|---:|---:|---|---|
| 1 | 1 | IT Security | Rohit Sharma |
| 2 | 1 | Human Resources | Neha Singh |
| 3 | 1 | Finance | Sandeep Verma |
| 4 | 2 | Operations | Priya Nair |

## 3. employees

```sql
SELECT employee_id, department_id, first_name, last_name, email, role_title, joining_date, status
FROM employees;
```

| employee_id | department_id | first_name | last_name | email | role_title | joining_date | status |
|---:|---:|---|---|---|---|---|---|
| 1 | 1 | Amit | Kumar | amit.kumar@technova.com | Security Analyst | 2022-06-15 | Active |
| 2 | 1 | Sneha | Patel | sneha.patel@technova.com | Compliance Officer | 2021-09-10 | Active |
| 3 | 2 | Deepak | Rao | deepak.rao@technova.com | HR Manager | 2020-01-20 | Active |
| 4 | 3 | Meera | Iyer | meera.iyer@technova.com | Account Manager | 2023-03-05 | On Leave |
| 5 | 4 | Vikram | Joshi | vikram.joshi@bluepeak.com | Operations Lead | 2021-12-01 | Active |

## 4. policies

```sql
SELECT policy_id, policy_name, category, effective_date, owner_employee_id
FROM policies;
```

| policy_id | policy_name | category | effective_date | owner_employee_id |
|---:|---|---|---|---:|
| 1 | Data Privacy Policy | Privacy | 2024-01-01 | 2 |
| 2 | Cybersecurity Awareness Policy | Security | 2024-02-15 | 1 |
| 3 | Workplace Safety Policy | Safety | 2023-11-01 | 3 |

## 5. compliance_checks

```sql
SELECT * FROM compliance_checks;
```

| check_id | policy_id | employee_id | compliance_status | check_date | remarks |
|---:|---:|---:|---|---|---|
| 1 | 1 | 1 | Pass | 2025-01-10 | Training completed and documentation updated |
| 2 | 1 | 2 | Pass | 2025-01-12 | Privacy controls reviewed successfully |
| 3 | 2 | 1 | Pass | 2025-02-20 | Security awareness quiz completed |
| 4 | 2 | 3 | Pending | 2025-02-22 | Awaiting training confirmation |
| 5 | 3 | 4 | Fail | 2025-03-01 | Safety checklist not completed |

## Joined table example

```sql
SELECT e.first_name, e.last_name, d.department_name,
       p.policy_name, cc.compliance_status
FROM compliance_checks cc
JOIN employees e ON cc.employee_id = e.employee_id
JOIN departments d ON e.department_id = d.department_id
JOIN policies p ON cc.policy_id = p.policy_id;
```

| first_name | last_name | department_name | policy_name | compliance_status |
|---|---|---|---|---|
| Amit | Kumar | IT Security | Data Privacy Policy | Pass |
| Sneha | Patel | IT Security | Data Privacy Policy | Pass |
| Amit | Kumar | IT Security | Cybersecurity Awareness Policy | Pass |
| Deepak | Rao | Human Resources | Cybersecurity Awareness Policy | Pending |
| Vikram | Joshi | Operations | Workplace Safety Policy | Fail |
