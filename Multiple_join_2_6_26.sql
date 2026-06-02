use jun;
-- self join

create table emp_manager (emp_id int, emp_name varchar(10), manager_id int);

insert into emp_manager values(1, 'Arya', null),
(2, 'Ravi', 1),
(3, 'Priya', 1),
(4, 'Kiran', 2),
(5, 'Neha', 2);

select e.emp_name as employee, m.emp_name as manager
from emp_manager as e
join emp_manager as m
on e.manager_id = m.emp_id;

-- Find employees reporting to Arya.

select e.emp_name as employee, m.emp_name as manager
from emp_manager as e
join emp_manager as m
on e.manager_id = m.emp_id
where m.emp_name = 'Arya';

-- Show employees who do not have a manager.

select emp_name
from emp_manager
where manager_id is null;

-- Count employees under each manager.

select 
	m.emp_name as manager, 
	count(e.emp_id) as total_employees
from emp_manager as e
join emp_manager as m
on e.manager_id = m.emp_id
group by m.emp_name;

-- Multiple Joins


use jun;

-- orders

create table orders(order_id int, customer_id int);
insert into orders values
(1, 101),
(2, 102),
(3, 101);

-- customers

create table customers(customer_id int, customer_name varchar(10));
insert into customers values
(101, 'Amit'),
(102, 'Sita');


-- order_item

create table order_item(order_id int, product_id int);
insert into order_item values
(1, 201),
(1, 202),
(2, 203),
(3, 201);

-- products

create table products(product_id int, product_name varchar(10));
insert into products values
(201, 'Laptop'),
(202, 'Mouse'),
(203, 'Keyboard');

-- 1. Display customer name and their orders.

select distinct
	c.customer_name as Customer,
    p.product_name as Products
from customers as c
inner join orders as o
on c.customer_id = o.customer_id
join order_item as oi
on o.order_id = oi.order_id
join products as p
on oi.product_id = p.product_id;

-- 2. Display customer name, order id, and product name.

select 
	c.customer_name as Customer,
    o.order_id as OrderId,
    p.product_name as Products
from customers as c
inner join orders as o
on c.customer_id = o.customer_id
join order_item as oi
on o.order_id = oi.order_id
join products as p
on oi.product_id = p.product_id;

-- 3. Find customers who purchased a Laptop.

select distinct
	c.customer_name as Customer,
    p.product_name as Product
from customers as c
inner join orders as o
on c.customer_id = o.customer_id
join order_item as oi
on o.order_id = oi.order_id
join products as p
on oi.product_id = p.product_id
where p.product_name = 'Laptop';

-- 4. Count total products purchased by each customer.

select 
	c.customer_name as Customer,
    count(p.product_name) as Total_Product
from customers as c
inner join orders as o
on c.customer_id = o.customer_id
join order_item as oi
on o.order_id = oi.order_id
join products as p
on oi.product_id = p.product_id
group by c.customer_name;


-- 5.Find the most purchased product

select 
	p.product_name as Most_Purchased_Product,
    count(p.product_name) as Total_Product
from 
order_item as oi
join products as p
on oi.product_id = p.product_id
group by p.product_name
order by Total_Product desc
limit 1 offset 0;




