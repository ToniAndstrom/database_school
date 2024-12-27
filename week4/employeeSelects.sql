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
--next selects count() all rows (same as count(*))
select count(employeeId) as NumOfRows from employee; --primary key
select count(firstname) as FirstNameCount from employee; --not null
select count(lastname) as LastNameCount from employee; --not null

select count(salary) as MissingSalary from employee where salary is null; --results 0
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

--mysql and mariaDB



select avg(salary) from employee;
select round(avg(salary),2) from employee;
select truncate(avg(salary),2) from employee;
select ceiling(avg(salary)) from employee;
select ceil(avg(salary)) from employee; --ceil() synonym for ceiling()
select floor(avg(salary)) from employee; 
select floor((salary)) from employee; 


update employee set department=  "maintenence" where employeeId = 5;

update employee set salary = 2500.99 where employeeId = 6;

update employee set salary = round(salary*1.1,2);

--update employee set department = x, salary = 2345, firstname="a" where employeeIdid= 9;
--update employee set 

select firstname, lastname from employee where department in ("ict" ,"admin");

select firstname, lastname from employee where department="ict" or department="admin"; --you need depatment for both or it won't work

select firstname, lastname from employee where department not in ("ict" ,"admin");

select * from employee where firstname like "M%";
select * from employee where firstname like "%Ann";
select * from employee where firstname like "%d_";

select * from employee where lastname like "%lk%";
select * from employee where lastname like "%i%";
select * from employee where lastname like "_i%";
select * from employee where lastname like "__i__%";
select * from employee where lastname like "_i%" and lastname like "%r";
select * from employee where lastname like "_i%r";
select * from employee where lastname like "_____" and lastname like "%i%";

insert into employee values(11, "Mary_Ann", "Brown", "ict", 5000);

select * from employee where firstname like "Mary_Ann"; --get all 3
select * from employee where firstname like "Mary\_Ann"; -- gets Mary-Ann
select * from employee where firstname like "Mary Ann";
select * from employee where firstname like "Mary Ann";

insert into employee values(12, "Mary_Joan", "Green", "ict", 5000);
select * from employee where firstname like "Mary\_%"
select * from employee where firstname like "Mary-%";
insert into employee values(12, "Mary%Joan", "Green", "ict", 5000);
select * from employee where firstname like "Mary%";
select * from employee where firstname like "Mary\%";
select * from employee where firstname like "Mary\%%";

select * from employee where firstname = "Mary%Joan";

select lastname, salary from employee where salary between 4000 and 6000;

select lastname, salary from employee where salary>=4000 and salary<=6000;

update employee set salary= null where employeeId=9;

select firstname, lastname from employee case
 when salary=null then "slary missing"
else "-" end as note
from employee;

select firstname, lastname, case
 when salary is null then "salary missing"
end as note
from employee;

select firstname, lastname, case
 when salary is null then "salary missing"
else "" end as note
from employee;

select firstname, lastname, case
 when salary is null then "salary missing"
else salary end as note
from employee;

select firstname, lastname,salary, case
 when salary=(select min(salary) from employee) then "min"
 when salary=(select max(salary) from employee) then "max"
else "-" end as minmax
from employee;

select firstname, lastname,salary, 
case
 when salary=(select min(salary) from employee) then "min"
 when salary=(select max(salary) from employee) then "max"
 else "-" end as minmax,
case
 when salary>(select avg(salary) from employee) then "more than avg"
else "-" end as note
from employee;

update employee set salary=7700 where employeeId=9;

select lastname, count(*) as amount from employee group by lastname;

select lastname, count(*) as amount from employee
 group by lastname
 order by amount asc, lastname asc;

select lastname, count(*) as amount from employee
 group by lastname
 order by amount desc, lastname asc;

select lastname, count(*) as amount from employee
 group by lastname having amount >1
 order by amount desc, lastname asc;

insert into employee values(14, "Mary", "Jones", "ict", 5000);

delete from employee where employeeId= 14;

delete from employee where department="admin";

delete from employee where salary>3000 and salary<4000;

delete from employee where salary=5000 or lastname="Jones";

delete from employee where salary=4000 and department="ict";

delete from employee; --deletes all rows!!!

--use custom variables

set @x = 1;
select @x;

set @y = 2;
select @y;

select @avg:=round(avg(salary),2) from employee;--use at the same time

select @avg;

update employee set salary = @avg where salary<@avg;--use at the same time
delete from employee where salary = @avg;--dont work ask teacher

select round(avg(salary),2) into @a from employee;
select @a

set @z:= (select avg(salary)from employee);
select @z;

update employee set salary=3500 where salary is null;

--transactions
set autocommit=0;--autocommit is off
start transaction;
select @avg:=round(avg(salary),2) from employee;
update employee set salary = @avg where salary<@avg;
--either do:
rollback; --to reject changes(jos mokaat jotain ennen kun commit niin saat vanhan takas)
--or
commit; -- to accept changes