Drop table departments CASCADE;

CREATE TABLE departments (
dept_no VARCHAR(20),
dept_name VARCHAR(20)
);

	Alter TABLE departments
	add constraint departments_pkey primary key (dept_no, dept_name);
	
	ALTER TABLE departments ADD CONSTRAINT departments_ukey_dept_no UNIQUE (dept_no);
	
	DELETE from departments
	Where dept_no = 'dept_no' and dept_name='dept_name';

Drop Table dept_emp;

CREATE TABLE dept_emp (
emp_no int,
dept_no VARCHAR(20)
);

	Alter TABLE dept_emp
	add constraint dept_emp_pkey primary key (emp_no, dept_no);
	
	ALTER TABLE dept_emp ADD CONSTRAINT dept_emp_emp_no_fk FOREIGN KEY (emp_no) REFERENCES employees (emp_no);
	ALTER TABLE dept_emp ADD CONSTRAINT dept_emp_dept_no_fk FOREIGN KEY (dept_no) REFERENCES departments (dept_no);
	

Drop Table dept_manager;

CREATE TABLE dept_manager (
dept_no VARCHAR(10),
emp_no int
);

	Alter TABLE dept_manager
	ADD PRIMARY KEY(emp_no);

drop table employees CASCADE;

CREATE TABLE employees (
emp_no int,
emp_title_id VARCHAR(10),
birth_date DATE,
first_name VARCHAR(30),
last_name VARCHAR(30),
sex VARCHAR(10),
hire_date DATE
);

	Alter TABLE employees
	add constraint EMPLOYEES_pkey primary key (emp_no, first_name, last_name);
	
	ALTER TABLE employees ADD CONSTRAINT EMPLOYEES_ukey_emp_no UNIQUE (emp_no);

CREATE TABLE salaries (
emp_no int,
salary int
);

	Alter TABLE salaries
	ADD PRIMARY KEY(emp_no);
	
	ALTER TABLE salaries ADD CONSTRAINT salaries_emp_no_fk FOREIGN KEY (emp_no) REFERENCES employees (emp_no);

CREATE TABLE titles (
title_id VARCHAR(20),
title VARCHAR(30)
);

	Alter TABLE titles
	add constraint title_pkey primary key (title_id,title);
	
	ALTER TABLE titles ADD CONSTRAINT titles_id_ukey UNIQUE (title_id);
	
	ALTER TABLE titles ADD CONSTRAINT titles_id_fk FOREIGN KEY (title_id) REFERENCES employees (emp_title_id);

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


