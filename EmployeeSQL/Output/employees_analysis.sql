--1.List the following details of each employee: employee number, last name, first name, sex, and salary.
SELECT "employees"."empl_no", "employees"."last_name", "employees"."first_name", "employees"."sex", "salaries"."salary"
FROM "employees", "salaries"
WHERE "employees"."empl_no" = "salaries"."empl_no";


--2.List first name, last name, and hire date for employees who were hired in 1986.
SELECT "first_name","last_name", "hire_date"
FROM "employees"
WHERE hire_date BETWEEN '1986-01-01' AND '1986-12-31';

--3.List the manager of each department with the following information: department number, department name, 
--the manager's employee number, last name, first name.
SELECT "manager"."dept_no", "departments"."dept_name", "manager"."empl_no", "employees"."last_name", "employees"."first_name"
FROM "manager"
    inner join "departments" on "manager"."dept_no" = "departments"."dept_no"
    inner join "employees" on "employees"."empl_no" = "manager"."empl_no";
	
--4.List the department of each employee with the following information: employee number, last name, first name, and department name.
SELECT "employees"."empl_no", "employees"."last_name", "employees"."first_name", "departments"."dept_name"
FROM "employees"
	inner join "dept_employee" on "employees"."empl_no" = "dept_employee"."empl_no"
	inner join "departments" on "dept_employee"."dept_no" = "departments"."dept_no";


--5.List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
SELECT "first_name", "last_name", "sex"
FROM "employees"
WHERE "first_name" = 'Hercules' and "last_name" like 'B%';


--6.List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT "employees"."empl_no", "employees"."last_name", "employees"."first_name", "departments"."dept_name"
FROM "employees"
	inner join "dept_employee" on "employees"."empl_no" = "dept_employee"."empl_no"
	inner join "departments" on "dept_employee"."dept_no" = "departments"."dept_no"
WHERE "dept_name" = 'Sales';






