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

-- 1. List the employee number, last name, first name, sex, and salary of each employee.
SELECT employees.emp_no, 
	last_name, 
	first_name, 
	sex, 
	salaries.salary 
FROM employees
INNER JOIN salaries ON 
employees.emp_no = salaries.emp_no;

--2. List the first name, last name, and hire date for the employees who were hired in 1986.
SELECT first_name,
	last_name,
	hire_date
FROM employees
WHERE EXTRACT (year from hire_date)= 1986;

--3. List the manager of each department along with their department number, department name, employee number, last name, and first name.
SELECT dept_manager.dept_no, 
	departments.dept_name,
	dept_manager.emp_no,
	employees.first_name,
	employees.last_name
FROM dept_manager
INNER JOIN departments ON
dept_manager.dept_no = departments.dept_no
INNER JOIN employees ON
dept_manager.emp_no = employees.emp_no;

-- 4. List the department number for each employee along with that employee’s employee number, last name, first name, and department name.
SELECT dept_emp.dept_no,
	dept_emp.emp_no,
	employees.first_name,
	employees.last_name,
	departments.dept_name
FROM dept_emp
INNER JOIN employees ON
dept_emp.emp_no = employees.emp_no
INNER JOIN departments ON
dept_emp.dept_no = departments.dept_no;


-- 5. List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
SELECT first_name,
	last_name,
	sex
FROM employees
WHERE first_name = 'Hercules' AND last_name like 'B%';

-- 6. List each employee in the Sales department, including their employee number, last name, and first name.
SELECT employees.emp_no,
	employees.last_name,
	employees.first_name
FROM dept_emp
INNER JOIN employees ON
employees.emp_no = dept_emp.emp_no
INNER JOIN departments ON
dept_emp.dept_no = departments.dept_no
WHERE dept_name = 'Sales';

--7. List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT employees.emp_no,
	employees.last_name,
	employees.first_name,
	departments.dept_name
FROM dept_emp
INNER JOIN employees ON
employees.emp_no = dept_emp.emp_no
INNER JOIN departments ON
dept_emp.dept_no = departments.dept_no
WHERE dept_name = 'Sales' OR dept_name = 'Development';	

--8. List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).
SELECT last_name,
	count(last_name)
FROM employees
GROUP BY last_name
ORDER BY count(last_name) DESC;
	
	