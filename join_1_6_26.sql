
create database jun;
use jun;

create table emp(emp_id int, emp_name varchar(10), dept_id int, sal int);
insert into emp values
(1, 'Arya', 101, 50000),
(2, 'Ravi', 102, 60000),
(3, 'Priya', 101, 55000),
(4, 'Kiran', NULL, 45000),
(5, 'Neha', 103, 70000);

create table dept(dept_id int, dept_name varchar(10));
insert into dept values
(101, 'HR'),
(102, 'IT'),
(103, 'Finance'),
(104, 'Marketing');

-- 1. Display employee name and department name.

select e.emp_name, d.dept_name
from emp as e 
inner join dept as d
on e.dept_id = d.dept_id;


-- 2. Show employee name, department name, and salary.

select e.emp_name, d.dept_name, e.sal
from emp as e
inner join dept as d
on e.dept_id = d.dept_id;

--  3. List employees who belong to the IT department.

select e.emp_name
from emp as e 
inner join dept as d
on e.dept_id = d.dept_id
where d.dept_name = 'IT';

-- 4. Find employees whose salary is greater than 55000 along with their department names.

select e.emp_name, d.dept_name
from emp as e
inner join dept as d
on e.dept_id = d.dept_id
where e.sal > 55000;

-- 5. Count employees in each department.

select count(e.emp_name), d.dept_name
from emp as e
inner join dept as d
on e.dept_id = d.dept_id
group by d.dept_name;

-- 6. Show all employees along with their department names.

select e.emp_name, d.dept_name
from emp as e
left join dept as d
on e.dept_id = d.dept_id;

-- 7. Find employees who are not assigned to any department.

select e.emp_name
from emp as e 
left join dept as d
on e.dept_id = d.dept_id
where d.dept_name is null;

-- 8. Display employee names and department names, replacing NULL department names with "Not Assigned"

select e.emp_name, ifnull(d.dept_name, 'Not Assigned') as dept_name
from emp as e
left join dept as d
on e.dept_id = d.dept_id;

-- 9. Count total employees in each department including departments with zero employees.

select d.dept_name, count(e.emp_name) as total_emp
from emp as e
right join dept as d
on e.dept_id = d.dept_id
group by d.dept_name;

-- 10. Find departments that have no employees.

select d.dept_name, count(e.emp_name)
from emp as e
right join dept as d
on e.dept_id = d.dept_id
where e.emp_name is null
group by d.dept_name;

-- 11. Display all departments and their employees.

select d.dept_name, e.emp_name
from emp as e
right join dept as d
on e.dept_id = d.dept_id;

