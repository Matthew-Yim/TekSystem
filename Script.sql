-- uses the databases
use classicmodels;
-- gives a description of the databases (shows visual table)
describe offices;

select * FROM classicmodels.customers;
SELECT * FROM employees;
/*
 *  Show all employees in office number 4
 * * means select all
 */
SELECT * FROM employees WHERE officeCode = 4;
SELECT count(*) from orders;
-- 2 columns from employees for firstname and lastname
SELECT firstName, lastName from employees;
-- 2 columns from customers but changes header from contactfirstname into 'First Name' and same for contactLastName 
SELECT contactfirstname as 'First Name', contactlastname as 'Last Name' from customers;
-- Order by descending 
SELECT contactfirstname as 'First Name', contactlastname as 'Last Name' 
from customers
order by contactLastName DESC;

select * from offices;
select count(addressline2) from offices;

SELECT DISTINCT ORDERNumber FROM orderdetails;

select * from offices;
insert into offices values('8', 'Plano', '5554443333', '123 street', null, 'TX', 'USA', '12345', 'NA');
select * from offices where officeCode = '8';
delete from offices WHERE officeCode = '8';

-- for confirmation checks (use commit after drop table to confirm otherwise rollback is return)
start transaction;
drop table offices;
rollback;


insert into offices (`officeCode`, `city`, `phone`, `addressLine1`, `country`, `postalCode`, `territory`)
values
('9', 'Plano', '5554443333', '123 street', 'USA', '12345', 'NA'),
('10', 'Plano', '5554443333', '123 street', 'USA', '12345', 'NA');

start transaction; 
select * from offices where city = 'Plano';
delete from offices  WHERE  city = 'Plano'; 
-- commit;
rollback;

