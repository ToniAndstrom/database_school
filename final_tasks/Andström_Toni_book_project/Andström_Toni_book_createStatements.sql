--Write create statements to create a database called bookdb.

drop database if exists bookdb;
create database bookdb;

use bookdb;

--Create a table book, for book data. Table columns are:
--bookID integer
--name varchar(45)
--author varchar(20)
--year integer
--genre varchar(18)
--All columns are mandatory. The primary key is bookID.

create table book(
bookID integer not null primary key,
name varchar(45) not null,
author varchar(20) not null,
year integer not null,
genre varchar(18) not null
);

--Add two insert statements into the create statements for testing.

insert into book (bookID,name,author,year,genre)
values(23, "Lord of the Rings", "J.R.R. Tolkien", 1954, "fantasy");
insert into book (bookID,name,author,year,genre)
values(25, "Moby Dick", "Herman Melville", 1851, "adventure");

--Create user mia@localhost with password rxQqHhYz. Grant all necessary privileges to the user.
drop user if exists "mia"@"localhost";
create user "mia"@"localhost" identified by "rxQqHhYz";
grant all privileges on bookdb.* to "mia"@"localhost";