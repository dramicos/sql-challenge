-- Queries for the Data Analysis of the created Database

-- List details of each employee:  Employee Number, Last Name, First Name, Sex and Salary
select emp_no, last_name, first_name, sex, birth_date from "Employees";

-- List first name, last name, and hire date for employees who were hired in 1986.
select last_name, first_name, hire_date from "Employees"
where (select extract(year from hire_date)) = '1986';

-- List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.
select dept.dept_no, dept.dept_name, dm.emp_no,	e.last_name, e.first_name
from "Departments" as dept
	left join "Dept_Managers" as dm on dm.dept_no = dept.dept_no
	left join "Employees" as e on e.emp_no = dm.emp_no;

-- List the department of each employee with the following information: employee number, last name, first name, and department name.
select de.emp_no, e.last_name, e.first_name, dept.dept_name
from "Departments" as dept
	left join "Dept_Employees" as de on de.dept_no = dept.dept_no
	left join "Employees" as e on e.emp_no = de.emp_no;
	
-- List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
select first_name, last_name, sex from "Employees"
where first_name = 'Hercules' and last_name like 'B%';

-- List all employees in the Sales department, including their employee number, last name, first name, and department name.
select de.emp_no, e.last_name, e.first_name, dept.dept_name
from "Departments" as dept
	left join "Dept_Employees" as de on de.dept_no = dept.dept_no
	left join "Employees" as e on e.emp_no = de.emp_no
where dept.dept_name = 'Sales';

-- List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
select de.emp_no, e.last_name, e.first_name, dept.dept_name
from "Departments" as dept
	left join "Dept_Employees" as de on de.dept_no = dept.dept_no
	left join "Employees" as e on e.emp_no = de.emp_no
where dept.dept_name = 'Sales' or dept.dept_name = 'Development';

-- List the frequency count of employee last names (i.e., how many employees share each last name) in descending order.
select last_name, count(last_name) as "name count" from "Employees"
group by last_name
order by "name count" desc;