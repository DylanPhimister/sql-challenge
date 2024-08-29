SELECT salaries.emp_no, employees.last_name, employees.first_name, employees.sex, salaries.salary
FROM employees
INNER JOIN salaries
on salaries.emp_no = employees.emp_no;


SELECT employees.first_name, employees.last_name, employees.hire_date
FROM employees
WHERE extract(year from hire_date) = 1986;


SELECT DISTINCT ON (dept_manager.dept_no) employees.first_name, employees.last_name, dept_manager.emp_no, departments.dept_name, dept_manager.dept_no
FROM dept_manager
INNER JOIN departments
ON dept_manager.dept_no = departments.dept_no
INNER JOIN employees
ON dept_manager.emp_no = employees.emp_no
ORDER BY dept_manager.dept_no DESC;


SELECT DISTINCT ON (employees.emp_no) employees.emp_no, departments.dept_no, employees.last_name, employees.first_name, departments.dept_name
FROM employees
LEFT JOIN dept_emp 
ON employees.emp_no = dept_emp.emp_no
INNER JOIN departments
ON dept_emp.dept_no = departments.dept_no
ORDER BY employees.emp_no DESC;


SELECT employees.first_name, employees.last_name, employees.sex
FROM employees
WHERE (employees.first_name = 'Hercules') and (lower(employees.last_name) like 'b%')
ORDER BY employees.last_name;


SELECT DISTINCT ON (emp_no) *
INTO combined_emp_dept
FROM dept_emp
ORDER BY emp_no DESC;

SELECT employees.first_name, employees.last_name, employees.emp_no, departments.dept_name
FROM employees
INNER JOIN combined_emp_dept
ON employees.emp_no = combined_emp_dept.emp_no
INNER JOIN departments
ON combined_emp_dept.dept_no = departments.dept_no
WHERE (lower(departments.dept_name) = 'sales');


SELECT employees.first_name, employees.last_name, employees.emp_no, departments.dept_name
FROM employees
INNER JOIN combined_emp_dept
ON combined_emp_dept.emp_no = employees.emp_no
INNER JOIN departments
ON departments.dept_no = combined_emp_dept.dept_no
WHERE (lower(departments.dept_name) = 'sales') or (lower(departments.dept_name) = 'Development');


SELECT last_name, count(last_name) as frequency
FROM employees
GROUP BY last_name
ORDER BY frequency DESC;