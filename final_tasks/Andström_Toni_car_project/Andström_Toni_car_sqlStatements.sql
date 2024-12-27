/*Insert data to the database
Insert following data to the car database
productNumber	model	licencePlate	maxspeed	rating
2	Min IEco	ABC-987	150	**
4	FauWee	EKO-1	130	**
5	Racer	XYZ-1	50	***
6	Moustin	PEL-1	100	****
3	Ovlov	ABC-12	30	*
1	Electro	LAK-1	70	*
7	Drof	AAS-1	350	*****  */

insert into car (productNumber,model,licencePlate,maxspeed,rating)
values(2, "Min IEco", "ABC-987", 150, "**");

insert into car (productNumber,model,licencePlate,maxspeed,rating)
values(4, "FauWee", "EKO-1",130, "**");

insert into car (productNumber,model,licencePlate,maxspeed,rating)
values(5, "Racer", "XYZ-1", 50, "***");

insert into car (productNumber,model,licencePlate,maxspeed,rating)
values(6, "Moustin", "PEL-1", 100, "****");

insert into car (productNumber,model,licencePlate,maxspeed,rating)
values(3, "Ovlov", "ABC-12", 30, "*");

insert into car (productNumber,model,licencePlate,maxspeed,rating)
values(1, "Electro", "LAK-1", 70, "*");

insert into car (productNumber,model,licencePlate,maxspeed,rating)
values(7, "Drof", "AAS-1", 350, "*****");

--Getting data
--Select all columns
--Create select statement with which you get all data of the cars. All columns should be included in the resultset.

select * from car;

--Write a select statement, with which you get all data of the cars. Include into the resultset only the columns rating, maxspeed, productNumber.

select rating, maxspeed, productNumber from car;

/*Select with on
Select all cars, where the licencePlate is EKO-1
Select all cars, where the licencePlate is EKO-1 (this was twice for some reason)
Select all cars, where the maxspeed is 50*/

select * from car where licencePlate="EKO-1";
select * from car where licencePlate="EKO-1";
select * from car where maxspeed=50;

/*Update data
To see the efect of the operations, you might have to add some new data to the table before executing the operation.
Update car (productNumber is 2). New data is: licencePlate is EKO-1 and maxspeed is 150
Update car (productNumber is 1). New data is: maxspeed is 30 and model is Min IEco
Update car (productNumber on 7). New data is: model is Ovlov and rating is * and licencePlate is XYZ-1
Update car (productNumber on 2). New data is: licencePlate is XYZ-1 and rating is ***** and model is Electro*/

update car set licencePlate="EKO-1", maxspeed=150 where productNumber=2;
update car set maxspeed=30, model="Min IEco" where productNumber=1;
update car set model="Ovlov", rating="*", licencePlate="XYZ-1" where productNumber=7;
update car set licencePlate="XYZ-1", rating="*****", model="Electro" where productNumber=2;

select * from car;

/*Delete data
To see the efect of the operations, you might have to add some new data to the table before executing the operation.
Delete car, where productNumber is 1
Delete car, where productNumber is 3
Delete all cars, where model is Racer
Delete all cars, where maxspeed is 100 or maxspeed is 70
Delete all cars, where licencePlate is LAK-1 or licencePlate is AAS-1 or model is FauWee*/

delete from car where productNumber=1;
delete from car where productNumber=3;
delete from car where model="Racer";
delete from car where maxspeed=100 or maxspeed=70;
delete from car where licencePlate="LAK-1" or licencePlate="AAS-1" or model="FauWee";

select * from car;