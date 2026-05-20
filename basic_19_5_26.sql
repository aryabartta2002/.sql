-- 19th May 2026

-- DDL - DATA DEFINITION LANGUAGE, works on columns only
-- CREATE, ALTER (ADD, MODIFY, RENAME, DROP), TRUNCATE, DROP

-- CREATE 
use may;

create table college(
		clg_id int primary key, 
		location varchar(20) not null default 'BBSR',
        total_stud int,
        chairperson varchar(20)
        );
desc college;

-- ALTER

ALTER table college ADD clg_mail varchar(10);
ALTER  table college MODIFY clg_mail varchar(30);
ALTER table college RENAME column clg_mail TO clg_email;
ALTER table college ADD vice_chairperson varchar(20);
desc college;
ALTER table college DROP vice_chairperson;

-- drop table college;
-- truncate table college;

ALTER table college ADD clg_nm varchar(24) after clg_id;                         -- adding new column after some position
ALTER table college MODIFY clg_nm varchar(25) not null unique;
desc college;

-- DML - DATA MANUPULATION LANGUAGE, WORKS ON ROWS ONLY

insert into college values(1232, '', 'Varnashi', 604, 'Dillip kumar Sharma', '');  -- clg_nm and clg_email are blank
select * from college;

-- adding clg_nm and clg_email to the clg_id 1232

UPDATE college SET clg_nm = 'Varnashi College', clg_email = 'varnashiclg1232@gamil.com' where clg_id = 1232;
alter table college modify clg_nm varchar(50);  -- insufficient size for 5643 clg_id

insert into college values
	(2343, 'Ashwini Rajdhani College', 'Hyderabad', 879, 'R. Sunita Laxmi', 'aswini2001@gmail.com'),
	(5643, 'Amarnath Residence College', 'UP', 543, 'Sadhin Kumar Rao', 'amarnath2121@gmail.com'),
    (8761, 'Swayamvhu Govertment College', 'Bihar',987, 'Radha Raman Barik', 'swayambhu.gvt.clg@gmail.com'),
    (4323, 'Badrinath College', 'Badhrinath', 657, 'Ramya Biswal', 'badrinath@gmail.com'),
    (1435, 'Gandhi College', 'BBSR',654 ,'Bala Charan Mohanty', 'gandhibbsr1435@gmail.com')
;

-- DQL - DATA QUERY LANGUAGE - RETRIVE OF DATA/RECORD

select * from college;

-- TCL - TRANSACRION QUERY LANGUAGE
commit;

-- deleting

delete from college where clg_id = 1435;
select * from college where clg_id = 1435;
insert into college values(1435, 'Gandhi College', 'BBSR',654 ,'Bala Charan Mohanty', 'gandhibbsr1435@gmail.com');

-- where clause

select * from college where location = 'BBSR';
select clg_id, clg_nm, total_stud from college where total_stud >= 650;

-- wild card match

select * from college where clg_nm like 'G%';
select * from college where chairperson like '% Kumar %';

-- Aggregate Function
select sum(total_stud) from college;
select min(total_stud) from college;
select max(TOTAL_STUD) from college;
select count(total_stud) from college;
select count(*) from college;
select distinct location from college;   -- fetch all the unique location present in college table

--------------------------------------------------------------------------------------------------------------------------------

select * from student_data;
alter table student_data rename TO stud_db;

desc stud_db;

select distinct school from stud_db;   -- GP, MS
select distinct address from stud_db;  -- U, R
select distinct Mjob from stud_db;
select count(*) from stud_db where Mjob = 'at_home' and Pstatus = 'T';
select distinct age from stud_db;  -- 15, 16, 17, 18, 19, 20, 21, 22 

select count(*) from stud_db where age >= 18 and age <= 21;

select count(*) from stud_db where sex = 'F' ;

