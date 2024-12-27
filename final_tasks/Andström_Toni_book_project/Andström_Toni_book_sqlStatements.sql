/*Insert data to the database
Insert following data to the book database
bookID	name	author	year	genre
3	Rebellion of Sophie Q. Lister	Matt Wilson	2010	fiction
6	Hacking databases	Layla Jones	2005	nonfiction
1	NoSql - New Hope	Isla Shore	2012	short story
2	Maria and My	Antony Lee	2018	textbook
7	The adventures of Mike the Millipede	Felix Harris	2017	humorous essay
5	Databases - The rise and fall	Emily White	2011	chronic
4	SQL-mysteries	Jesse River	2000	poem*/

insert into book (bookID,name,author,year,genre)
values(3,"Rebellion of Sophie Q. Lister","Matt Wilson",2010,"fiction");

insert into book (bookID,name,author,year,genre)
values(6,"Hacking databases","Layla Jones",2005,"nonfiction");

insert into book (bookID,name,author,year,genre)
values(1,"NoSql - New Hope","Isla Shore",2012,"short story");

insert into book (bookID,name,author,year,genre)
values(2,"Maria and My","Antony Lee",2018,"textbook");

insert into book (bookID,name,author,year,genre)
values(7,"The adventures of Mike the Millipede","Felix Harris",2017,"humorous essay");

insert into book (bookID,name,author,year,genre)
values(5,"Databases - The rise and fall","Emily White",2011,"chronic");

insert into book (bookID,name,author,year,genre)
values(4,"SQL-mysteries","Jesse River",2000,"poem");

/*Getting data
Select all columns
Create select statement with which you get all data of the books. All columns should be included in the resultset.*/

select * from book;

--Write a select statement, with which you get all data of the books. Include into the resultset only the columns year, name, author.*/

select year, name, author from book;

/*Select with on
Select all books, where the name is Rebellion of Sophie Q. Lister
Select all books, where the name is Hacking databases
Select all books, where the year is 2012*/

select * from book where name = "Rebellion of Sophie Q. Lister";
select * from book where name = "Hacking databases";
select * from book where year = 2012;

/*Update data
To see the efect of the operations, you might have to add some new data to the table before executing the operation.
Update book (bookID is 4). New data is: year is 1990 and name is SQL-mysteries
Update book (bookID is 3). New data is: year is 1990 and genre is short story
Update book (bookID on 2). New data is: name is NoSql - New Hope and author is Jesse River and genre is short story
Update book (bookID on 3). New data is: genre is poem and year is 2000 and author is Felix Harris*/

update book set year=1990, name="SQL-mysteries" where bookID=4;
update book set year=1990, genre="short story" where bookID=3;
update book set name="NoSql - New Hope", author="Jesse River", genre="short story" where bookID=2;
update book set genre="poem", year=2000, author="Felix Harris" where bookID=3;

select * from book;

/*Delete data
To see the efect of the operations, you might have to add some new data to the table before executing the operation.
Delete book, where bookID is 1
Delete book, where bookID is 3
Delete all books, where author is Jesse River
Delete all books, where name is Rebellion of Sophie Q. Lister and genre is humorous essay
Delete all books, where genre is short story or name is NoSql - New Hope or name is Hacking databases
*/

delete from book where bookID=1;
delete from book where bookID=3;
delete from book where author="Jesse River";
delete from book where name="Rebellion of Sophie Q. Lister" and genre="humorous essay";
delete from book where genre="short story" or name="NoSql - New Hope" or name="Hacking databases";

select * from book;