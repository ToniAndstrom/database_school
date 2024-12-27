drop database if exists companydbV2;
create database companydbV2;

use companydbV2;

create table department(
    departmentId integer not null primary key,
    departmentName varchar(20) not null,
    departmentFloor varchar(15) not null,
    departmentDescription varchar(100)
);

create table workerPosition(
    positionId integer not null primary key,
    positionName varchar(20) not null,
    positionDescription varchar(100)
);

create table employee(
    employeeId integer not null primary key,
    firstname varchar(20) not null,
    lastname varchar(30) not null,
    salary decimal(6,2) not null,
    departmentId integer not null,
    positionId integer not null,
    foreign key (departmentId) references department(departmentId),
    foreign key (positionId) references workerPosition(positionId)
);

insert into department values(1,'ict','deep basement',null);
insert into department values(2,'admin','top floor','Great leaders');
insert into department values(3,'secr','secret location',null);
insert into department values(4, 'maintenance','workshop',"We'll repair everything");
insert into department values(5,'transportation','garage',null);

insert into workerPosition values(1,'worker',null);
insert into workerPosition values(2,'leader','Head of the department');

insert into employee values(1,'Mary','Jones',6000,2,1);
insert into employee values(2,'Matt','River',4000,1,1);
insert into employee values(3,'Amanda','Smith',7000,2,2);
insert into employee values(4,'Joe','Doe',9000,3,1);
insert into employee values(5,'Vera','River',6500,1,2);
insert into employee values(6,'Peter', 'Bond',3000,5,1);
insert into employee values(7,'Layla','Driver',3200, 5,2);

select * from employee;
select * from department;
select * from workerPosition;

select firstname, lastname, departmentName,positionName from employee
inner join department on employee.departmentId = department.departmentId
inner join workerPosition on employee.positionId = workerPosition.positionId;

select firstname, lastname, departmentName,positionName from employee
inner join department on employee.departmentId = department.departmentId
inner join workerPosition on employee.positionId = workerPosition.positionId
where firstname='Peter' and lastname='Bond';

select firstname, lastname, departmentName,positionName from employee
inner join department on employee.departmentId = department.departmentId
inner join workerPosition on employee.positionId = workerPosition.positionId
where employeeId=6;

insert into employee values(8,'Peter', 'Bond',4000,3,2);

select firstname,lastname,departmentName,departmentFloor, positionName from employee
natural join department
natural join workerPosition;

select firstname,lastname,departmentName from employee
natural join department
natural join workerPosition
where positionName='leader';

update workerPosition set positionName='Big boss' where positionName='leader';

select firstname,lastname, departmentName from employee
natural join department;

select firstname,lastname from employee
natural join workerPosition
where positionName='Big boss';

update employee set positionId=2 where employeeId=6;

select firstname,lastname,departmentName from employee
natural join workerPosition
natural join department
where positionName='Big boss';
