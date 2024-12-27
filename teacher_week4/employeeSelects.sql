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
-- next selects count all rows (same as count(*))
select count(employeeId) as numOfRows from employee; -- primary key, not null
select count(firstname) as firstNameCount from employee; -- not null
select count(lastname) as lastNameCount from employee; --not null

select count(salary) as missingSalary from employee where salary is null; -- results 0
select count(*) as missingSalary from employee where salary is null;
select count(*)-count(salary) as missingSalary from employee;

select count(salary) as lessThan5000 from employee where salary<5000;

select min(salary) as minimum from employee;
select max(salary) as maximum from employee;
select max(salary)-min(salary) as difference from employee;


-- mysql and mariadb
update employee,
(select round(avg(salary),2) as average from employee) as tmp
set employee.salary=tmp.average, department='ict'
where employeeId=9;

update employee,
(select round(avg(salary),2) as average from employee) as tmp
set employee.salary=tmp.average, department='ict'
where employeeId=3;

select avg(salary) from employee;
select round(avg(salary),2) from employee;
select truncate(avg(salary),2) from employee;
select ceiling(avg(salary)) from employee;
select ceil(avg(salary)) from employee;
select floor(avg(salary)) from employee;
select floor(salary) from employee;

update employee set department = 'maintenance' where employeeId=5;

update employee set salary=2500.99 where employeeId=6;

update employee set salary = round(salary*1.1,2);

-- update employee set department='x', salary=2345, firstname='a' where employeeId=9;

-- update employee set department='ict';

select firstname,lastname from employee 
where department in ('ict','admin');

select firstname,lastname from employee
where department='ict' or department='admin';

select firstname,lastname from employee 
where department not in ('ict','admin');

select * from employee where firstname like 'M%';
select * from employee where firstname like '%Ann';
select * from employee where firstname like '%d_';


select * from employee where lastname like '%lk%';
select * from employee where lastname like '%i%';
select * from employee where lastname like '_i%';
select * from employee where lastname like '__i__';
select * from employee where lastname like '_i%' and lastname like '%r';
select * from employee where lastname like '_i%r';
select * from employee 
where lastname like '_____' and lastname like '%i%';

insert into employee values (11, 'Mary_Ann', 'Brown','ict',5000);

select * from employee where firstname like "Mary_Ann";
select * from employee where firstname = "Mary_Ann";
select * from employee where firstname like "Mary\_Ann";
select * from employee where firstname like "Mary Ann";

insert into employee values (12, 'Mary_Joan', 'Green','ict',5000);
select * from employee where firstname like "Mary\_%";
select * from employee where firstname like "Mary\_J%";
select * from employee where firstname like "Mary-%";
insert into employee values (13, 'Mary%Joan', 'Green','ict',5000);
select * from employee where firstname like "Mary%";
select * from employee where firstname like "Mary\%";
select * from employee where firstname like "Mary\%%";
select * from employee where firstname = 'Mary%Joan';

select lastname, salary from employee 
where salary between 4000 and 6000;

select lastname, salary from employee
where salary>=4000 and salary<=6000;

update employee set salary=null where employeeId=9;

select firstname,lastname, case
    when salary is null then 'salary missing'
    else '-' end as note
from employee;

select firstname,lastname, case
    when salary is null then 'salary missing'
    end as note
from employee;

select firstname,lastname, case
    when salary is null then 'salary missing'
    else '' end as note
from employee;

select firstname,lastname, case
    when salary is null then 'salary missing'
    else salary end as note
from employee;

select firstname,lastname,salary, case
    when salary=(select min(salary) from employee) then 'min'
    when salary=(select max(salary) from employee) then 'max'
    else '-' end as minmax
from employee;

select firstname,lastname,salary, case
    when salary=(select min(salary) from employee) then 'min'
    when salary=(select max(salary) from employee) then 'max'
    when salary >(select avg(salary) from employee) then 'more than avg'
    else '-' end as minmax
from employee;

update employee set salary=7700 where employeeId=9;


select firstname,lastname,salary, 
    case
        when salary=(select min(salary) from employee) then 'min'
        when salary=(select max(salary) from employee) then 'max'
        else '-' end as minmax,
    case
        when salary >(select avg(salary) from employee) then 'more than avg'
        else '-' end as note
from employee;

select lastname, count(*) as amount from employee
group by lastname;

select lastname, count(*) as amount from employee
group by lastname
order by amount asc, lastname asc;

select lastname, count(*) as amount from employee
group by lastname
order by amount desc, lastname asc;

select lastname, count(*) as amount from employee
group by lastname having amount>1
order by amount desc, lastname asc;

insert into employee values (14, 'Mary', 'Jones','ict',5000);

select lastname, count(*) as amount from employee
group by lastname having amount>1
order by amount desc, lastname asc;

delete from employee where employeeId=14;
delete from employee where department='admin';
delete from employee where salary>3000 and salary<4000;
delete from employee where salary=(select max(salary) from employee); -- check this!
delete from employee where salary=5000 or lastname='Jones';

delete from employee where salary=4400 and department='ict';
delete from employee; -- deletes all rows!!!!!