-- 1. List the following details of each employee: employee number, last name, first name, sex, and salary.

SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary
FROM employees AS e
INNER JOIN salaries AS s ON 
e.emp_no = s.emp_no;

-- ORDER BY s.salary DESC
-- 2. List first name, last name, and hire date for employees who were hired in 1986.

SELECT e.first_name, e.last_name, e.hire_date
FROM employees AS e
WHERE e.hire_date > '1986-01-01' AND e.hire_date < '1986-12-31';

-- 3. List the manager of each department with the following information:
-- department number, department name, the manager's employee number, last name, first name.

SELECT dp.dept_no, dp.dept_name, mgr.emp_no, e.last_name, e.first_name
FROM departments AS dp
INNER JOIN dept_manager AS mgr ON dp.dept_no = mgr.dept_no
INNER JOIN employees AS e ON mgr.emp_no = e.emp_no;

-- 4. List the department of each employee with the following information: 
-- employee number, last name, first name, and department name.

SELECT e.emp_no, e.last_name, e.first_name, dp.dept_name 
FROM employees AS e
INNER JOIN dept_emp AS de ON e.emp_no = de.emp_no
INNER JOIN departments AS dp ON dp.dept_no = de.dept_no;

-- 5. List first name, last name, and sex for employees whose first name is "Hercules" 
-- and last names begin with "B."

SELECT e.first_name, e.last_name, e.sex
FROM employees AS e
WHERE e.first_name = 'Hercules' AND e.last_name LIKE 'B%';

-- 6. List all employees in the Sales department, including their employee number, 
-- last name, first name, and department name.

SELECT e.emp_no, e.last_name, e.first_name, dp.dept_name 
FROM employees AS e
INNER JOIN dept_emp AS de ON e.emp_no = de.emp_no
INNER JOIN departments AS dp ON dp.dept_no = de.dept_no
WHERE dp.dept_name = 'Sales';

-- 7. List all employees in the Sales and Development departments, including 
-- their employee number, last name, first name, and department name.

SELECT e.emp_no, e.last_name, e.first_name, dp.dept_name 
FROM employees AS e
INNER JOIN dept_emp AS de ON e.emp_no = de.emp_no
INNER JOIN departments AS dp ON dp.dept_no = de.dept_no
WHERE dp.dept_name = 'Sales' OR dp.dept_name = 'Development';

-- 8. In descending order, list the frequency count of employee last names, 
-- i.e., how many employees share each last name.

SELECT last_name, count(last_name) FROM employees
GROUP BY last_name ORDER BY count(last_name) DESC;