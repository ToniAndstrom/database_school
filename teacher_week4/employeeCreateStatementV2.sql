drop database if exists employeedb;
create database employeedb;

use employeedb;

create table employee(
    employeeId integer not null primary key,
    firstname varchar(20) not null,
    lastname varchar(30) not null,
    department varchar(15),
    salary decimal(6,2)
);

drop user if exists 'maria'@'localhost';
create user 'maria'@'localhost' identified by '1234';
grant all privileges on employeedb.* to 'maria'@'localhost';

insert into employee values(1,'Matt','River','ict',5000);
insert into employee values(2,'Mary','River','admin',6000);

insert into employee (employeeId,firstname,lastname)
values (3, 'Vera','Jones');





