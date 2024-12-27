use companydb;

select * from department;
select * from employee;

select firstname, salary from employee where lastname='River';

select firstname, lastname, departmentName from employee
inner join department on departmentNumber=departmentId;

select firstname, lastname, departmentFloor from employee
inner join department on employee.departmentNumber=department.departmentId;

select firstname,lastname from employee
inner join department on departmentNumber=departmentId
where departmentName='ict';

select firstname,lastname from employee
where departmentNumber=1;

select firstname,lastname from employee,department
where departmentNumber=departmentId and departmentName='ict';

select lastname, firstname, departmentName from employee
inner join department on departmentNumber=departmentId
order by departmentFloor asc, lastname asc, firstname asc;

select departmentFloor,lastname, firstname, departmentName from employee
inner join department on departmentNumber=departmentId
order by departmentFloor asc, lastname asc, firstname asc;


select departmentFloor,lastname, firstname, departmentName from employee
inner join department on departmentNumber=departmentId
order by departmentFloor asc;

select * from employee
inner join department on departmentNumber=departmentId;

select avg(salary) as average from employee
inner join department on departmentNumber=departmentId
where departmentName='admin';


select departmentName, avg(salary) as average from employee
inner join department on departmentNumber=departmentId
group by departmentName;

select departmentName, count(employeeId) as numberOfEmployees from employee
inner join department on departmentNumber=departmentId
group by departmentName;

select departmentName, count(employeeId) as numberOfEmployees from employee
inner join department on departmentNumber=departmentId
group by departmentName
order by numberOfEmployees desc;

select departmentName, count(employeeId) as numberOfEmployees from employee
inner join department on departmentNumber=departmentId
group by departmentName
order by numberOfEmployees desc, departmentName asc;

select departmentName, count(employeeId) as numberOfEmployees from employee
inner join department on departmentNumber=departmentId
group by departmentName having numberOfEmployees>1
order by numberOfEmployees desc, departmentName asc;

select departmentName, count(employeeId) as numberOfEmployees from employee
inner join department on departmentNumber=departmentId
where departmentName in('ict','admin','secr')
group by departmentName having numberOfEmployees>1
order by numberOfEmployees desc, departmentName asc;

select departmentName, count(employeeId) as numberOfEmployees from employee
inner join department on departmentNumber=departmentId
where departmentName in('ict','admin','secr')
group by departmentName
order by numberOfEmployees desc, departmentName asc;

select departmentName, count(employeeId) as employees from department
left join employee on departmentNumber=departmentId
group by departmentName;

select departmentName, count(employeeId) as employees from department
left join employee on departmentNumber=departmentId
group by departmentName having employees=0;

select departmentName, count(employeeId) as employees from department
inner join employee on departmentNumber=departmentId
group by departmentName;

select departmentName, count(employeeId) as employees from employee
right join department on departmentNumber=departmentId
group by departmentName;

select departmentName, count(employeeId) as employees, min(salary) as min,
max(salary) as max, round(avg(salary),2) as average from department
left join employee on departmentNumber=departmentId
group by departmentName;

select departmentName, count(employeeId) as employees, min(salary) as min,
max(salary) as max, round(avg(salary),2) as average from department
inner join employee on departmentNumber=departmentId
group by departmentName;

select departmentName, count(employeeId) as employees, min(salary) as min,
max(salary) as max, round(avg(salary),2) as average,
sum(salary) as salaries from department
inner join employee on departmentNumber=departmentId
group by departmentName
order by salaries desc;

select departmentName, count(employeeId) as employees, min(salary) as min
from department
left join employee on departmentNumber=departmentId
group by departmentName;

select departmentName, count(employeeId) as employees, coalesce(min(salary),0) as min
from department
left join employee on departmentNumber=departmentId
group by departmentName;

select firstname, lastname, departmentName, salary, case 
when salary>(select avg(salary) from employee) then 'more than average'
when salary<(select avg(salary) from employee) then 'less than average'
else 'on the average' end as salarylevel from employee
inner join department on departmentNumber=departmentId;

select @avg:=round(avg(salary),2) from employee;
select firstname, lastname, departmentName, salary, case 
when salary>@avg then 'more than average'
when salary<@avg then 'less than average'
else 'on the average' end as salarylevel from employee
inner join department on departmentNumber=departmentId;

