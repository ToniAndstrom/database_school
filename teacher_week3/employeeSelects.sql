use employeedb;

select * from employee;

select firstname,lastname,department from employee;

select firstname,lastname,department from employee 
where department is not null;
select firstname,lastname from employee where department is null;

select firstname, lastname from employee 
where department is null and salary is null;

select firstname,lastname,department,salary from employee
where department is null or salary is null;

select count(*) as numberOfRows from employee;
select count(*) from employee;
select count(*) as "number of rows" from employee;
select count(*) numOfRows from employee;

select count(department) as NumOfDepts from employee;
select count(salary) as numOfSalary from employee;
select count(employeeId) as numOfRows from employee;

select count(*) as missingSalary from employee where salary is null;
select count(*)-count(salary) as missingSalary from employee;

select count(salary) as lessThan5000 from employee where salary<5000;

select min(salary) as minimum from employee;
select max(salary) as maximum from employee;
select max(salary)-min(salary) as difference from employee;

update employee set department='ict', 
salary=(select round(avg(salary),2)) 
where employeeId=3;

update employee set department = 'maintenance' where employeeId=5;

update employee set salary=2500.99 where employeeId=6;

update employee set salary = round(salary*1.1,2);

select firstname,lastname from employee 
where department in ('ict','admin');

select firstname,lastname from employee
where department='ict' or department='admin';

select firstname,lastname from employee 
where department not in ('ict','admin');

select * from employee where firstname like 'M%';
select * from employee where firstname like '%Ann';
select * from employee where firstname like '%d_';
