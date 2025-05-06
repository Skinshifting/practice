CREATE DATABASE hr_project;
USE hr_project;

CREATE TABLE departments (
	dept_id INT PRIMARY KEY AUTO_INCREMENT,
    dept_name VARCHAR(50) NOT NULL
);

CREATE TABLE employees (
	emp_id INT PRIMARY KEY AUTO_INCREMENT,
    emp_name VARCHAR(100) NOT NULL,
    dept_id INT,
    hire_date DATE,
    salary DECIMAL(10, 2),
    FOREIGN KEY (dept_id) REFERENCES 
departments(dept_id)
);

INSERT INTO departments (dept_name) VALUES
('Human Resources'),
('Engineering'),
('Sales'),
('Finance');

INSERT INTO employees (emp_name, dept_id, hire_date, salary) VALUES
('Alice Johnson', 2, '2022-03-15', 85000.00),
('Bob Smith', 2, '2021-07-01', 95000.00),
('Cathy Lee', 3, '2023-01-10', 60000.00),
('David Kim', 1, '2020-11-20', 55000.00),
('Eva Martinez', 4, '2022-09-05', 72000.00);

CREATE TABLE projects (
    project_id INT PRIMARY KEY AUTO_INCREMENT,
    project_name VARCHAR(100) NOT NULL,
    start_date DATE,
    end_date DATE
);

CREATE TABLE employee_projects (
    emp_id INT,
    project_id INT,
    PRIMARY KEY (emp_id, project_id),
    FOREIGN KEY (emp_id) REFERENCES employees(emp_id),
    FOREIGN KEY (project_id) REFERENCES projects(project_id)
);

INSERT INTO projects (project_name, start_date, end_date) VALUES
('Onboarding Automation', '2023-01-01', '2023-06-30'),
('Website Redesign', '2023-03-01', '2023-12-31'),
('Sales Expansion Plan', '2023-07-01', NULL);

INSERT INTO employee_projects (emp_id, project_id) VALUES
(1, 1), -- Alice Johnson → Onboarding Automation
(2, 2), -- Bob Smith → Website Redesign
(3, 2), -- Cathy Lee → Website Redesign
(3, 3), -- Cathy Lee → Sales Expansion Plan
(4, 1), -- David Kim → Onboarding Automation
(5, 3); -- Eva Martinez → Sales Expansion Plan


