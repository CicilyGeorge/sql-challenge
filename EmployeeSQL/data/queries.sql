-- 1. List the following details of each employee: employee number, last name, first name, sex, and salary.
SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary
FROM employees AS e
JOIN salaries AS s
	ON e.emp_no = s.emp_no
ORDER BY s.salary DESC;


-- 2. List first name, last name, and hire date for employees who were hired in 1986.
SELECT first_name, last_name, hire_date
FROM employees
WHERE EXTRACT(YEAR FROM hire_date) = 1986
ORDER BY hire_date;


-- 3. List the manager of each department with the following information: 
-- department number, department name, the manager's employee number, last name, first name.
SELECT m.dept_no, d.dept_name, m.emp_no, e.last_name, e.first_name
FROM dept_manager AS m
JOIN departments AS d
	ON m.dept_no = d.dept_no
JOIN employees AS e
	ON m.emp_no = e.emp_no;
	
	
-- 4. List the department of each employee with the following information:
-- employee number, last name, first name, and department name.
CREATE VIEW employee_depts AS
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees AS e
JOIN dept_emp AS de
	ON e.emp_no = de.emp_no
JOIN departments AS d
	ON de.dept_no = d.dept_no;


-- 5. List first name, last name, and sex for employees whose 
-- first name is "Hercules" and last names begin with "B."
SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';


-- 6. List all employees in the Sales department, including their
-- employee number, last name, first name, and department name.
SELECT *
FROM employee_depts
WHERE dept_name = 'Sales';	


-- 7. List all employees in the Sales and Development departments, including their
-- employee number, last name, first name, and department name.
SELECT *
FROM employee_depts
WHERE dept_name = 'Sales' OR dept_name = 'Development';


-- 8. In descending order, list the frequency count of employee last names, 
-- i.e., how many employees share each last name.
SELECT last_name, count(last_name) as "frequency_count"
FROM employees
GROUP BY last_name
ORDER BY "frequency_count" DESC;


