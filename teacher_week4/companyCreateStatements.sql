drop database if exists companydb;
create database companydb;

use companydb;

create table department(
    departmentId integer not null primary key,
    departmentName varchar(20) not null,
    departmentFloor varchar(15) not null,
    departmentDescription varchar(100)
);

create table employee(
    employeeId integer not null primary key,
    firstname varchar(20) not null,
    lastname varchar(30) not null,
    salary decimal(6,2) not null,
    departmentNumber integer not null,
    foreign key (departmentNumber) references department(departmentId)
);

insert into department values(1,'ict','deep basement',null);
insert into department values(2,'admin','top floor','Great leaders');

insert into employee values(1,'Mary','Jones',6000,2);
insert into employee values(2,'Matt','River',4000,1);

select firstname,lastname,departmentName,departmentFloor from employee
inner join department 
on employee.departmentNumber=department.departmentId;




