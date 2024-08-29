DROP TABLE departments;
DROP TABLE employees;
DROP TABLE dept_emp;
DROP TABLE dept_manager;
DROP TABLE salaries;
DROP TABLE titles;


create table departments(
	dept_no varchar(255) PRIMARY key NOT NULL,
	dept_name varchar(255) NOT NULL
	);
	
SELECT * FROM departments;

create table employees(
	emp_no INT PRIMARY key NOT NULL, 
	emp_title varchar(255) NOT NULL, 
	birth_date date NOT NULL, 
	first_name varchar(255) NOT NULL, 
	last_name varchar(255) NOT NULL, 
	sex varchar(255) NOT NULL, 
	hire_date date NOT NULL 
);

SELECT * FROM employees;

create table dept_emp( 
	emp_no INT NOT NULL, 
	dept_no varchar(255) NOT NULL, 
	foreign key (dept_no) references departments (dept_no),
	foreign key (emp_no) references employees (emp_no)
); 

SELECT * FROM dept_emp;

 
create table dept_manager(
	dept_no varchar(255) NOT NULL, 
	emp_no INT NOT NULL, 
	foreign key (dept_no) references departments (dept_no), 
	foreign key (emp_no) references employees (emp_no)
); 

SELECT * FROM dept_manager;

create table salaries (
	emp_no int NOT NULL, 
	salary int NOT NULL, 
	foreign key (emp_no) references employees (emp_no)
);

SELECT * FROM salaries;

create table titles(
	title_id varchar(255) PRIMARY key NOT NULL,
	title varchar(255) NOT NULL
);

SELECT * FROM titles;