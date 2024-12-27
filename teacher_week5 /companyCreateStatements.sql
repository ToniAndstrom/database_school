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
insert into department values(3,'secr','secret location',null);
insert into department values(4, 'maintenance','workshop',"We'll repair everything");
insert into department values(5,'transportation','garage',null);


insert into employee values(1,'Mary','Jones',6000,2);
insert into employee values(2,'Matt','River',4000,1);
insert into employee values(3,'Amanda','Smith',7000,2);
insert into employee values(4,'Joe','Doe',9000,3);
insert into employee values(5,'Vera','River',6500,1);
insert into employee values(6,'Peter', 'Bond',3000,5);
insert into employee values(7,'Layla','Driver',3200, 5);

drop user if exists 'bigboss'@'localhost';
create user 'bigboss'@'localhost' identified by '1234';
grant all privileges on companydb.* to 'bigboss'@'localhost';

-- you could give the user privileges to multiple databases if needed
-- grant all privileges on employeedb.* to 'bigboss'@'localhost';

select firstname,lastname,departmentName,departmentFloor from employee
inner join department 
on employee.departmentNumber=department.departmentId;





