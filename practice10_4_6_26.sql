
use jun;

create table patient ( patient_id int, first_name varchar(20), last_name varchar(20), objection varchar(20), admission_date date, release_date date, allergies varchar(15));

INSERT INTO patient VALUES 
(1, 'Amit', 'Das', 'Fever', '2026-05-01', '2026-05-05', 'None'),
(2, 'Riya', 'Sen', 'Diabetes', '2026-04-20', '2026-04-28', 'Dust'),
(3, 'Karan', 'Patel', 'Fracture', '2026-03-10', '2026-03-25', 'Penicillin'),
(4, 'Sneha', 'Mohanty', 'Asthma', '2026-05-10', '2026-05-18', 'Pollen'),
(5, 'Rahul', 'Verma', 'Typhoid', '2026-02-15', '2026-02-28', 'None'),
(6, 'Pooja', 'Nayak', 'Migraine', '2026-01-05', '2026-01-08', 'Smoke'),
(7, 'Arjun', 'Reddy', 'COVID', '2026-03-01', '2026-03-12', 'Cold Air'),
(8, 'Meera', 'Iyer', 'BP', '2026-04-01', '2026-04-07', 'Salt'),
(9, 'Sahil', 'Gupta', 'Infection', '2026-05-15', '2026-05-20', 'Seafood'),
(10, 'Ananya', 'Jena', 'Allergy', '2026-02-01', '2026-02-04', 'Peanuts');

-- 1. Display all records from the patient table.
select * 
from patient;

-- 2. Find the first name and last name of all patients.
select concat(first_name, ' ', last_name) as full_name 
from patient;

-- 3. Show patients who were admitted after 2026-04-01.
select * 
from patient 
where admission_date > 2026-04-01;

-- 4. List all patients who have no allergies (allergies = 'None').
select * 
from patient 
where allergies = 'none';

-- 5. Display patient details sorted by admission_date (latest first).
select * 
from patient 
order by admission_date desc;

-- 6. Count the total number of patients in the table.
select count(*) as total_patients 
from patient;

-- 7. Find patients whose objection is 'Fever' or **'COVID'`.
select * from patient where objection in ('Fever', 'COVID');

-- 8. Display patients whose hospital stay was more than 10 days. (hint: use DATEDIFF)
select * from patient 
where datediff(release_date, admission_date) > 10;

-- 9. Find the earliest admitted patient.
select first_name, last_name, admission_date
from patient
order by admission_date 
limit 1;

-- 10.Find the patient(s) who stayed in the hospital the longest. (use difference between admission_date and release_date)

select * 
from patient
where datediff(release_date, admission_date) =
(select max(datediff(release_date, admission_date)) from patient);