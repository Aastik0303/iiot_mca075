USE compliance_sample;

-- 1. Organization table
CREATE TABLE organizations (
    organization_id INT PRIMARY KEY AUTO_INCREMENT,
    organization_name VARCHAR(100) NOT NULL,
    location VARCHAR(100) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 2. Department table
CREATE TABLE departments (
    department_id INT PRIMARY KEY AUTO_INCREMENT,
    organization_id INT NOT NULL,
    department_name VARCHAR(80) NOT NULL,
    head_name VARCHAR(80),
    CONSTRAINT fk_departments_org
        FOREIGN KEY (organization_id)
        REFERENCES organizations(organization_id)
        ON DELETE CASCADE,
    CONSTRAINT uq_department UNIQUE (organization_id, department_name)
);

-- 3. Employee table
CREATE TABLE employees (
    employee_id INT PRIMARY KEY AUTO_INCREMENT,
    department_id INT NOT NULL,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    role_title VARCHAR(50) NOT NULL,
    joining_date DATE NOT NULL,
    status VARCHAR(20) NOT NULL DEFAULT 'Active',
    CONSTRAINT fk_employees_department
        FOREIGN KEY (department_id)
        REFERENCES departments(department_id)
        ON DELETE RESTRICT,
    CONSTRAINT chk_employee_status
        CHECK (status IN ('Active', 'Inactive', 'On Leave'))
);

-- 4. Policy table
CREATE TABLE policies (
    policy_id INT PRIMARY KEY AUTO_INCREMENT,
    policy_name VARCHAR(120) NOT NULL UNIQUE,
    category VARCHAR(50) NOT NULL,
    description TEXT,
    effective_date DATE NOT NULL,
    owner_employee_id INT,
    CONSTRAINT fk_policy_owner
        FOREIGN KEY (owner_employee_id)
        REFERENCES employees(employee_id)
        ON DELETE SET NULL
);

-- 5. Compliance checks table
CREATE TABLE compliance_checks (
    check_id INT PRIMARY KEY AUTO_INCREMENT,
    policy_id INT NOT NULL,
    employee_id INT NOT NULL,
    compliance_status VARCHAR(20) NOT NULL,
    check_date DATE NOT NULL,
    remarks TEXT,
    CONSTRAINT fk_checks_policy
        FOREIGN KEY (policy_id)
        REFERENCES policies(policy_id)
        ON DELETE CASCADE,
    CONSTRAINT fk_checks_employee
        FOREIGN KEY (employee_id)
        REFERENCES employees(employee_id)
        ON DELETE CASCADE,
    CONSTRAINT chk_compliance_status
        CHECK (compliance_status IN ('Pass', 'Fail', 'Pending'))
);
