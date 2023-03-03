-- 1. List the employee number, last name, first name, sex, and salary of each employee.
SELECT employees.emp_no, employees.last_name, employees.first_name, employees.sex, salaries.salary
FROM employees
INNER JOIN salaries ON employees.emp_no=salaries.emp_no
Order by emp_no

-- 2. List the first name, last name, and hire date for the employees who were hired in 1986.
SELECT employees.first_name, employees.last_name, employees.hire_date
FROM employees
Where (hire_date >= '1986/1/1' AND hire_date <='1986/12/31')
Order by hire_date

-- 3. List the manager of each department along with their department number, department name, employee number, last name, and first name.
SELECT departments.dept_no, departments.dept_name, employees.emp_no, employees.last_name, employees.first_name
FROM departments
INNER JOIN dept_emp ON departments.dept_no=dept_emp.dept_no
INNER JOIN employees ON employees.emp_no=dept_emp.emp_no and employees.emp_no
INNER JOIN titles ON employees.emp_title_id = titles.title_id
Where (title = 'Manager');

-- 4. List the department number for each employee along with that employee’s employee number, last name, first name, and department name.
SELECT departments.dept_no, employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM departments
INNER JOIN dept_emp ON departments.dept_no=dept_emp.dept_no
INNER JOIN employees ON employees.emp_no=dept_emp.emp_no
Order by employees.emp_no;

-- 5. List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
SELECT employees.first_name, employe6
6es.last_name, employees.sex
FROM employees
WHERE (employees.first_name = 'Hercules' AND employees.last_name LIKE 'B%')
Order by employees.last_name;

-- 6. List each employee in the Sales department, including their employee number, last name, and first name.
SELECT employees.emp_no, employees.last_name, employees.first_name
From employees
INNER JOIN dept_emp ON dept_emp.emp_no = employees.emp_no
INNER JOIN departments ON dept_emp.dept_no = departments.dept_no
INNER JOIN titles ON employees.emp_title_id = titles.title_id
Where (departments.dept_name = 'Sales')
Order by employees.emp_no;

-- 7. List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
From employees
INNER JOIN dept_emp ON dept_emp.emp_no = employees.emp_no
INNER JOIN departments ON dept_emp.dept_no = departments.dept_no
INNER JOIN titles ON employees.emp_title_id = titles.title_id
Where (departments.dept_name = 'Sales' OR departments.dept_name = 'Development' )
Order by employees.emp_no;

-- 8. List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).
SELECT count(employees.last_name), employees.last_name
FROM employees
GROUP BY employees.last_name
ORDER BY employees.last_name DESC;




