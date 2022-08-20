-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "Employees" (
    "emp_no" int   NOT NULL,
    "emp_title_id" varchar(30)   NOT NULL,
    "birth_date" date   NOT NULL,
    "first_name" varchar(255)   NOT NULL,
    "last_name" varchar(255)   NOT NULL,
    "sex" varchar(255)   NOT NULL,
    "hire_date" date   NOT NULL,
    CONSTRAINT "pk_Employees" PRIMARY KEY (
        "emp_no"
     )
);

CREATE TABLE "Titles" (
    "title_id" varchar(30)   NOT NULL,
    "title" varchar(255)   NOT NULL,
    CONSTRAINT "pk_Titles" PRIMARY KEY (
        "title_id"
     )
);

CREATE TABLE "Salaries" (
    "emp_no" int   NOT NULL,
    "salary" int   NOT NULL
);

CREATE TABLE "Dept_Managers" (
    "dept_no" varchar(30)   NOT NULL,
    "emp_no" int   NOT NULL
);

CREATE TABLE "Dept_Employees" (
    "emp_no" int   NOT NULL,
    "dept_no" varchar(30)   NOT NULL
);

CREATE TABLE "Departments" (
    "dept_no" varchar(30)   NOT NULL,
    "dept_name" varchar(255)   NOT NULL,
    CONSTRAINT "pk_Departments" PRIMARY KEY (
        "dept_no"
     )
);

ALTER TABLE "Employees" ADD CONSTRAINT "fk_Employees_emp_title_id" FOREIGN KEY("emp_title_id")
REFERENCES "Titles" ("title_id");

ALTER TABLE "Salaries" ADD CONSTRAINT "fk_Salaries_emp_no" FOREIGN KEY("emp_no")
REFERENCES "Employees" ("emp_no");

ALTER TABLE "Dept_Managers" ADD CONSTRAINT "fk_Dept_Managers_dept_no" FOREIGN KEY("dept_no")
REFERENCES "Departments" ("dept_no");

ALTER TABLE "Dept_Managers" ADD CONSTRAINT "fk_Dept_Managers_emp_no" FOREIGN KEY("emp_no")
REFERENCES "Employees" ("emp_no");

ALTER TABLE "Dept_Employees" ADD CONSTRAINT "fk_Dept_Employees_emp_no" FOREIGN KEY("emp_no")
REFERENCES "Employees" ("emp_no");

ALTER TABLE "Dept_Employees" ADD CONSTRAINT "fk_Dept_Employees_dept_no" FOREIGN KEY("dept_no")
REFERENCES "Departments" ("dept_no");


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