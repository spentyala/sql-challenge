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

