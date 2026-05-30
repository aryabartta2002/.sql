-- JOIN

create database join_table;
use join_table;

create table employee(emp_id int, name varchar(10), dept_id int);

insert into employee values
(101, 'Arya', 1),
(102, 'Rahul', 2),
(103, 'Priya', 1),
(104, 'Ankit', 3),
(105, 'Neha', Null);

create table department(dept_id int, dept_name varchar(10));

insert into department values(1, 'HR'), (2, 'IT'), (3, 'Finance'), (4, 'Marketing');

-- 1. Display the employee name along with their department name.(INNER JOIN)

select e.name, d.dept_name 
from employee as e 
inner join department as d 
on e.dept_id = d.dept_id;

-- 2. Display all employees and their department names. Employees without a department should also appear. (LEFT JOIN)

select e.name, d.dept_name
from employee as e 
left join department as d
on e.dept_id = d.dept_id;

-- 3. Display all departments along with employee names. Departments without employees should also appear.(RIGHT JOIN)

select d.dept_name, e.name
from employee as e 
right join department as d
on e.dept_id = d.dept_id;

-- 4. Display only employees who belong to the IT department.(INNER JOIN with Condition)

select e.name 
from employee as e 
inner join department as d 
on e.dept_id = d.dept_id
where dept_name = 'IT';


-- 5. Employees whose department is HR or Finance.

select e.name
from employee as e 
inner join department as d
on e.dept_id = d.dept_id
where dept_name = 'HR' or dept_name = 'Finance';

-- 6. Departments with no employees.

select d.dept_name
from employee as e
right join department as d
on e.dept_id = d.dept_id
where e.name is NULL;

-- 7. Number of employees in each department.

select d.dept_name, count(e.emp_id) as emp_count
from department as d
left join employee as e
on d.dept_id = e.dept_id
group by d.dept_name;

-- 8. Employees who do not belong to any department.

select e.name
from employee as e
left join department as d
on e.dept_id = d.dept_id
where d.dept_id is null;

-- 9. Department having the maximum number of employees.

select d.dept_name, count(*) as emp_count
from employee as e 
inner join department as d
on e.dept_id = d.dept_id
group by d.dept_id, d.dept_name
order by emp_count desc
limit 1;