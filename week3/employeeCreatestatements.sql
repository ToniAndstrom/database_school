drop database if exists employeedb;
create database employeedb;

use employeedb;(jos et käytä tätä niin create table eteen määritä database kuten alla ja kohdassa insert into)

create table employeedb.employee(
employeeId integer not null primary key,
firstname varchar(20) not null, 
lastname varchar(20) not null,
department varchar(15),
salary decimal(6,2)
);

drop user if exists "Maria"@"localhost";
create user "Maria"@"localhost"; identified by "1234";
grant all privileges on employeedb.* to "Maria"@"localhost";

insert into employeedb.employee values(1, "Matt", "River", "ict", 5000);
insert into employeedb.employee values(2, "Mary", "River", "admin", 6000);
insert into employeedb.employee (employeeId, firstname, lastname)
values(3, "Vera", "Jones");