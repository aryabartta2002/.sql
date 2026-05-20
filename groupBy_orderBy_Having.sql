
use may;
select * from empdb;

-- total number of employees
select count(*) from empdb; -- 599

-- columns
desc empdb;

-- Top 10 experienced employees
select * from empdb order by experience_years desc limit 10;

-- Find employees whose salary is greater than 50000
select * from empdb where salary >= 90000;

-- Find employees working in IT department
select * from empdb where department = 'HR';

-- Find female employees
select * from empdb where gender = 'Female';

-- Find employees with more than 5 years of experience
select * from empdb where experience_years > 5;

-- Find employees located in Hyderabad
select * from empdb where location = 'New york';

-- Find employees whose education level is Master
select * from empdb where education_level = 'Master';

-- Find employees between age 25 and 35
select * from empdb where age between 25 and 35;

-- ORDER BY practice question

-- Sort employees by salary ascending
select * from empdb order by salary;

-- Sort employees by salary descending
select * from empdb order by salary desc;

-- Sort employees by age
select * from empdb order by age;

-- Display top 5 highest paid employees
select * from empdb order by salary desc limit 5;

-- Sort employees first by department then by salary 
select * from empdb order by department, salary;

-- Sort employees by experience years descending
select * from empdb order by experience_years desc;

-- GROUP BY Practice Questions

-- Count employees in each department
select department, count(*) as total_emp from empdb group by department;

-- Engineering	96    -- engineering emp are 96
-- Sales	105       -- sales emp are 105
-- Finance	99        -- finance emp are 99
-- HR	112
-- Marketing	81
-- Product	106

-- Find average salary by department
select department, avg(salary) as avg_salary from empdb group by department;

-- Find average salary by department in round off
select department, round(avg(salary)) as round_avg_sal from empdb group by department;

-- Find maximum salary in each department
select department, max(salary) as max_sal from empdb group by department;

-- Find average experience by gender
select gender, avg(experience_years) as avg_exp from empdb group by gender;

-- Count employees by education level
select education_level, count(*) from empdb group by education_level;

-- Find total salary department-wise
select department, sum(salary) from empdb group by Department;

-- HAVING Clause Practice Questions

-- Departments having more than 5 employees
select department, count(*) as total_emp from empdb group by department having count(*) > 5;

-- Departments with average salary greater than 60000
select department, avg(salary) as avg_sal from empdb group by department having avg(salary) > 60000;

-- Locations having more than 3 employees
select location, count(*) from empdb group by location having count(*) > 3;

-- Education levels with average salary greater than 50000
select education_level, avg(salary) as avg_sal from empdb
 group by education_level 
 having avg(salary) > 50000;
 
 -- Departments where maximum salary exceeds 100000
 select department, max(salary) from empdb group by department having max(salary) > 100000;
 
 -- Mixed Practice Questions (Important)
 -- Find top 3 highest paid employees in HR department
 select * from empdb where department = 'HR';
 
 -- Find average salary of employees older than 30
 select avg(salary) from empdb where age > 30;
 
 -- Count male and female employees department-wise
 select department, gender, count(*) from empdb
 group by department, gender;
 
 -- Departments where average experience is greater than 4 years
 select department, avg(experience_years) as avg_exp from empdb
 group by department
 having avg(experience_years) > 4;
 
 -- Find employees whose names start with 'A'
 select * from empdb where name like 'A%';
 
 -- Interview-Level Practice
 
 -- Find second highest salary
  select max(salary) from empdb
 where salary < (select max(salary) from empdb);
 
 -- Show all employees whose salary is less than the maximum salary
 select * from empdb
 where salary < (select max(salary) from empdb);  
 
 select salary from empdb order by salary desc; 
 
-- Employees having the same name and department more than once
select name, department, count(*) as total from empdb
group by name, department having count(*) > 1;

-- Find duplicate employee names
select name, count(*) from empdb
group by name
having count(*) > 1;

-- Find departments with lowest average salary
select department, avg(salary) as avg_sal from empdb
group by department
order by avg_sal asc;

-- Find highest salary in each location
select location, max(salary) as max_sal_location from empdb 
group by location;