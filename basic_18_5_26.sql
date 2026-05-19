create database may;
use may;

-- Data Definition Language - DDL

create table stud(roll int auto_increment primary key,                 -- creating table  
				 f_nm varchar(20) not null,
                 l_nm varchar(20) not null );
                 
-- alter add
alter table stud ADD mail varchar(20);
desc stud;

-- alter modify
alter table stud MODIFY mail varchar(30) unique;

-- alter rename
alter table stud RENAME column mail TO email;
desc stud;

-- alter add
alter table stud ADD address varchar(20), ADD `12th_mark` int(4);   -- adding two columns in one query
                 
alter table stud ADD father_nm varchar(20);
desc stud;
alter table stud DROP column father_nm;

alter table stud MODIFY address varchar(20) not null default 'BBSR';    -- adding defalut constraints in column

alter table stud ADD age int check (age >= 18) default 18;          -- adding age column with check 

-- inserting (Data Manupulation Langiage - DML)

insert into stud(roll, f_nm, l_nm, email, `12th_percentage`, age ) values(1, 'Aryabartta', 'Mahapatra', 'aryabartta@gmail.com', 60, 24);
select * from stud;
delete from stud where roll = 1;

alter table stud MODIFY email varchar (50);
alter table stud RENAME column `12th_mark` to `12th_percentage`;
alter table stud MODIFY roll int;

insert into stud values(2,'Apurva', 'Roy', 'apurva123@gmail.com', 'Delhi', 80, 25);
desc stud;

insert into stud values
	(3, 'Bikash', 'Sahoo', 'bikash@gmail.com', 'Nagpur', 65, 22),
    (4, 'Chintu', 'Sharma', 'chintu2004@gmail.com', 'CTC', 33, 23);
    
insert into stud values
	(5, 'Himanshu', 'Sharma', 'himanshu@gmail.com', 'Noida', 67, 21),
    (6, 'Bishwa', 'Kara', 'biswa@gmail.com', 'Hyderabad', 45, 30),
    (7, 'Swati', 'Sharma', 'swatisharma01@gmail.com', 'Kolkata', 29, 66);
    
select * from stud;

select f_nm, l_nm, age from stud where age <=25;

update stud set `12th_percentage` = 66, age = 29 where roll = 7;   -- correcting 12th-percentage and age 

commit;
