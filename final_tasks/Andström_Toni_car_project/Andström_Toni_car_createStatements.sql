--Write create statements to create a database called cardb.

drop database if exists cardb;
create database cardb;

use cardb;
/*
Create a table car, for car data. Table columns are:
productNumber integer
model varchar(15)
licencePlate varchar(8)
maxspeed integer
rating varchar(6)
All columns are mandatory. The primary key is productNumber.*/


create table car(
    productNumber integer not null primary key,
    model varchar(15) not null,
    licencePlate varchar(8) not null,
    maxspeed integer not null,
    rating varchar(6) not null
);


--Add two insert statements into the create statements for testing.

insert into car (productNumber,model,licencePlate,maxspeed,rating)
values(14, "Micra", "TPS-02", 150, "****");

insert into car (productNumber,model,licencePlate,maxspeed,rating)
values(15, "Skyline", "IHQ-999", 200, "*****");

--Create user benjamin@localhost with password JOYbTIcb. Grant all necessary privileges to the user.

drop user if exists "benjamin"@"localhost";
create user "benjamin"@"localhost" identified by "JOYbTIcb";
grant all privileges on cardb.* to "benjamin"@"localhost";