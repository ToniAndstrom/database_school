#use employeedb;

select * from employee

SELECT firstname, lastname, department FROM employee

SELECT firstname, lastname, department FROM employee where department is not null;
SELECT firstname, lastname, department FROM employee where department is null;

SELECT firstname, lastname FROM employee where department is null and salary is null;
SELECT firstname, lastname, department, salary FROM employee where department is null or salary is null;

select count(*) as numberOfRows from employee;
select count(*) from employee;
select count(*) as "number of rows" from employee;
select count(*) NumOfRows from employee;

select count(department) as NumOfDepts from employee;
select count(salary) as NumOfSalarys from employee;
select count(employeeId) as NumOfRows from employee;

select count(*) as MissingSalary from employee where salary is null;
select count(*) -count(salary) as MissingSalary from employee;

select count(salary) as lessThan 5000 from employee where salary<5000;
select min(salary) as minimum from employee;
select max(salary) as maximum from employee;
select max(salary) - min(salary) as difference from employee;
select sum(salary) as total from employee;
select avg(salary) as average from employee;
select round(avg(salary),2) as average from employee;

update employee set department="ict", salary=(select round(avg(salary),2)) where employeeId = 3;
update employee set department=  "maintenence" where employeeId = 5;
update employee set salary = 2500 where employeeId = 6;
update employee set salary = round(salary*1.1,2);

select firstname, lastname from employee where department in ("ict" ,"admin");
select firstname, lastname from employee where department not in ("ict" ,"admin");

select * from employee where firstname like "M%";
select * from employee where firstname like "%Ann";
select * from employee where firstname like "%d_";

