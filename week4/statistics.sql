drop database if exists statistics;

create database statistics;

use statistics;
create table no_salary(
    employeeId integer not null primary key,
    firstname varchar(20),
    lastname varchar(30)
);
create table missing(
    id integer,
    name varchar(20)
);

insert into no_salary (employeeId, firstname, lastname)
select employeeId, firstname, lastname from employeedb.employee
where salary is null;

insert into missing (id,name)
select employeeId, firstname from employeedb.employee
where salary is null;

grant all privileges to statistics.* to "maria"@"localhost";