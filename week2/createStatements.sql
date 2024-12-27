show databases;
drop database if exists persondb;
create database persondb;

show databases

drop database persondb;

use persondb;

create table person(
    id integer not null primary key,
    firstname varchar(20) not null,
    lastname varchar(30) not null,
    age integer
);

show tables;

select * from person

CREATE TABLE book(
  bookId int NOT NULL,
  bookName varchar(50) NOT NULL,
  price int NOT NULL
  );

  show create table book;
  show create table person;

  drop table book;

  insert into person (id, firstname, lastname, age)
values (1, "Matt", "River", 20);

select * from person;
select firstname from person;

insert into person(id, age, lastname, firstname)
values (2, 25, "River", "Mary");

insert into person values(3, "Matt", "Jones", 30);

insert into person (id, firstname, lastname)
values (4, "Vera", "Smith");

insert into person value (5, "Arthur", "Harris", null);

select * from person;
select database;
select@@port
select@@hostname

SELECT lastname, firstname FROM person;
SELECT lastname, firstname FROM person WHERE lastname = "river";

SELECT lastname from person;
SELECT DISTINCT lastname FROM person;
SELECT DISTINCT lastname FROM person ORDER BY lastname ASC;

SELECT lastname, firstname FROM person ORDER BY lastname ASC, firstname ASC;
SELECT lastname, firstname FROM person ORDER BY lastname, firstname;
SELECT lastname, firstname FROM person ORDER BY lastname desc, firstname ASC;
select firstname, age from person ORDER BY lastname ASC;
select firstname, age from person WHERE age is not null ORDER BY lastname ASC;

select id from person where age is null;

update person set age = 10 where id = 5;
update person set age = 50 where lastname = "Harris";
update person set age = 15 where id = 4;

select * from person;

SELECT firstname, age FROM `person` WHERE age<25;
SELECT firstname, age FROM `person` WHERE age>20 and age<50;
SELECT firstname, age FROM `person` WHERE age>=20 and age<=50;
