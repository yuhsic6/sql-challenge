-- created table deparments
DROP TABLE departments;
CREATE TABLE IF NOT EXISTS departments (
	dept_no VARCHAR(10) PRIMARY KEY,
	dept_name VARCHAR (30)
);

SELECT * FROM departments;

-- created table dept_emp
DROP TABLE dept_emp;
CREATE TABLE IF NOT EXISTS dept_emp (
	emp_no VARCHAR(10),
	dept_no VARCHAR(10),
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
	PRIMARY KEY (emp_no, dept_no)
);

SELECT * FROM dept_emp;

-- created table dept_manager
DROP TABLE dept_manager;
CREATE TABLE IF NOT EXISTS dept_manager (
	dept_no VARCHAR(10),
	emp_no VARCHAR(10)
);

SELECT * FROM dept_manager;

-- created table employees
DROP TABLE employees;
CREATE TABLE IF NOT EXISTS employees (
	emp_no VARCHAR(10) PRIMARY KEY,
	emp_title_id VARCHAR(10),
	birth_date date,
	first_name VARCHAR(20),
	last_name VARCHAR(20),
	sex VARCHAR(1),
	hire_date date
);

SELECT * FROM employees;

-- created talbe salaries
CREATE TABLE IF NOT EXISTS salaries (
	emp_no VARCHAR(10) PRIMARY KEY,
	salary INT
);

SELECT * FROM salaries;

-- created table titles
DROP TABLE titles;
CREATE TABLE IF NOT EXISTS titles (
	title_id VARCHAR(10) PRIMARY KEY,
	title VARCHAR(20)
);

SELECT * FROM titles;

