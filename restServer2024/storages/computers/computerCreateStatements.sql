drop database if exists computerdb;
create database computerdb;

use computerdb;

create table computer(
    id integer not null primary key,
    name varchar(20) not null,
    type varchar(30) not null,
    processor varchar(15) not null,
    amount integer not null
);

insert into computer values(1,"Beast II","server","Selenium II",100);
insert into computer values(2, "Cera 2400", "laptop","Brain 456", 25);


drop user if exists 'oliver'@'localhost';
create user 'oliver'@'localhost' identified by '1234';
grant all privileges on computerdb.* to 'oliver'@'localhost';
