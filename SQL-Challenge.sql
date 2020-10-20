CREATE TABLE departments (
  dept_no varchar(50) NOT NULL,
  dept_name  varchar(50) NOT NULL,
  PRIMARY KEY (dept_no)
);

CREATE TABLE dept_emp (
  emp_no int NOT NULL,
  dept_no  varchar(50) NOT NULL
);


CREATE TABLE dept_manager (
  dept_no varchar(50) NOT NULL,
  emp_no  int NOT NULL
);

CREATE TABLE employees (
	emp_no int NOT NULL,
	emp_title_id varchar(50) NOT NULL,
	birth_date DATE NOT NULL,
	first_name varchar(50) NOT NULL,
	last_name varchar(50) NOT NULL,
	sex char(1) NOT NULL,
	hire_date DATE NOT NULL
);

CREATE TABLE salaries (
    emp_no int  NOT NULL ,
    salary int  NOT NULL 
);

--1--
--List the following details of each employee
--: employee number, last name, first name, sex, and salary.--

SELECT 
    e.emp_no AS "Employee Number",
    e.first_name AS "First Name",
    e.last_name AS "Last Name",
    e.sex AS "Sex",
    s.salary AS "Salary"
FROM employees AS e
LEFT JOIN salaries AS s 
ON e.emp_no = s.emp_no

--2--
--List first name, last name, 
--and hire date for employees who were hired in 1986.**
SELECT
    first_name AS "First Name",
    last_name AS "Last Name",
    hire_date AS "Hire Date"
FROM employees
WHERE hire_date LIKE '%1986%'


--3--
SELECT    
d.dept_no AS "Department Number",
d.dept_name AS "Department Name",
de.emp_no AS "Manager Employee Number",
e.last_name AS "Last Name",
e.first_name AS "First Name"

FROM departments AS d
INNER JOIN dept_emp AS de
ON d.dept_no = de.dept_no
INNER JOIN dept_manager AS dm
ON de.dept_no = dm.dept_no
INNER JOIN employees AS e
ON dm.emp_no = e.emp_no;

--4--
SELECT 
    e.emp_no,
    e.last_name,
    e.first_name,
    d.dept_name
FROM employees AS e
LEFT JOIN dept_emp AS de
ON e.emp_no = de.emp_no
LEFT JOIN departments AS d
ON d.dept_no = de.dept_no;

--5--
--List first name, last name, and 
--sex for employees whose first name 
--is "Hercules" and last names begin with "B."

SELECT 
first_name,
last_name,
sex
FROM employees
WHERE first_name = 'Hercules' 
AND last_name LIKE 'B%'

--6--
--List all employees in the Sales department,
--including their employee number, 
--last name, first name, and department name.

SELECT
e.emp_no,
e.last_name,
e.first_name,
d.dept_name

FROM employees AS e
LEFT JOIN dept_emp AS de
ON e.emp_no = de.emp_no
LEFT JOIN departments AS d
ON d.dept_no = de.dept_no
WHERE dept_name = 'Sales';

--List all employees in the Sales and Development departments, 
--including their 
--employee number, last name, first name, and department name.

--7--
SELECT
e.emp_no,
e.last_name,
e.first_name,
d.dept_name

FROM employees AS e
LEFT JOIN dept_emp AS de
ON e.emp_no = de.emp_no
LEFT JOIN departments AS d
ON d.dept_no = de.dept_no
WHERE dept_name IN ('Sales','Development');

--8--
--In descending order, 
--list the frequency count of employee last names, 
--i.e., how many employees share each last name.

SELECT last_name,COUNT(last_name)
FROM employees
WHERE last_name = last_name
GROUP BY last_name
ORDER BY count(last_name) DESC;

    
    
    
    
    
    
    
    
    
    
