show databases;
drop database if exists persondb;
create database persondb;

show databases;

use persondb;

create table person(
    id integer not null primary key,
    firstname varchar(20) not null,
    lastname varchar(30) not null,
    age integer
);

show tables;

select * from person;

create table book(
    bookId integer not null primary key,
    bookName varchar(50) not null,
    price integer not null
);

describe book;
describe person;

show create table book;
show create table person;

drop table book;
show tables;

insert into person (id, firstname, lastname, age)
values (1,'Matt','River',20);

select * from person;
select firstname from person;

insert into person (id, age, lastname, firstname)
values(2,25,'River','Mary');

insert into person values (3,'Matt', 'Jones',30);

insert into person (id, firstname, lastname)
values (4, 'Vera','Smith');

insert into person values(5,'Arthur','Harris',null);


select * from person;
select database();
select @@PORT;
select @@hostname;

select * from person;
select lastname, firstname from person;
select lastname,firstname from person where lastname='River';
select distinct lastname from person;
select distinct lastname from person order by lastname asc;
select lastname,firstname from person order by lastname asc,firstname asc;
select lastname,firstname from person order by lastname,firstname;
select lastname,firstname from person order by lastname desc, firstname asc;
select firstname,age from person order by lastname asc;

select firstname,age from person 
where age is not null 
order by lastname asc;

update person set age=10 where id =5;
update person set age=50 where lastname='Harris';
update person set age=15 where id=4;
select * from person;
select firstname,age from person where age>20 and age<50;
select firstname,age from person where age>=20 and age<50;