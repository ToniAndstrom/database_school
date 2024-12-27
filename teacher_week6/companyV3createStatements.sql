drop database if exists companydbV3;
create database companydbV3;

use companydbV3;

create table department(
    departmentId integer not null primary key,
    departmentName varchar(20) not null,
    departmentFloor varchar(15) not null,
    departmentDescription varchar(100)
);

create table workerPosition(
    positionId integer not null primary key,
    positionName varchar(20) not null,
    positionRank integer not null,
    positionDescription varchar(100)
);

create table employee(
    employeeId integer not null primary key,
    firstname varchar(20) not null,
    lastname varchar(30) not null,
    salary decimal(6,2) not null
);

create table workerOfDepartment(
    departmentId integer not null,
    employeeId integer not null,
    positionId integer not null,
    primary key(departmentId, employeeId, positionId),
    foreign key (departmentId) references department (departmentId),
    foreign key (employeeId) references employee (employeeId),
    foreign key (positionId) references workerPosition (positionId)
);

insert into department values(1,'ict','deep basement',null);
insert into department values(2,'admin','top floor','Great leaders');
insert into department values(3,'secr','secret location',null);
insert into department values(4, 'maintenance','workshop',"We'll repair everything");
insert into department values(5,'transportation','garage',null);

insert into workerPosition values(1,'worker',10,null);
insert into workerPosition values(2,'leader',1,'Head of the department');
insert into workerPosition values(3,'leader',2,'Vice Head of the department');

insert into employee values(1,'Mary','Jones',6000);
insert into employee values(2,'Matt','River',4000);
insert into employee values(3,'Amanda','Smith',7000);
insert into employee values(4,'Joe','Doe',9000);
insert into employee values(5,'Vera','River',6500);
insert into employee values(6,'Peter', 'Bond',3000);
insert into employee values(7,'Layla','Driver',3200);

insert into workerOfDepartment (departmentId,employeeId,positionId) values(1,1,1);
insert into workerOfDepartment (departmentId,employeeId,positionId) values(1,2,1);
insert into workerOfDepartment (departmentId,employeeId,positionId) values(1,2,3);
insert into workerOfDepartment (departmentId,employeeId,positionId) values(1,5,2);
insert into workerOfDepartment (departmentId,employeeId,positionId) values(2,1,2);
insert into workerOfDepartment (departmentId,employeeId,positionId) values(4,5,2);
insert into workerOfDepartment (departmentId,employeeId,positionId) values(5,6,1);
insert into workerOfDepartment (departmentId,employeeId,positionId) values(5,7,2);
insert into workerOfDepartment (departmentId,employeeId,positionId) values(4,1,1);

select lastname, firstname, departmentName, positionName from employee
inner join workerOfDepartment on workerOfDepartment.employeeId=employee.employeeId
inner join department on workerOfDepartment.departmentId = department.departmentId
inner join workerPosition on workerOfDepartment.positionId= workerPosition.positionId
order by departmentName asc, lastname asc, firstname asc;

select departmentName,lastname, firstname, positionName from employee
inner join workerOfDepartment on workerOfDepartment.employeeId=employee.employeeId
inner join department on workerOfDepartment.departmentId = department.departmentId
inner join workerPosition on workerOfDepartment.positionId= workerPosition.positionId
order by departmentName asc, lastname asc, firstname asc;

select departmentName,lastname, firstname, positionName from employee
natural join workerOfDepartment
natural join department
natural join workerPosition
order by departmentName asc, lastname asc, firstname asc;

select departmentName,lastname, firstname, positionName from employee
natural join workerOfDepartment
natural join department
natural join workerPosition
where positionName='leader'
order by departmentName asc, lastname asc, firstname asc;

select departmentName,lastname, firstname, positionName from employee
natural join workerOfDepartment
natural join department
natural join workerPosition
order by departmentName asc, positionRank asc, lastname asc, firstname asc;

select departmentName,lastname, firstname, positionDescription from employee
natural join workerOfDepartment
natural join department
natural join workerPosition
order by departmentName asc, positionRank asc, lastname asc, firstname asc;

select departmentName,lastname, firstname, positionDescription from employee
natural join workerOfDepartment
natural join department
natural join workerPosition
where departmentName='ict'
order by departmentName asc, positionRank asc, lastname asc, firstname asc;

select departmentName,lastname, firstname, case
    when positionDescription is not null then positionDescription
    else '' end as description
from employee
natural join workerOfDepartment
natural join department
natural join workerPosition
where departmentName='ict'
order by departmentName asc, positionRank asc, lastname asc, firstname asc;

select departmentName,lastname, firstname, case
    when positionDescription is not null then positionDescription
    else '-- no job description --' end as description
from employee
natural join workerOfDepartment
natural join department
natural join workerPosition
where departmentName='ict'
order by departmentName asc, positionRank asc, lastname asc, firstname asc;