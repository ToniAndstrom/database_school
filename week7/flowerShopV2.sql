drop database if exists flowerdbV2;
create database flowerdbV2;

 use flowerdbV2;

 create table farmer(
    farmerId integer not null primary key,
    farmName varchar (30) not null,
    farmLocation varchar (30) not null
 );

 create table growingSite(
    siteId integer not null primary key,
    siteType varchar(20),
    siteDescription varchar(100)
);

create table flower(
    flowerId integer not null primary key,
    flowerName varchar (20) not null,
    unitPrice integer not null,
    siteId integer not null,
    foreign key (siteId) references growingSite(siteId)
);

create table farmer_grows_flower(
    farmerId integer not null,
    flowerId integer not null,
    primary key (farmerId, flowerId),
    foreign key (farmerId) references farmer(farmerId),
    foreign key (flowerId) references flower(flowerId)
);

create table customer(
    customerId integer not null primary key,
    firstname varchar(20) not null,
    lastname varchar(30) not null,
    customerAddress varchar (50) not null
);

create table customerOrder(
    orderNumber integer not null primary key,
    customerId integer not null,
    orderDate date not null,
    foreign key (customerId) references customer(customerId)
    );

    create table order_has_flower(
        orderNumber integer not null,
        flowerId integer not null,
        amount integer not null,
        primary key (orderNumber,flowerId),
        foreign key (orderNumber) references customerOrder(orderNumber),
        foreign key (flowerId) references flower(flowerId)
        );

drop user if exists "farmer"@"localhost";
create user "farmer"@"localhost" identified by "secret";
grant all privileges on flowerdb. * to "farmer"@"localhost";

insert into farmer values (1, "Rosamunda", "Vantaa" );
insert into farmer values (2, "Roses of Rovaniemi", "Rovaniemi");
insert into farmer values (3, "Violets and Hyasinths", "Helsinki");

insert into growingSite (siteId,siteType) values (1,"sunny");
insert into growingSite (siteId,siteType) values (2,"shady");
insert into growingSite (siteId,siteType) values (3,"shadow");
insert into growingSite (siteId,siteType) values (4,"dry");

insert into flower values (1, "violet", 10,1);
insert into flower values (2, "rose", 30,1);
insert into flower values (3, "tulip", 5,2);
insert into flower values (4, "cactus", 60,4);

insert into farmer_grows_flower (farmerId,flowerId) values (1,4);
insert into farmer_grows_flower (farmerId,flowerId) values (2,1);
insert into farmer_grows_flower (farmerId,flowerId) values (2,2);
insert into farmer_grows_flower (farmerId,flowerId) values (3,3);
insert into farmer_grows_flower (farmerId,flowerId) values (3,4);
insert into farmer_grows_flower (farmerId,flowerId) values (1,2);

insert into customer values (1,"Matt","River", "seapath 2");
insert into customer values (1,"Mary","River", "dataway 20");

insert into customerOrder values (1,1, "2024-05-03");
insert into customerOrder values (2,1, "2024-05-02");
insert into customerOrder values (3,2, "2024-05-03");

insert into order_has_flower (orderNumber, flowerId, amount) values(1,2,10);
insert into order_has_flower (orderNumber, flowerId, amount) values(2,2,5);
insert into order_has_flower (orderNumber, flowerId, amount) values(3,1,10);
insert into order_has_flower (orderNumber, flowerId, amount) values(3,2,10);

select farmName , farmLocation from farmer
inner join farmer_grows_flower on farmer_grows_flower.farmerId = farmer.farmerId
inner join flower on farmer_grows_flower.flowerId = flower.flowerId
where flowerName="rose"
order by farmName;

select farmName , farmLocation from farmer
natural join farmer_grows_flower
natural join flower
where flowerName="rose"
order by farmName;

select flowerName from flower
natural join growingSite
where siteType="sunny";

select flowerName, amount*unitPrice as total from customerOrder
natural join  customer
natural join order_has_flower
natural join flower
where firstname = "Mary" and lastname= "River";

select flower.flowerName, 
order_has_flower.amount,
order_has_flower.amount*unitPrice as total
 from customerOrder
natural join  customer
natural join order_has_flower
natural join flower
where firstname = "Mary" and lastname= "River";