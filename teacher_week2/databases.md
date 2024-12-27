# Databases

Database system (engine) includes database handling programs such as manipulating data and manipulating database structure and users etc.

-   relation databases
    -   sql language
-   non-relational databases
    -   NoSql (for example mongoDb)

## Datastorage usage (here database)

`client application`  
    | (API, for example fetch)  
------------------------------ (backend)
`datastorage layer`  
    | (API, for example SQL)  
`database engine`  
    | (API, read/write disk etc.)  
`disk storage` (permanent storage)  

## Realtional database

### **person**-table
`columns`
id   |firstname |lastname |age        | -  
:---:|---       |---      |:---:      |---
1    |'Matt'    |'River'  |20         |   `row`
2    |'Mary'    |'River'  |25         |   `row`  
3    |'Matt'    |'Jones'  |30         |   `row`  

## compared to csv
```csv
id,firstname,lastname,age  
1,Matt,River,20 
2,Mary,River,25 
3,Matt,Jones,30 
```

## create table with sql
```sql
create table person(
    id integer not null primary key,
    firstname varchar(20) not null,
    lastname varchar(30) not null,
    age integer
);
```
```sql
insert into person (id, firstname, lastname, age)
values (1,'Matt','River',20);
```


