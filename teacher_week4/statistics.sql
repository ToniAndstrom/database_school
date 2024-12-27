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

