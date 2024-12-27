show databases;
use persondb;
select database();
select @@port;
show tables;
select * from person;
select firstname from person;
select DISTINCT firstname from person;
select DISTINCT firstname, lastname from person;
insert into person values(6, "Matt", "River", 60);
select * from person;
select DISTINCT firstname, lastname from person;
select firstname, lastname from person;

SELECT id, lastname, firstname, age from person WHERE age>=20 and age<=50;
SELECT lastname,firstname from person ORDER by lastname asc, firstname asc;
SELECT lastname,firstname from person ORDER by firstname asc, lastname asc;
SELECT lastname,firstname from person ORDER by age asc;
SELECT * FROM person;
SELECT * FROM `person` WHERE firstname="Matt" and lastname="River";

SELECT * FROM `person` WHERE lastname="Jones" or lastname="Harris";
SELECT * FROM `person` WHERE lastname="Jones" and lastname="Harris"; (dont work because cant have 2 lastnames)
SELECT * FROM `person` WHERE lastname in ("Jones","Harris");
SELECT * FROM `person` WHERE firstname in ("Matt", "Mary") and age<30;