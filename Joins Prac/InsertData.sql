
select * from departments;
select * from projects;
select * from employees;

CREATE TABLE departments (
    department_id INT PRIMARY KEY IDENTITY(1,1),
    department_name VARCHAR(255)
);

CREATE TABLE projects (
    project_id INT PRIMARY KEY IDENTITY(1,1),
    project_name VARCHAR(255),
    department_id INT,
    project_start_date DATE,
    project_end_date DATE,
    FOREIGN KEY (department_id) REFERENCES departments(department_id)
);

CREATE TABLE employees (
    employee_id INT PRIMARY KEY IDENTITY(1,1),
    employee_name VARCHAR(255),
    department_id INT,
    project_id INT,
    salary DECIMAL(10, 2),
    hire_date DATE,
    FOREIGN KEY (department_id) REFERENCES departments(department_id),
    FOREIGN KEY (project_id) REFERENCES projects(project_id)
);


-- Insert data into the departments table
INSERT INTO departments (department_name) VALUES
('Marketing'),
('Finance'),
('Human Resources'),
('Research and Development'),
('Sales');

-- Insert data into the projects table
INSERT INTO projects (project_name, department_id, project_start_date, project_end_date) VALUES
('Ad Campaign 2023', 1, '2023-01-01', '2023-06-30'),
('Financial Planning System', 2, '2023-02-15', '2023-09-30'),
('Employee Training Program', 3, '2023-03-01', '2023-08-31'),
('Product Innovation', 4, '2023-04-01', '2023-12-31'),
('Market Expansion', 5, '2023-05-15', '2023-11-30');

-- Insert data into the employees table
INSERT INTO employees (employee_name, department_id, project_id, salary, hire_date) VALUES
('John Doe', 1, 1, 60000.00, '2022-05-10'),
('Jane Smith', 2, 2, 75000.00, '2021-11-20'),
('Bob Johnson', 3, 3, 50000.00, '2023-01-05'),
('Alice Brown', 4, 4, 80000.00, '2022-08-15'),
('Charlie Davis', 5, 5, 70000.00, '2023-02-28'),
('Eva White', 1, 1, 65000.00, '2022-04-12'),
('Michael Lee', 2, 2, 72000.00, '2022-07-08'),
('Olivia Green', 3, 3, 55000.00, '2021-09-30'),
('David Wilson', 4, 4, 90000.00, '2023-03-20'),
('Sophia Anderson', 5, 5, 68000.00, '2022-06-25');


select   Year(hire_date) as [Year],
		 Count(*) as EmpCount
From     employees
Group By Year(hire_date);
