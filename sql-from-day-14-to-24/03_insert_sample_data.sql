USE compliance_sample;

-- Insert organizations
INSERT INTO organizations (organization_name, location)
VALUES
    ('TechNova Pvt Ltd', 'Bengaluru'),
    ('BluePeak Solutions', 'Hyderabad');

-- Insert departments
INSERT INTO departments (organization_id, department_name, head_name)
VALUES
    (1, 'IT Security', 'Rohit Sharma'),
    (1, 'Human Resources', 'Neha Singh'),
    (1, 'Finance', 'Sandeep Verma'),
    (2, 'Operations', 'Priya Nair');

-- Insert employees
INSERT INTO employees (department_id, first_name, last_name, email, role_title, joining_date, status)
VALUES
    (1, 'Amit', 'Kumar', 'amit.kumar@technova.com', 'Security Analyst', '2022-06-15', 'Active'),
    (1, 'Sneha', 'Patel', 'sneha.patel@technova.com', 'Compliance Officer', '2021-09-10', 'Active'),
    (2, 'Deepak', 'Rao', 'deepak.rao@technova.com', 'HR Manager', '2020-01-20', 'Active'),
    (3, 'Meera', 'Iyer', 'meera.iyer@technova.com', 'Account Manager', '2023-03-05', 'On Leave'),
    (4, 'Vikram', 'Joshi', 'vikram.joshi@bluepeak.com', 'Operations Lead', '2021-12-01', 'Active');

-- Insert policies
INSERT INTO policies (policy_name, category, description, effective_date, owner_employee_id)
VALUES
    ('Data Privacy Policy', 'Privacy', 'Rules for protecting personal and sensitive data', '2024-01-01', 2),
    ('Cybersecurity Awareness Policy', 'Security', 'Mandatory training and handling rules for cyber risks', '2024-02-15', 1),
    ('Workplace Safety Policy', 'Safety', 'Guidelines for employee safety and incident reporting', '2023-11-01', 3);

-- Insert compliance checks
INSERT INTO compliance_checks (policy_id, employee_id, compliance_status, check_date, remarks)
VALUES
    (1, 1, 'Pass', '2025-01-10', 'Training completed and documentation updated'),
    (1, 2, 'Pass', '2025-01-12', 'Privacy controls reviewed successfully'),
    (2, 1, 'Pass', '2025-02-20', 'Security awareness quiz completed'),
    (2, 3, 'Pending', '2025-02-22', 'Awaiting training confirmation'),
    (3, 4, 'Fail', '2025-03-01', 'Safety checklist not completed');
